
-- FILE: 06_Sales_Analysis.sql

-- TOTAL REVENUE


SELECT
ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments;


-- MONTHLY SALES REVENUE


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

-- YEARLY SALES REVENUE


SELECT
YEAR(o.order_purchase_timestamp) AS order_year,
ROUND(SUM(op.payment_value),2) AS total_revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY YEAR(o.order_purchase_timestamp)
ORDER BY order_year;


-- AVERAGE ORDER VALUE


SELECT
ROUND(AVG(payment_value),2) AS average_order_value
FROM order_payments;


-- MINIMUM, MAXIMUM AND AVERAGE PAYMENT


SELECT
MIN(payment_value) AS minimum_payment,
MAX(payment_value) AS maximum_payment,
ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments;


-- REVENUE BY PAYMENT TYPE


SELECT
payment_type,
ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- TOP 10 HIGHEST VALUE ORDERS

SELECT
order_id,
ROUND(SUM(payment_value),2) AS order_value
FROM order_payments
GROUP BY order_id
ORDER BY order_value DESC
LIMIT 10;

-- MONTH WITH HIGHEST REVENUE


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
ORDER BY total_revenue DESC
LIMIT 1;

