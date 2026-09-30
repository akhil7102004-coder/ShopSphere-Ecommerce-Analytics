# ShopSphere Data Dictionary

## Overview

ShopSphere uses seven primary datasets representing customers, products, orders, order items, payments, returns, and marketing campaigns.

---

# 1. Customers

### customers_clean.csv

| Column              | Description                                     |
| ------------------- | ----------------------------------------------- |
| customer_id         | Unique customer identifier                      |
| customer_name       | Customer name                                   |
| gender              | Customer gender                                 |
| date_of_birth       | Customer date of birth                          |
| signup_date         | Customer registration date                      |
| acquisition_channel | Channel through which the customer was acquired |
| state               | Customer state                                  |
| city                | Customer city                                   |
| customer_segment    | Standard, Premium, or Business                  |
| email_opt_in        | Email marketing preference                      |
| loyalty_member      | Loyalty membership indicator                    |

---

# 2. Products

### products_clean.csv

| Column               | Description                                   |
| -------------------- | --------------------------------------------- |
| product_id           | Unique product identifier                     |
| product_name         | Product name                                  |
| category             | Product category                              |
| subcategory          | Product subcategory                           |
| brand                | Product brand                                 |
| cost_price           | Original product cost                         |
| list_price           | Product list price                            |
| cost_ratio           | Cost-to-list-price ratio                      |
| cost_price_estimated | Estimated cost for products with missing cost |
| cost_price_final     | Final cost used for analysis                  |
| cost_price_source    | Indicates Actual or Estimated cost            |

---

# 3. Orders

### orders_clean.csv

| Column         | Description                        |
| -------------- | ---------------------------------- |
| order_id       | Unique order identifier            |
| customer_id    | Customer associated with the order |
| order_date     | Date of order                      |
| payment_method | Payment method                     |
| order_status   | Current order status               |
| shipping_type  | Shipping method                    |

---

# 4. Order Items

### order_items_clean.csv

| Column        | Description                  |
| ------------- | ---------------------------- |
| order_item_id | Unique order-item identifier |
| order_id      | Associated order             |
| product_id    | Associated product           |
| quantity      | Quantity purchased           |
| unit_price    | Selling price per unit       |
| discount_pct  | Recorded discount percentage |
| gross_amount  | Gross order-item amount      |

### Gross Amount Definition

For this dataset:

`gross_amount = quantity × unit_price`

The discount percentage is stored separately.

---

# 5. Payments

### payments_clean.csv

| Column                | Description                                                    |
| --------------------- | -------------------------------------------------------------- |
| payment_id            | Unique payment identifier                                      |
| order_id              | Associated order                                               |
| payment_date          | Payment date                                                   |
| payment_method        | Payment method                                                 |
| payment_status        | Payment status                                                 |
| payment_method_source | Indicates whether the payment method was original or recovered |

---

# 6. Returns

### returns_clean.csv

| Column        | Description              |
| ------------- | ------------------------ |
| return_id     | Unique return identifier |
| order_id      | Associated order         |
| return_date   | Return date              |
| return_reason | Reason for return        |
| refund_status | Refund status            |

---

# 7. Marketing Campaigns

### marketing_campaigns_clean.csv

| Column        | Description                        |
| ------------- | ---------------------------------- |
| campaign_id   | Unique campaign identifier         |
| campaign_name | Campaign name                      |
| campaign_date | Campaign date                      |
| channel       | Marketing channel                  |
| spend_inr     | Marketing spend                    |
| impressions   | Number of impressions              |
| clicks        | Number of clicks                   |
| conversions   | Number of conversions              |
| revenue_inr   | Revenue attributed to the campaign |

---

# Key Relationships

customers
→ orders

orders
→ order_items

products
→ order_items

orders
→ payments

orders
→ returns

marketing_campaigns is analyzed as a separate marketing dataset.
