
-- FILE: 14_Views.sql

-- VIEW 1: MONTHLY SALES

CREATE VIEW monthly_sales AS
SELECT
    YEAR(o.order_purchase_timestamp) AS order_year,
    MONTH(o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(op.payment_value),2) AS total_revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp);

-- View Result

SELECT *
FROM monthly_sales
ORDER BY order_year, order_month;

-- VIEW 2: TOP SELLERS

CREATE VIEW seller_revenue AS
SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue
FROM order_items
GROUP BY seller_id;

SELECT *
FROM seller_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- VIEW 3: CUSTOMER SPENDING

CREATE VIEW customer_spending AS
SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id;

SELECT *
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 10;

-- VIEW 4: PRODUCT CATEGORY SALES

CREATE VIEW category_sales AS
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name;

SELECT *
FROM category_sales
ORDER BY total_sales DESC;

-- VIEW 5: DELIVERY PERFORMANCE

CREATE VIEW delivery_performance AS
SELECT
    order_id,
    order_status,
    DATEDIFF(order_delivered_customer_date,
             order_purchase_timestamp) AS delivery_days
FROM orders
WHERE order_status = 'delivered';

SELECT *
FROM delivery_performance
ORDER BY delivery_days DESC
LIMIT 10;