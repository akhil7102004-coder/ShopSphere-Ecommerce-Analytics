# ShopSphere SQL Documentation

## Overview

MySQL is used as the analytical database for ShopSphere.

The SQL workflow is divided into six scripts.

---

# 01_schema.sql

Creates the `shopsphere` database and the seven analytical tables.

Tables:

- customers
- products
- orders
- order_items
- payments
- returns
- marketing_campaigns

Primary and foreign-key relationships are defined to maintain referential integrity.

---

# 02_data_quality.sql

Performs SQL-based data validation.

Checks include:

- NULL values
- Duplicate records
- Referential integrity
- Invalid quantities
- Invalid prices
- Invalid discount values
- Gross amount consistency
- Date ranges
- Order status
- Payment status
- Payment methods
- Return reasons
- Refund status
- Marketing metrics

---

# 03_kpi_analysis.sql

Analyzes overall business performance.

Key metrics include:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Monthly Revenue
- Yearly Revenue
- Revenue by Category
- Revenue by State
- Revenue by Acquisition Channel
- Payment Method Performance
- Shipping Performance
- Order Status
- Repeat Customers
- Return Rate
- Return Reasons
- Top Customers

---

# 04_customer_analysis.sql

Focuses on customer behavior.

Analysis includes:

- Customer acquisition
- Customers by state
- Customer segments
- Loyalty membership
- Purchasing customers
- Repeat customers
- One-time customers
- Average orders per customer
- Revenue per customer
- Revenue by segment
- Revenue by acquisition channel
- Customer lifetime revenue
- Customer order frequency

---

# 05_product_analysis.sql

Focuses on product performance and profitability.

Analysis includes:

- Product count
- Category revenue
- Category units sold
- Subcategory revenue
- Top products
- Brand revenue
- Average selling price
- Discount analysis
- Estimated revenue after discount
- Estimated gross profit
- Estimated profit margin
- Product return performance
- Price bands
- Cost source analysis

---

# 06_marketing_analysis.sql

Analyzes marketing campaign performance.

Metrics include:

- Campaign count
- Marketing spend
- Impressions
- Clicks
- Conversions
- Attributed revenue
- ROAS
- Cost per conversion
- CTR
- Conversion rate
- Monthly campaign performance
- Campaign-level efficiency
- Channel-level efficiency

---

# Analytical Approach

The SQL analysis combines aggregation, joins, filtering, grouping, conditional calculations, and business KPI calculations to convert transactional data into business insights.
