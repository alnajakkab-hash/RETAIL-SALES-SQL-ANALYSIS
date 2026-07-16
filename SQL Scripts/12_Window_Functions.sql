
-- FILE: 12_Window_Functions.sql
-- Assign a unique row number to each seller
-- based on total revenue.


SELECT
    seller_id,
    total_revenue,
    ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS row_num
FROM
(
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
) seller_sales;


-- Rank sellers by total revenue.


SELECT
    seller_id,
    total_revenue,
    RANK() OVER(ORDER BY total_revenue DESC) AS seller_rank
FROM
(
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
) seller_sales;



SELECT
    seller_id,
    total_revenue,
    DENSE_RANK() OVER(ORDER BY total_revenue DESC) AS dense_rank
FROM
(
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
) seller_sales;

-- Compare each month's revenue with the
-- previous month's revenue.


SELECT
    order_year,
    order_month,
    total_revenue,
    LAG(total_revenue) OVER(
        ORDER BY order_year, order_month
    ) AS previous_month_revenue
FROM
(
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
) monthly_sales;


-- Compare each month's revenue with the
-- next month's revenue.

SELECT
    order_year,
    order_month,
    total_revenue,
    LEAD(total_revenue) OVER(
        ORDER BY order_year, order_month
    ) AS next_month_revenue
FROM
(
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
) monthly_sales;

