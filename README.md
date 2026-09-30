<div align="center">

# 🛒 ShopSphere E-Commerce Analytics

**End-to-end business & customer analytics on 180K+ orders using Python, MySQL, Power BI and DAX**

![Python](https://img.shields.io/badge/Python-Pandas%20%7C%20NumPy-3776AB?logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-SQL%20Analysis-4479A1?logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-DAX%20%7C%20Dashboards-F2C811?logo=powerbi&logoColor=black)
![Jupyter](https://img.shields.io/badge/Jupyter-ETL%20Notebooks-F37626?logo=jupyter&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

</div>

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Headline Results](#-headline-results)
- [Business Objectives](#-business-objectives)
- [Workflow](#-end-to-end-workflow)
- [Project Structure](#-project-structure)
- [Dataset](#-dataset)
- [Data Quality & Cleaning](#-data-quality--cleaning)
- [SQL Analysis](#-sql-analysis)
- [Power BI Dashboard](#-power-bi-dashboard)
- [Key Insights](#-key-insights)
- [Recommendations](#-business-recommendations)
- [DAX Measures](#-key-dax-measures)
- [Data Model](#-data-model)
- [Tech Stack](#-tech-stack)
- [How to Explore](#-how-to-explore-this-project)
- [Disclaimer](#-disclaimer)
- [Author](#-author)

---

## 📊 Overview

ShopSphere is a **simulated Indian e-commerce business (2023–2025)** built to demonstrate a complete analytics workflow: messy raw data → profiling → cleaning/ETL → SQL analysis → Power BI dashboards → business recommendations.

The project answers questions across four areas:

| Area | Focus |
|------|-------|
| 💰 **Sales** | Revenue trends, AOV, order status, returns, state and category performance |
| 👥 **Customers** | Segmentation, repeat behavior, acquisition channels, loyalty |
| 📦 **Products** | Category/product revenue, units, discounts, estimated profit |
| 📣 **Marketing** | Spend, attributed revenue, ROAS, CTR, conversions by channel |

---

## 🏆 Headline Results

| KPI | Value |
|-----|-------|
| Total Orders | **180,000** |
| Total Customers | **40,000** |
| Total Products | **3,000** |
| Units Sold | **423,555** |
| Gross Revenue | **₹1.65B** |
| Average Order Value | **₹9,178.97** |
| Return Rate | **10.00%** |
| Estimated Profit | **₹203.04M** |
| Estimated Profit Margin | **12.29%** |
| Marketing Spend | **₹44.05M** |
| Attributed Marketing Revenue | **₹207.29M** |
| Marketing ROAS | **4.71** |

> ℹ️ Profit is *estimated*. Missing product cost prices were imputed during ETL using category-level cost ratios.

---

## 🖼️ Dashboard Preview

<!-- Add screenshots to a /images folder and update the paths -->
| Executive Overview | Sales Analysis |
|---|---|
| ![Executive](images/executive_overview.png) | ![Sales](images/sales_analysis.png) |

| Customer Analysis | Marketing Analysis |
|---|---|
| ![Customer](images/customer_analysis.png) | ![Marketing](images/marketing_analysis.png) |

---

## 🎯 Business Objectives

**Sales** – How much revenue is generated, how is it trending, which states/categories lead, and what are the AOV, completion and return rates?

**Customers** – How many customers buy, how many repeat, which channels acquire them, and how do segments and loyalty relate to behavior?

**Products** – Which products/categories drive revenue, units and estimated profit, and how do discounts vary?

**Marketing** – Which channels drive attributed revenue and the best ROAS, and how do spend, conversions and CTR compare?

---

## 🏗️ End-to-End Workflow

```text
Raw CSV Data
   ↓
Data Profiling  →  Data Quality Checks
   ↓
Python Cleaning & ETL (Pandas, NumPy)
   ↓
Cleaned CSVs  →  MySQL Database (shopsphere)
   ↓
SQL Business Analysis
   ↓
Power BI Data Model  →  DAX Measures
   ↓
Interactive Dashboards
   ↓
Business Insights & Recommendations
```

---

## 🗂️ Project Structure

```text
ShopSphere-Ecommerce-Analytics/
│
├── 01_Business_Requirements/     # Objectives and analytical questions
├── 02_Raw_Data/                  # 7 raw CSVs (with intentional quality issues)
├── 03_Data_Quality/
│   ├── 01_Data_Profiling.ipynb
│   └── Data_Quality_Report.csv
├── 04_Python_ETL/
│   ├── 01_Data_Cleaning.ipynb
│   ├── cleaned_data/
│   ├── quarantine_order_items.csv
│   └── Cleaning_Summary.csv
├── 05_SQL/
│   ├── 01_schema.sql
│   ├── 02_data_quality.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_product_analysis.sql
│   └── 06_marketing_analysis.sql
├── 06_PowerBI/
│   └── ShopSphere_Ecommerce_Analytics.pbix
├── 07_Insights/
│   └── Business_Insights.md
└── 08_Documentation/
    ├── Data_Dictionary.md
    ├── ETL_Documentation.md
    ├── SQL_Documentation.md
    └── PowerBI_Documentation.md
```

---

## 📦 Dataset

| Dataset | Records |
|---------|--------:|
| Customers | 40,000 |
| Products | 3,000 |
| Orders | 180,000 |
| Order Items | 339,013 |
| Payments | 180,000 |
| Returns | 18,000 |
| Marketing Campaigns | 180 |

---

## 🧹 Data Quality & Cleaning

Realistic data-quality issues were introduced on purpose to demonstrate a practical ETL process.

| Dataset | Issue | Action |
|---------|-------|--------|
| Customers | Duplicate records | Deduplicated |
| Customers | Missing cities | Replaced with `Unknown` |
| Products | Missing cost prices | Estimated using category-level cost ratios |
| Orders | Duplicate records | Deduplicated |
| Order Items | Zero/negative quantities | Quarantined (kept out of analysis) |
| Payments | Missing payment methods | Recovered using order information |

**Before vs. after cleaning**

| Dataset | Raw Rows | Clean Rows |
|---------|---------:|-----------:|
| Customers | 40,030 | 40,000 |
| Products | 3,000 | 3,000 |
| Orders | 180,012 | 180,000 |
| Order Items | 339,053 | 339,013 |
| Payments | 180,000 | 180,000 |
| Returns | 18,000 | 18,000 |
| Marketing Campaigns | 180 | 180 |

**ETL operations:** data loading · missing-value analysis · duplicate detection/removal · type conversion · date standardization · categorical and numerical validation · referential integrity checks · invalid-record quarantine · cost-price estimation · data-quality reporting · export of cleaned data.

---

## 🗄️ SQL Analysis

Cleaned data was loaded into a MySQL database named `shopsphere` with 7 tables: `customers`, `products`, `orders`, `order_items`, `payments`, `returns`, `marketing_campaigns`.

**Analysis covered:** revenue and order analysis · AOV · order status · customer segmentation · repeat customers · product and category performance · estimated profit · returns · marketing performance · ROAS · conversions · channel analysis.

**Techniques used:** `JOIN`, `GROUP BY`, `HAVING`, `CASE`, subqueries, CTEs, aggregate functions.

---

## 📈 Power BI Dashboard

A 5-page interactive report with slicers and drill-down.

| Page | Highlights |
|------|-----------|
| **1. Executive Overview** | KPIs (Revenue, Orders, Customers, AOV, Return Rate), monthly trend, revenue by state/category/channel, segment and order-status mix, top 5 products |
| **2. Sales Analysis** | Revenue and order trends, AOV, state and category performance, payment methods, shipping types, order status |
| **3. Customer Analysis** | Purchasing and repeat customers, avg orders per customer, revenue per customer, acquisition channel, loyalty, one-time vs repeat, top 10 customers |
| **4. Product Analysis** | Units sold, revenue and estimated profit/margin, category and subcategory breakdowns, top products, average discount |
| **5. Marketing Analysis** | Spend, attributed revenue, ROAS, conversions and conversion rate, CTR, ROAS by channel, campaign spend vs. revenue |

---

## 🔍 Key Insights

**Sales**
- ₹1.65B gross revenue across 180,000 orders, with an AOV of about ₹9,179.
- **Electronics contributes ~50.25% of total revenue.**
- UPI is the largest payment method by revenue.
- Top states: Maharashtra, Uttar Pradesh, Karnataka, Delhi, Gujarat, which shows notable geographic concentration.

**Customers**
- 34,552 customers placed orders; **28,889 (83.61%) are repeat buyers** and 5,663 bought only once.
- Revenue is concentrated in the Standard, Premium and Business segments. Standard leads mainly because of its larger customer base.

**Products & Returns**
- Top performers include products in Accessories, Audio and Laptops.
- Main return reasons: Not as Expected, Size Issue, Damaged, Wrong Item, Changed Mind, Late Delivery.

**Marketing**
- ₹44.05M spend generated ₹207.29M attributed revenue (**ROAS 4.71**).
- Email shows strong attributed return relative to its spend.

---

## 💡 Business Recommendations

1. **Protect high-revenue categories.** Track Electronics for growth, margin, inventory and demand, and reduce dependence on a single category.
2. **Reduce returns.** Improve product descriptions, quality checks, packaging and fulfillment, targeting "Not as Expected", size, damage and wrong-item returns.
3. **Strengthen retention.** With 83.6% repeat buyers, invest in loyalty programs, personalized offers, cross-selling and repeat-purchase campaigns.
4. **Optimize marketing mix.** Compare channels on ROAS, CTR, conversion rate, attributed revenue and spend rather than a single metric.
5. **Monitor regional performance.** Identify strong markets, growth opportunities and expansion areas at state level.
6. **Track profit, not just revenue.** Use estimated margin alongside revenue when prioritizing products and categories.

---

## 🧮 Key DAX Measures

```DAX
Total Revenue = SUM('shopsphere order_items'[gross_amount])

Total Orders = DISTINCTCOUNT('shopsphere orders'[order_id])

Total Customers = DISTINCTCOUNT('shopsphere customers'[customer_id])

Total Units = SUM('shopsphere order_items'[quantity])

AOV =
DIVIDE(
    [Total Revenue],
    DISTINCTCOUNT('shopsphere order_items'[order_id])
)

Returned Orders = DISTINCTCOUNT('shopsphere returns'[order_id])

Return Rate = DIVIDE([Returned Orders], [Total Orders])

Completed Orders =
CALCULATE([Total Orders], 'shopsphere orders'[order_status] = "Completed")

Completed Order Rate = DIVIDE([Completed Orders], [Total Orders])

Purchasing Customers = DISTINCTCOUNT('shopsphere orders'[customer_id])

Average Orders per Customer = DIVIDE([Total Orders], [Purchasing Customers])

Repeat Customers =
COUNTROWS(
    FILTER(
        VALUES('shopsphere customers'[customer_id]),
        CALCULATE(COUNTROWS('shopsphere orders')) >= 2
    )
)

One-Time Customers =
COUNTROWS(
    FILTER(
        VALUES('shopsphere customers'[customer_id]),
        CALCULATE(COUNTROWS('shopsphere orders')) = 1
    )
)

Revenue per Purchasing Customer = DIVIDE([Total Revenue], [Purchasing Customers])

Estimated Profit =
SUMX(
    'shopsphere order_items',
    'shopsphere order_items'[quantity] *
    (
        'shopsphere order_items'[unit_price] -
        RELATED('shopsphere products'[cost_price_final])
    )
)
```

---

## 🔗 Data Model

```text
Customers ──1:*──► Orders ──1:*──► Order Items ◄──*:1── Products
                     │
                     ├──► Payments
                     └──► Returns

Marketing Campaigns  (analyzed as a standalone campaign dataset)
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python (Pandas, NumPy) | Data cleaning and ETL |
| Jupyter Notebook | Profiling and ETL workflow |
| MySQL + SQL | Relational storage and business analysis |
| Power BI + DAX | Data modeling, KPIs, dashboards |
| Git / GitHub / Git LFS |
