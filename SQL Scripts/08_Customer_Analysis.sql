
-- FILE: 08_Customer_Analysis.sql

-- TOTAL CUSTOMERS

SELECT COUNT(*) AS total_customers
FROM customer;

-- UNIQUE CUSTOMERS

SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customer;

-- CUSTOMERS BY STATE


SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customer
GROUP BY customer_state
ORDER BY total_customers DESC;

-- TOP 10 CUSTOMER CITIES


SELECT
    customer_city,
    COUNT(*) AS total_customers
FROM customer
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- TOP 10 CUSTOMERS BY SPENDING


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

-- AVERAGE CUSTOMER SPENDING


SELECT
    ROUND(AVG(customer_total),2) AS average_customer_spending
FROM
(
    SELECT
        c.customer_unique_id,
        SUM(op.payment_value) AS customer_total
    FROM customer c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
) AS customer_spending;

