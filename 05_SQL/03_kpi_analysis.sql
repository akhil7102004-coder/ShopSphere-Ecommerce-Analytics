USE shopsphere;

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    COUNT(DISTINCT oi.order_item_id) AS total_order_items,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(AVG(oi.gross_amount), 2) AS avg_order_item_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;
    
    
SELECT
    COUNT(*) AS orders_without_items
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


SELECT
    COUNT(DISTINCT oi.order_id) AS orders_with_items,
    ROUND(SUM(oi.gross_amount), 2) AS total_gross_revenue,
    ROUND(
        SUM(oi.gross_amount) / COUNT(DISTINCT oi.order_id),
        2
    ) AS average_order_value
FROM order_items oi;

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY order_month;

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY gross_revenue DESC;

SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY gross_revenue DESC;

SELECT
    p.category,
    p.subcategory,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category, p.subcategory
ORDER BY gross_revenue DESC;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY gross_revenue DESC
LIMIT 10;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY units_sold DESC
LIMIT 10;

SELECT
    c.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS customers,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.state
ORDER BY gross_revenue DESC;

SELECT
    c.acquisition_channel,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.acquisition_channel
ORDER BY gross_revenue DESC;

SELECT
    p.payment_method,
    COUNT(DISTINCT p.order_id) AS orders,
    COUNT(*) AS payment_transactions
FROM payments p
GROUP BY p.payment_method
ORDER BY orders DESC;

SELECT
    o.shipping_type,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(
        SUM(oi.gross_amount) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.shipping_type
ORDER BY gross_revenue DESC;

SELECT
    c.customer_segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(
        SUM(oi.gross_amount) / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS average_order_value
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_segment
ORDER BY gross_revenue DESC;

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY
    CASE
        WHEN order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END;
    
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN co.order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM customer_orders co
JOIN orders o
    ON co.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    CASE
        WHEN co.order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END;
    

SELECT
    COUNT(DISTINCT r.order_id) AS returned_orders,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT r.order_id) * 100.0 /
        COUNT(DISTINCT o.order_id),
        2
    ) AS return_rate_pct
FROM orders o
LEFT JOIN returns r
    ON o.order_id = r.order_id;
    

SELECT
    COUNT(DISTINCT r.order_id) AS returned_orders,
    ROUND(SUM(oi.gross_amount), 2) AS returned_order_revenue
FROM returns r
JOIN order_items oi
    ON r.order_id = oi.order_id;
    
SELECT
    r.return_reason,
    COUNT(DISTINCT r.order_id) AS returned_orders,
    ROUND(SUM(oi.gross_amount), 2) AS associated_revenue
FROM returns r
JOIN order_items oi
    ON r.order_id = oi.order_id
GROUP BY r.return_reason
ORDER BY returned_orders DESC;

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
        SUM(oi.gross_amount) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    order_month,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY order_month))
        * 100.0
        / NULLIF(LAG(revenue) OVER (ORDER BY order_month), 0),
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY order_month;

SELECT
    YEAR(o.order_date) AS order_year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS customers,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(
        SUM(oi.gross_amount) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date)
ORDER BY order_year;

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
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    COUNT(DISTINCT oi.order_item_id) AS total_order_items,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(
        SUM(oi.gross_amount) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value,
    ROUND(
        SUM(oi.quantity),
        0
    ) AS total_units_sold
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;
    
    
    

