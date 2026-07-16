
-- FILE: 13_CTEs.sql

-- CTE 1: Monthly Sales Revenue

WITH monthly_sales AS
(
    SELECT
        YEAR(o.order_purchase_timestamp) AS order_year,
        MONTH(o.order_purchase_timestamp) AS order_month,
        ROUND(SUM(op.payment_value),2) AS total_revenue
    FROM orders o
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY
        YEAR(o.order_purchase_timestamp),
        MONTH(o.order_purchase_timestamp)
)
SELECT *
FROM monthly_sales
ORDER BY order_year, order_month;


-- CTE 2: Top 10 Sellers by Revenue

WITH seller_sales AS
(
    SELECT
        seller_id,
        ROUND(SUM(price),2) AS total_revenue
    FROM order_items
    GROUP BY seller_id
)
SELECT *
FROM seller_sales
ORDER BY total_revenue DESC
LIMIT 10;

-- CTE 3: Customer Spending

WITH customer_spending AS
(
    SELECT
        c.customer_unique_id,
        ROUND(SUM(op.payment_value),2) AS total_spent
    FROM customer c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
)
SELECT *
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 10;

-- CTE 4: Product Category Sales

WITH category_sales AS
(
    SELECT
        p.product_category_name,
        ROUND(SUM(oi.price),2) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_category_name
)
SELECT *
FROM category_sales
ORDER BY total_sales DESC;

-- CTE 5: Delivered Orders

WITH delivered_orders AS
(
    SELECT
        order_id,
        order_purchase_timestamp,
        order_delivered_customer_date,
        DATEDIFF(order_delivered_customer_date,
                 order_purchase_timestamp) AS delivery_days
    FROM orders
    WHERE order_status = 'delivered'
)
SELECT *
FROM delivered_orders
ORDER BY delivery_days DESC
LIMIT 10;