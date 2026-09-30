USE shopsphere;

SELECT
    category,
    COUNT(*) AS products
FROM products
GROUP BY category
ORDER BY products DESC;

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY gross_revenue DESC;

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY units_sold DESC;

SELECT
    p.category,
    p.subcategory,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.category,
    p.subcategory
ORDER BY gross_revenue DESC;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.brand
ORDER BY gross_revenue DESC
LIMIT 20;


SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.brand
ORDER BY units_sold DESC
LIMIT 20;

SELECT
    p.brand,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.brand
ORDER BY gross_revenue DESC;


SELECT
    p.category,
    ROUND(AVG(oi.unit_price), 2) AS average_selling_price,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY average_selling_price DESC;

SELECT
    p.category,
    ROUND(AVG(oi.discount_pct), 2) AS average_discount_pct,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY average_discount_pct DESC;


SELECT
    p.category,
    ROUND(AVG(oi.unit_price), 2) AS average_selling_price,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY average_selling_price DESC;

SELECT
    p.category,
    ROUND(AVG(oi.discount_pct), 2) AS average_discount_pct,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY average_discount_pct DESC;

SELECT
    p.category,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_pct / 100)
        ),
        2
    ) AS net_sales_estimate
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY net_sales_estimate DESC;

SELECT
    p.category,
    ROUND(
        SUM(
            oi.quantity *
            (
                oi.unit_price -
                p.cost_price_final
            )
        ),
        2
    ) AS estimated_gross_margin
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY estimated_gross_margin DESC;

SELECT
    p.category,
    ROUND(
        (
            SUM(
                oi.quantity *
                (oi.unit_price - p.cost_price_final)
            )
            /
            NULLIF(SUM(oi.quantity * oi.unit_price), 0)
        ) * 100,
        2
    ) AS estimated_margin_pct
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY estimated_margin_pct DESC;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    ROUND(
        SUM(
            oi.quantity *
            (oi.unit_price - p.cost_price_final)
        ),
        2
    ) AS estimated_profit
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY estimated_profit DESC
LIMIT 20;

SELECT
    p.category,
    COUNT(DISTINCT r.order_id) AS returned_orders,
    ROUND(SUM(oi.gross_amount), 2) AS returned_revenue
FROM returns r
JOIN order_items oi
    ON r.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY returned_orders DESC;

SELECT
    p.brand,
    COUNT(DISTINCT oi.order_id) AS orders,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS revenue,
    ROUND(
        SUM(
            oi.quantity *
            (oi.unit_price - p.cost_price_final)
        ),
        2
    ) AS estimated_profit
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.brand
ORDER BY revenue DESC;

SELECT
    CASE
        WHEN list_price < 1000 THEN 'Under ₹1,000'
        WHEN list_price < 5000 THEN '₹1,000–₹4,999'
        WHEN list_price < 10000 THEN '₹5,000–₹9,999'
        WHEN list_price < 25000 THEN '₹10,000–₹24,999'
        ELSE '₹25,000+'
    END AS price_band,
    COUNT(*) AS products
FROM products
GROUP BY
    CASE
        WHEN list_price < 1000 THEN 'Under ₹1,000'
        WHEN list_price < 5000 THEN '₹1,000–₹4,999'
        WHEN list_price < 10000 THEN '₹5,000–₹9,999'
        WHEN list_price < 25000 THEN '₹10,000–₹24,999'
        ELSE '₹25,000+'
    END
ORDER BY MIN(list_price);

SELECT
    cost_price_source,
    COUNT(*) AS products
FROM products
GROUP BY cost_price_source;

SELECT
    COUNT(DISTINCT p.product_id) AS products_with_sales,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.gross_amount), 2) AS gross_revenue,
    ROUND(AVG(oi.unit_price), 2) AS average_unit_price,
    ROUND(AVG(oi.discount_pct), 2) AS average_discount_pct
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id;
    
    


