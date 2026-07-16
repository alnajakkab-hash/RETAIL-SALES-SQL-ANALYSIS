
-- FILE: 05_Order_Analysis.sql

-- TOTAL NUMBER OF ORDERS


SELECT COUNT(*) AS total_orders
FROM orders;


-- ORDERS BY STATUS


SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- DELIVERED VS NOT DELIVERED


SELECT
CASE
WHEN order_status = 'delivered'
THEN 'Delivered'
ELSE 'Not Delivered'
END AS delivery_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY delivery_status;


-- ORDERS BY YEAR


SELECT
YEAR(order_purchase_timestamp) AS order_year,
COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY order_year;


-- ORDERS BY MONTH


SELECT
YEAR(order_purchase_timestamp) AS order_year,
MONTH(order_purchase_timestamp) AS order_month,
COUNT(*) AS total_orders
FROM orders
GROUP BY
YEAR(order_purchase_timestamp),
MONTH(order_purchase_timestamp)
ORDER BY
order_year,
order_month;


-- FIRST AND LAST ORDER DATE


SELECT
MIN(order_purchase_timestamp) AS first_order_date,
MAX(order_purchase_timestamp) AS last_order_date
FROM orders;

-- AVERAGE ORDERS PER DAY

SELECT
DATE(order_purchase_timestamp) AS order_date,
COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_purchase_timestamp)
ORDER BY order_date;

-- TOP 10 DAYS WITH HIGHEST ORDERS


SELECT
DATE(order_purchase_timestamp) AS order_date,
COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_purchase_timestamp)
ORDER BY total_orders DESC
LIMIT 10;


-- ORDERS BY WEEKDAY


SELECT
DAYNAME(order_purchase_timestamp) AS weekday,
COUNT(*) AS total_orders
FROM orders
GROUP BY DAYNAME(order_purchase_timestamp)
ORDER BY total_orders DESC;

