# ShopSphere ETL Documentation

## 1. Objective

The ETL process prepares raw e-commerce data for SQL analysis and Power BI reporting.

The process consists of:

1. Data ingestion
2. Data profiling
3. Data-quality identification
4. Cleaning and transformation
5. Validation
6. Export of analytical datasets

---

# 2. Raw Data

Seven raw datasets are used:

- Customers
- Products
- Orders
- Order Items
- Payments
- Returns
- Marketing Campaigns

---

# 3. Data Quality Issues Identified

| Dataset | Issue | Records |
|---|---|---:|
| Customers | Duplicate customer records | 30 |
| Customers | Missing city | 20 |
| Products | Missing cost price | 15 |
| Orders | Duplicate order records | 12 |
| Order Items | Zero/negative quantity | 40 |
| Payments | Missing payment method | 25 |

---

# 4. Cleaning Process

## Customers

- Removed duplicate customer records.
- Replaced missing city values with `Unknown`.

Final records: 40,000.

## Products

- Identified missing product cost values.
- Calculated category-level cost ratios.
- Estimated missing costs using list price and category-level cost ratios.
- Created `cost_price_final`.
- Added `cost_price_source` to maintain data lineage.

## Orders

- Removed duplicate order records.

Final records: 180,000.

## Order Items

- Identified records with quantity <= 0.
- Moved invalid records to `quarantine_order_items.csv`.
- Retained valid order items for analysis.

Final analytical records: 339,013.

## Payments

- Identified missing payment methods.
- Recovered missing values using order information where possible.
- Added `payment_method_source`.

## Returns

No cleaning/removal was required in the final ETL workflow.

## Marketing

Marketing campaign data was retained for campaign-level performance analysis.

---

# 5. Validation

The cleaned datasets were validated for:

- Duplicate records
- Missing values
- Invalid quantities
- Referential integrity
- Date validity
- Numeric consistency
- Payment information
- Return information
- Marketing metrics

---

# 6. Output

The cleaned datasets are stored in:

`04_Python_ETL/cleaned_data/`

The output is then loaded into MySQL for SQL analysis and Power BI reporting.

---

# 7. Data Lineage

Raw CSV Files

↓

Python Data Profiling

↓

Data Quality Report

↓

Python Cleaning / Transformation

↓

Clean CSV Files

↓

MySQL Database

↓

SQL Analysis

↓

Power BI Data Model

↓

DAX Measures

↓

Interactive Dashboard