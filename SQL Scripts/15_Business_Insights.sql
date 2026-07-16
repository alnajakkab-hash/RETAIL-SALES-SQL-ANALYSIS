
-- FILE: 15_Business_Insights.sql

-- What is the total revenue?


SELECT
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments;

-- Which payment method generated the highest revenue?

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- Which product categories generated the highest sales?

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

-- Which sellers generated the highest revenue?

SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Which states have the highest number of customers?

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customer
GROUP BY customer_state
ORDER BY total_customers DESC;


-- What are the monthly sales trends?

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
ORDER BY
    order_year,
    order_month;

-- What is the average delivery time?

SELECT
    ROUND(AVG(DATEDIFF(order_delivered_customer_date,
                       order_purchase_timestamp)),2) AS average_delivery_days
FROM orders
WHERE order_status = 'delivered';

-- Which customers spent the most?


SELECT
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;

-- What is the distribution of order statuses?


SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Which sellers sold the most products?

SELECT
    seller_id,
    COUNT(*) AS products_sold
FROM order_items
GROUP BY seller_id
ORDER BY products_sold DESC
LIMIT 10;
