
-- FILE: 11_Delivery_Analysis.sql

-- TOTAL DELIVERED VS NOT DELIVERED ORDERS

SELECT
    CASE
        WHEN order_status = 'delivered' THEN 'Delivered'
        ELSE 'Not Delivered'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY delivery_status;

-- AVERAGE DELIVERY TIME (IN DAYS)

SELECT
    ROUND(AVG(DATEDIFF(order_delivered_customer_date,
                       order_purchase_timestamp)),2) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered';

-- FASTEST DELIVERY

SELECT
    MIN(DATEDIFF(order_delivered_customer_date,
                 order_purchase_timestamp)) AS fastest_delivery_days
FROM orders
WHERE order_status = 'delivered';

-- SLOWEST DELIVERY

SELECT
    MAX(DATEDIFF(order_delivered_customer_date,
                 order_purchase_timestamp)) AS slowest_delivery_days
FROM orders
WHERE order_status = 'delivered';

-- DELIVERIES BY MONTH

SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    MONTH(order_purchase_timestamp) AS order_month,
    COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)
ORDER BY
    order_year,
    order_month;

-- LATE DELIVERIES

SELECT
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date >
      order_estimated_delivery_date;

-- ON-TIME DELIVERIES

SELECT
    COUNT(*) AS on_time_deliveries
FROM orders
WHERE order_delivered_customer_date <=
      order_estimated_delivery_date;

-- TOP 10 LONGEST DELIVERY TIMES

SELECT
    order_id,
    DATEDIFF(order_delivered_customer_date,
             order_purchase_timestamp) AS delivery_days
FROM orders
WHERE order_status = 'delivered'
ORDER BY delivery_days DESC
LIMIT 10;
