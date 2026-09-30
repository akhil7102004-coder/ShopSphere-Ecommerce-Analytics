DROP DATABASE IF EXISTS shopsphere;
CREATE DATABASE shopsphere;
USE shopsphere;


CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    date_of_birth DATE,
    signup_date DATE,
    acquisition_channel VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(100),
    customer_segment VARCHAR(30),
    email_opt_in VARCHAR(10),
    loyalty_member VARCHAR(10)
);


CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    brand VARCHAR(50),
    cost_price DECIMAL(12,2),
    list_price DECIMAL(12,2),
    cost_price_estimated DECIMAL(12,2),
    cost_price_final DECIMAL(12,2),
    cost_price_source VARCHAR(20)
);


CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    order_date DATE,
    payment_method VARCHAR(50),
    order_status VARCHAR(30),
    shipping_type VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(12,2),
    discount_pct DECIMAL(6,2),
    gross_amount DECIMAL(14,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


CREATE TABLE payments (
    payment_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


CREATE TABLE returns (
    return_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    return_date DATE,
    return_reason VARCHAR(100),
    refund_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


CREATE TABLE marketing_campaigns (
    campaign_id VARCHAR(20) PRIMARY KEY,
    campaign_name VARCHAR(150),
    campaign_date DATE,
    channel VARCHAR(50),
    spend_inr DECIMAL(14,2),
    impressions BIGINT,
    clicks BIGINT,
    conversions INT,
    revenue_attributed_inr DECIMAL(14,2)
);


SHOW TABLES;

USE shopsphere;
SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS missing_cost_products
FROM products
WHERE cost_price IS NULL;

SELECT COUNT(*) AS total_products
FROM products;

SELECT product_id
FROM products;

SELECT *
FROM products
WHERE cost_price_estimated IS NOT NULL
  AND cost_price_source = 'Estimated';

SELECT COUNT(*) AS product_count
FROM products;

SHOW CREATE TABLE products;
DESCRIBE products;

SELECT 
    CONCAT('P', n) AS missing_product_id
FROM (
    SELECT 10000 + a.n + b.n * 10 + c.n * 100 + d.n * 1000 AS n
    FROM
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d
) numbers
LEFT JOIN products p
    ON p.product_id = CONCAT('P', n)
WHERE n BETWEEN 10000 AND 12999
  AND p.product_id IS NULL
ORDER BY n;


SELECT COUNT(*) AS total_products
FROM shopsphere.products;

SELECT COUNT(*) AS estimated_products
FROM shopsphere.products
WHERE cost_price_source = 'Estimated';

SELECT COUNT(*) AS order_count
FROM shopsphere.orders;


