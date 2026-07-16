
-- FILE: 10_Payment_Analysis.sql


-- TOTAL NUMBER OF PAYMENTS

SELECT COUNT(*) AS total_payments
FROM order_payments;

-- PAYMENT METHODS USED

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- REVENUE BY PAYMENT METHOD

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- AVERAGE PAYMENT VALUE BY PAYMENT METHOD

SELECT
    payment_type,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments
GROUP BY payment_type
ORDER BY average_payment DESC;

-- PAYMENT INSTALLMENTS DISTRIBUTION

SELECT
    payment_installments,
    COUNT(*) AS total_orders
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- AVERAGE INSTALLMENTS BY PAYMENT METHOD

SELECT
    payment_type,
    ROUND(AVG(payment_installments),2) AS average_installments
FROM order_payments
GROUP BY payment_type
ORDER BY average_installments DESC;

-- HIGHEST PAYMENT VALUES

SELECT
    order_id,
    payment_type,
    payment_value
FROM order_payments
ORDER BY payment_value DESC
LIMIT 10;

-- MINIMUM, MAXIMUM AND AVERAGE PAYMENT VALUE

SELECT
    MIN(payment_value) AS minimum_payment,
    MAX(payment_value) AS maximum_payment,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments;
