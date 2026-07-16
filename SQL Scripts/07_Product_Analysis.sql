
-- FILE: 07_Product_Analysis.sql


-- TOTAL PRODUCTS


SELECT COUNT(*) AS total_products
FROM products;


-- PRODUCTS BY CATEGORY


SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC;

-- TOP 10 MOST SOLD PRODUCTS


SELECT
    oi.product_id,
    COUNT(*) AS total_quantity_sold
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- TOP 10 HIGHEST REVENUE PRODUCTS


SELECT
    oi.product_id,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- AVERAGE PRODUCT PRICE


SELECT
    ROUND(AVG(price),2) AS average_price
FROM order_items;


-- MINIMUM, MAXIMUM AND AVERAGE PRICE


SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    ROUND(AVG(price),2) AS average_price
FROM order_items;


-- TOP 10 MOST EXPENSIVE PRODUCTS


SELECT
    product_id,
    price
FROM order_items
ORDER BY price DESC
LIMIT 10;


-- TOP PRODUCT CATEGORIES BY SALES


SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC;


-- TOP PRODUCT CATEGORIES BY QUANTITY SOLD


SELECT
    p.product_category_name,
    COUNT(*) AS quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY quantity_sold DESC;
