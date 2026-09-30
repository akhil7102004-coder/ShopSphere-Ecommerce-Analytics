USE shopsphere;

SELECT
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(customer_name IS NULL) AS null_customer_name,
    SUM(city IS NULL) AS null_city
FROM customers;

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT
    SUM(product_id IS NULL) AS null_product_id,
    SUM(product_name IS NULL) AS null_product_name,
    SUM(cost_price_final IS NULL) AS null_final_cost,
    SUM(list_price IS NULL) AS null_list_price
FROM products;

SELECT
    COUNT(*) AS estimated_cost_products
FROM products
WHERE cost_price_source = 'Estimated';

SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS invalid_customer_references
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT
    COUNT(*) AS invalid_quantity_rows
FROM order_items
WHERE quantity <= 0;

SELECT
    COUNT(*) AS invalid_order_references
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT
    COUNT(*) AS invalid_product_references
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT
    COUNT(*) AS invalid_payment_order_references
FROM payments p
LEFT JOIN orders o
    ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT
    COUNT(*) AS invalid_return_order_references
FROM returns r
LEFT JOIN orders o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT
    COUNT(*) AS missing_payment_methods
FROM payments
WHERE payment_method IS NULL;

SELECT
    COUNT(*) AS invalid_unit_prices
FROM order_items
WHERE unit_price <= 0;

SELECT
    COUNT(*) AS invalid_discounts
FROM order_items
WHERE discount_pct < 0
   OR discount_pct > 100;
   
SELECT
    COUNT(*) AS inconsistent_gross_amounts
FROM order_items
WHERE ABS(
    gross_amount - (quantity * unit_price)
) > 0.01;

SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM orders;

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

SELECT
    payment_status,
    COUNT(*) AS payment_count
FROM payments
GROUP BY payment_status
ORDER BY payment_count DESC;

SELECT
    payment_method,
    COUNT(*) AS payment_count
FROM payments
GROUP BY payment_method
ORDER BY payment_count DESC;

SELECT
    return_reason,
    COUNT(*) AS return_count
FROM returns
GROUP BY return_reason
ORDER BY return_count DESC;

SELECT
    refund_status,
    COUNT(*) AS return_count
FROM returns
GROUP BY refund_status
ORDER BY return_count DESC;

SELECT
    channel,
    COUNT(*) AS campaign_count,
    ROUND(SUM(spend_inr), 2) AS total_spend,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue
FROM marketing_campaigns
GROUP BY channel
ORDER BY attributed_revenue DESC;

SELECT
    SUM(spend_inr < 0) AS negative_campaign_spend,
    SUM(revenue_attributed_inr < 0) AS negative_attributed_revenue
FROM marketing_campaigns;

SELECT
    COUNT(*) AS payments_before_order
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
WHERE p.payment_date < o.order_date;

SELECT
    COUNT(*) AS returns_before_order
FROM returns r
JOIN orders o
    ON r.order_id = o.order_id
WHERE r.return_date < o.order_date;


