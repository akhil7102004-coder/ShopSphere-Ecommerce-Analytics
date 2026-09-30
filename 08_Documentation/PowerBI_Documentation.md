# ShopSphere Power BI Documentation

## Overview

Power BI is used to transform the MySQL analytical data into an interactive five-page business intelligence report.

---

# Report Pages

## 1. Executive Overview

Provides a high-level summary of business performance.

### KPI Cards

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Return Rate

### Visuals

- Monthly Revenue & Orders Trend
- Revenue by State
- Revenue by Category
- Customer Segment Distribution
- Order Status Distribution
- Top 5 Products by Revenue
- Revenue by Acquisition Channel

---

# 2. Sales Analysis

Focuses on sales performance across time, geography, products, payment methods, and shipping.

Key areas:

- Revenue
- Orders
- AOV
- Sales trends
- Category performance
- State performance
- Payment methods
- Shipping
- Order status

---

# 3. Customer Analysis

Focuses on customer acquisition and purchasing behavior.

Key areas:

- Total customers
- Purchasing customers
- Average orders per customer
- Repeat customers
- Revenue per customer
- Acquisition channels
- Customer states
- Customer segments
- Loyalty membership
- Top customers

---

# 4. Product Analysis

Focuses on product sales and estimated profitability.

Key areas:

- Total products
- Units sold
- Revenue
- Estimated profit
- Estimated profit margin
- Category performance
- Subcategory performance
- Top products
- Discount analysis
- Product profitability

---

# 5. Marketing Analysis

Focuses on campaign and channel effectiveness.

Key areas:

- Marketing spend
- Attributed revenue
- ROAS
- Conversions
- Conversion rate
- CTR
- Channel performance
- Campaign performance

---

# DAX Measures

Important measures include:

- Total Revenue
- Total Orders
- Total Customers
- Total Units
- AOV
- Total Products
- Returned Orders
- Return Rate
- Completed Orders
- Completed Order Rate
- Purchasing Customers
- Average Orders per Customer
- Repeat Customers
- One-Time Customers
- Revenue per Purchasing Customer
- Estimated Profit

---

# Dashboard Design

The report uses a consistent ShopSphere visual identity:

- Dark navy navigation sidebar
- Blue and purple accent colors
- White analytical cards
- KPI cards with icons
- Consistent typography
- Interactive slicers
- Page navigation
- Consistent visual hierarchy

---

# Interactivity

Users can navigate between the five report pages using the left-side page navigator.

Slicers allow users to analyze the data across relevant business dimensions such as:

- Year
- Category
- State
- Customer Segment
- Order Status
- Acquisition Channel
- Brand
- Marketing Channel

---

# Data Source

The Power BI model is connected to the ShopSphere MySQL database.

The database contains seven analytical tables:

- customers
- products
- orders
- order_items
- payments
- returns
- marketing_campaigns
