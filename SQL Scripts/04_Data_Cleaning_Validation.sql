
-- FILE: 04_Data_Cleaning_Validation.sql


-- CHECK TOTAL RECORDS


SELECT 'customer' AS table_name, COUNT(*) AS total_records FROM customer
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation;


-- CHECK DUPLICATE PRIMARY KEYS


-- Customer

SELECT customer_id, COUNT(*)
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Orders

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Products

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Sellers

SELECT seller_id, COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- Order Items (Composite Primary Key)

SELECT
    order_id,
    order_item_id,
    COUNT(*) AS duplicate_count
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;

-- Order Payments (Composite Primary Key)

SELECT
    order_id,
    payment_sequential,
    COUNT(*) AS duplicate_count
FROM order_payments
GROUP BY order_id, payment_sequential
HAVING COUNT(*) > 1;


-- CHECK NULL VALUES


-- Customer

SELECT
SUM(customer_id IS NULL) AS customer_id_nulls,
SUM(customer_unique_id IS NULL) AS customer_unique_id_nulls,
SUM(customer_city IS NULL) AS customer_city_nulls,
SUM(customer_state IS NULL) AS customer_state_nulls
FROM customer;

-- Orders

SELECT
SUM(customer_id IS NULL) AS customer_id_nulls,
SUM(order_status IS NULL) AS order_status_nulls,
SUM(order_purchase_timestamp IS NULL) AS purchase_timestamp_nulls
FROM orders;

-- Products

SELECT
SUM(product_category_name IS NULL) AS category_nulls,
SUM(product_name_length IS NULL) AS product_name_length_nulls,
SUM(product_description_length IS NULL) AS description_nulls
FROM products;

-- Sellers

SELECT
SUM(seller_city IS NULL) AS seller_city_nulls,
SUM(seller_state IS NULL) AS seller_state_nulls
FROM sellers;

-- Order Items

SELECT
SUM(product_id IS NULL) AS product_id_nulls,
SUM(price IS NULL) AS price_nulls,
SUM(freight_value IS NULL) AS freight_value_nulls
FROM order_items;

-- Order Payments

SELECT
SUM(payment_type IS NULL) AS payment_type_nulls,
SUM(payment_value IS NULL) AS payment_value_nulls
FROM order_payments;

-- Geolocation

SELECT
SUM(geolocation_city IS NULL) AS city_nulls,
SUM(geolocation_state IS NULL) AS state_nulls
FROM geolocation;


-- CHECK DISTINCT VALUES


SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM customer;

SELECT COUNT(DISTINCT seller_id) AS unique_sellers
FROM sellers;

SELECT COUNT(DISTINCT product_id) AS unique_products
FROM products;

SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM orders;

-- CHECK DATE RANGE


SELECT
MIN(order_purchase_timestamp) AS first_order,
MAX(order_purchase_timestamp) AS last_order
FROM orders;


-- CHECK PRICE RANGE


SELECT
MIN(price) AS minimum_price,
MAX(price) AS maximum_price,
AVG(price) AS average_price
FROM order_items;


-- CHECK PAYMENT VALUE RANGE


SELECT
MIN(payment_value) AS minimum_payment,
MAX(payment_value) AS maximum_payment,
AVG(payment_value) AS average_payment
FROM order_payments;
