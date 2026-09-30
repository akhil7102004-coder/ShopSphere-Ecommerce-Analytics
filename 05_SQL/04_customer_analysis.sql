USE shopsphere;

SELECT
    acquisition_channel,
    COUNT(*) AS customers
FROM customers
GROUP BY acquisition_channel
ORDER BY customers DESC;

SELECT
    state,
    COUNT(*) AS customers
FROM customers
GROUP BY state
ORDER BY customers DESC;

SELECT
    customer_segment,
    COUNT(*) AS customers
FROM customers
GROUP BY customer_segment
ORDER BY customers DESC;

SELECT
    loyalty_member,
    COUNT(*) AS customers
FROM customers
GROUP BY loyalty_member
ORDER BY customers DESC;

SELECT
    COUNT(DISTINCT o.customer_id) AS purchasing_customers,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(
        COUNT(DISTINCT o.customer_id) * 100.0 /
        COUNT(DISTINCT c.customer_id),
        2
    ) AS purchase_rate_pct
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
    
SELECT
    ROUND(
        COUNT(DISTINCT order_id) /
        COUNT(DISTINCT customer_id),
        2
    ) AS average_orders_per_customer
FROM orders;

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END
ORDER BY customers DESC;


SELECT
    c.customer_segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_segment
ORDER BY gross_revenue DESC;

SELECT
    c.loyalty_member,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.loyalty_member
ORDER BY gross_revenue DESC;


SELECT
    c.customer_id,
    c.customer_name,
    c.customer_segment,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS lifetime_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.customer_segment
ORDER BY lifetime_revenue DESC
LIMIT 20;



SELECT
    ROUND(
        SUM(oi.gross_amount) /
        COUNT(DISTINCT o.customer_id),
        2
    ) AS revenue_per_customer
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;
    
    
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    order_count,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY order_count
ORDER BY order_count;


SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC
LIMIT 20;

SELECT
    c.acquisition_channel,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.acquisition_channel
ORDER BY revenue DESC;


SELECT
    c.state,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.state
ORDER BY revenue DESC;


SELECT
    c.customer_segment,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS revenue,
    ROUND(
        SUM(oi.gross_amount) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_segment
ORDER BY average_order_value DESC;


SELECT
    c.loyalty_member,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS revenue,
    ROUND(
        SUM(oi.gross_amount) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.loyalty_member
ORDER BY average_order_value DESC;


SELECT
    YEAR(signup_date) AS signup_year,
    COUNT(*) AS customers
FROM customers
GROUP BY YEAR(signup_date)
ORDER BY signup_year;


SELECT
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT o.customer_id) AS purchasing_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS total_revenue,
    ROUND(
        SUM(oi.gross_amount) /
        COUNT(DISTINCT o.customer_id),
        2
    ) AS revenue_per_customer
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id;
    
    
