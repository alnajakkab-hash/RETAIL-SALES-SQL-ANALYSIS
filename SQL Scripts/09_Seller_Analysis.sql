-- FILE: 09_Seller_Analysis.sql

-- TOTAL SELLERS

SELECT COUNT(*) AS total_sellers
FROM sellers;

-- SELLERS BY STATE

SELECT
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- TOP 10 SELLERS BY REVENUE

SELECT
    oi.seller_id,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- TOP 10 SELLERS BY NUMBER OF PRODUCTS SOLD

SELECT
    seller_id,
    COUNT(*) AS products_sold
FROM order_items
GROUP BY seller_id
ORDER BY products_sold DESC
LIMIT 10;

-- AVERAGE REVENUE PER SELLER

SELECT
    ROUND(AVG(seller_revenue),2) AS average_revenue
FROM
(
    SELECT
        seller_id,
        SUM(price) AS seller_revenue
    FROM order_items
    GROUP BY seller_id
) AS seller_sales;

-- TOP 10 SELLER CITIES

SELECT
    seller_city,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_city
ORDER BY total_sellers DESC
LIMIT 10;

-- HIGHEST SINGLE PRODUCT PRICE SOLD BY EACH SELLER

SELECT
    seller_id,
    MAX(price) AS highest_price
FROM order_items
GROUP BY seller_id
ORDER BY highest_price DESC
LIMIT 10;