# 🛒 ShopSphere E-Commerce Analytics

> End-to-end E-Commerce Business & Customer Analytics project using **Python, SQL, MySQL, Power BI, and DAX**.

ShopSphere is a simulated Indian e-commerce analytics project designed to demonstrate an end-to-end data analytics workflow — from raw and messy transactional data to data cleaning, ETL, SQL analysis, business KPIs, interactive Power BI dashboards, and actionable business insights.

---

## 📊 Project Overview

ShopSphere simulates an e-commerce business operating across India between **2023 and 2025**.

The project analyzes:

- Sales and revenue performance
- Customer behavior and segmentation
- Product and category performance
- Returns and order status
- Marketing campaign performance
- Customer acquisition channels
- Regional/state-level performance
- Estimated profitability

The goal is to transform raw transactional data into business-ready insights that can support decisions around **sales, customers, products, marketing, and profitability**.

---

## 🎯 Business Objectives

The analysis was designed to answer questions such as:

### Sales
- How much revenue is being generated?
- How are sales changing over time?
- Which states and categories generate the most revenue?
- What is the average order value?
- What is the order completion and return rate?

### Customers
- How many customers are purchasing?
- How many customers are repeat buyers?
- Which acquisition channels bring customers?
- Which customer segments generate the most revenue?
- How does loyalty membership relate to customer behavior?

### Products
- Which products and categories generate the most revenue?
- Which categories sell the most units?
- Which products contribute the most estimated profit?
- How do discounts vary across products and categories?

### Marketing
- Which marketing channels generate the most attributed revenue?
- Which channels have the highest ROAS?
- How much is being spent on marketing?
- Which campaigns generate conversions?
- How effective are different marketing channels?

---

# 🏗️ End-to-End Analytics Workflow

```text
Raw CSV Data
     │
     ▼
Data Profiling
     │
     ▼
Data Quality Checks
     │
     ▼
Python Data Cleaning & ETL
     │
     ▼
Cleaned CSV Data
     │
     ▼
MySQL Database
     │
     ▼
SQL Business Analysis
     │
     ▼
Power BI Data Model
     │
     ▼
DAX Measures
     │
     ▼
Interactive Dashboards
     │
     ▼
Business Insights & Recommendations



🗂️ Project Structure
ShopSphere-Ecommerce-Analytics/
│
├── 01_Business_Requirements/
│   └── Business requirements and analytical objectives
│
├── 02_Raw_Data/
│   ├── customers_raw.csv
│   ├── products_raw.csv
│   ├── orders_raw.csv
│   ├── order_items_raw.csv
│   ├── payments_raw.csv
│   ├── returns_raw.csv
│   └── marketing_campaigns_raw.csv
│
├── 03_Data_Quality/
│   ├── 01_Data_Profiling.ipynb
│   └── Data_Quality_Report.csv
│
├── 04_Python_ETL/
│   ├── 01_Data_Cleaning.ipynb
│   ├── cleaned_data/
│   ├── quarantine_order_items.csv
│   └── Cleaning_Summary.csv
│
├── 05_SQL/
│   ├── 01_schema.sql
│   ├── 02_data_quality.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_product_analysis.sql
│   └── 06_marketing_analysis.sql
│
├── 06_PowerBI/
│   └── ShopSphere_Ecommerce_Analytics.pbix
│
├── 07_Insights/
│   └── Business_Insights.md
│
└── 08_Documentation/
    ├── Data_Dictionary.md
    ├── ETL_Documentation.md
    ├── SQL_Documentation.md
    └── PowerBI_Documentation.md
🧹 Data Quality & Cleaning

The raw datasets intentionally contain realistic data-quality issues to demonstrate a practical ETL workflow.

Identified issues
Dataset	Issue	Action
Customers	Duplicate customer records	Deduplicated
Customers	Missing cities	Replaced with Unknown
Products	Missing cost prices	Estimated using category-level cost ratios
Orders	Duplicate order records	Deduplicated
Order Items	Zero/negative quantities	Quarantined
Payments	Missing payment methods	Recovered using order information
Data cleaning results
Dataset	Raw Rows	Clean Rows
Customers	40,030	40,000
Products	3,000	3,000
Orders	180,012	180,000
Order Items	339,053	339,013
Payments	180,000	180,000
Returns	18,000	18,000
Marketing Campaigns	180	180

Invalid order-item quantities were separated into a quarantine file instead of being included in the analytical dataset.

🐍 Python ETL

Python was used for data profiling, cleaning, transformation, validation, and preparation of the datasets for SQL analysis.

Technologies
Python
Pandas
NumPy
Jupyter Notebook
Main ETL operations
Data loading
Missing-value analysis
Duplicate detection
Duplicate removal
Data type conversion
Date standardization
Categorical validation
Numerical validation
Referential integrity checks
Invalid transaction quarantine
Cost-price estimation
Data-quality reporting
Export of cleaned datasets
🗄️ MySQL & SQL Analysis

The cleaned datasets were loaded into a MySQL database named:

shopsphere
Database tables
customers
products
orders
order_items
payments
returns
marketing_campaigns
SQL analysis includes
Revenue analysis
Order analysis
Average Order Value
Order status analysis
Customer segmentation
Repeat customer analysis
Product performance
Category performance
Estimated profit
Return analysis
Marketing performance
ROAS
Conversion analysis
Channel analysis
📈 Power BI Dashboard

The Power BI report contains 5 analytical pages.

1. Executive Overview

Provides a high-level view of overall business performance.

KPIs
Total Revenue
Total Orders
Total Customers
Average Order Value
Return Rate
Visualizations
Monthly Revenue & Orders Trend
Revenue by State
Revenue by Category
Customer Segment Distribution
Order Status Distribution
Top 5 Products by Revenue
Revenue by Acquisition Channel
2. Sales Analysis

Focuses on revenue and transaction performance.

Includes analysis of:

Revenue trends
Order trends
Average Order Value
State performance
Category performance
Payment methods
Shipping types
Order status
3. Customer Analysis

Analyzes customer behavior and purchasing patterns.

KPIs
Total Customers
Purchasing Customers
Average Orders per Customer
Repeat Customers
Revenue per Purchasing Customer
Visualizations
Customers by Acquisition Channel
Customers by State
Customer Segment Distribution
Loyalty Membership
Revenue by Customer Segment
One-Time vs Repeat Customers
Top 10 Customers by Revenue
4. Product Analysis

Analyzes product and category performance.

KPIs
Total Products
Total Units Sold
Total Revenue
Estimated Profit
Estimated Profit Margin
Analysis
Revenue by Category
Units Sold by Category
Revenue by Subcategory
Top Products by Revenue
Average Discount
Estimated Profit by Category
5. Marketing Analysis

Evaluates marketing campaign performance.

KPIs
Total Marketing Spend
Attributed Revenue
ROAS
Total Conversions
Conversion Rate
Analysis
Monthly Marketing Spend & Revenue
ROAS by Channel
Conversion Rate by Channel
Attributed Revenue by Channel
CTR by Channel
Campaign Spend vs Attributed Revenue
📌 Key Business KPIs
KPI	Value
Total Orders	180,000
Total Customers	40,000
Total Products	3,000
Total Units Sold	423,555
Gross Revenue	₹1.65B
Average Order Value	₹9,178.97
Return Rate	10.00%
Estimated Profit	₹203.04M
Estimated Profit Margin	12.29%
Marketing Spend	₹44.05M
Attributed Marketing Revenue	₹207.29M
Marketing ROAS	4.71

Profit figures are estimated using the available product cost information. Missing product costs were estimated during the ETL process.

🔍 Key Business Insights
Sales
Gross revenue reached approximately ₹1.65 billion across 180,000 orders.
The overall Average Order Value is approximately ₹9,178.97.
Electronics represents approximately 50.25% of total revenue.
UPI is the largest payment-method contributor by revenue.
Geographic Performance

Major revenue-generating states include:

Maharashtra
Uttar Pradesh
Karnataka
Delhi
Gujarat

This indicates significant revenue concentration across major Indian markets.

Customer Behavior
Approximately 34,552 customers placed orders.
Approximately 28,889 customers are repeat customers.
Approximately 5,663 customers placed only one order.
Repeat customers represent approximately 83.61% of purchasing customers.
Customer Segments

Revenue is concentrated in the:

Standard segment
Premium segment
Business segment

The Standard segment contributes the largest overall revenue because of its larger customer base.

Product Performance

The analysis identifies high-performing products across categories such as:

Accessories
Audio
Laptops

These products can be further analyzed for pricing, inventory, discounting, and profitability.

Returns

Major return reasons include:

Not as Expected
Size Issue
Damaged
Wrong Item
Changed Mind
Late Delivery

These categories can be used to identify opportunities for improving product descriptions, quality control, fulfillment, and customer experience.

Marketing

Marketing analysis shows:

Approximately ₹44.05M in campaign spending.
Approximately ₹207.29M in attributed revenue.
Overall ROAS of approximately 4.71.
Email demonstrates strong attributed return relative to its campaign spend.
Channel-level analysis helps identify differences in traffic, conversions, revenue, and efficiency.
💡 Business Recommendations

Based on the analysis, potential business actions include:

1. Focus on High-Revenue Categories

Continue monitoring Electronics and other high-performing categories for:

Revenue growth
Profit margins
Inventory availability
Customer demand
2. Reduce Product-Related Returns

Investigate major return reasons such as:

Not as Expected
Size Issues
Damaged Products
Wrong Items

Potential areas for improvement include product descriptions, quality checks, packaging, and fulfillment.

3. Strengthen Customer Retention

Repeat customers represent a significant portion of purchasing customers.

Potential initiatives include:

Loyalty programs
Personalized offers
Cross-selling
Repeat-purchase campaigns
Customer segmentation
4. Optimize Marketing Channels

Compare channels using:

ROAS
CTR
Conversion Rate
Attributed Revenue
Campaign Spend

This allows marketing teams to evaluate campaign efficiency using multiple performance indicators.

5. Monitor Regional Performance

State-level revenue analysis can help identify:

High-performing markets
Growth opportunities
Regional customer behavior
Potential expansion areas
6. Track Profitability Alongside Revenue

Revenue alone does not represent business profitability.

Estimated profit and profit margin were therefore incorporated into the product analysis to provide an additional financial perspective.

🧮 Important DAX Measures

The Power BI model uses DAX measures including:

Total Revenue =
SUM('shopsphere order_items'[gross_amount])
Total Orders =
DISTINCTCOUNT('shopsphere orders'[order_id])
Total Customers =
DISTINCTCOUNT('shopsphere customers'[customer_id])
AOV =
DIVIDE(
    [Total Revenue],
    DISTINCTCOUNT('shopsphere order_items'[order_id])
)
Return Rate =
DIVIDE(
    [Returned Orders],
    [Total Orders]
)
Estimated Profit =
SUMX(
    'shopsphere order_items',
    'shopsphere order_items'[quantity] *
    (
        'shopsphere order_items'[unit_price] -
        RELATED('shopsphere products'[cost_price_final])
    )
)
🔗 Data Model

The Power BI model uses relationships between the major transactional and dimensional tables.

Customers
    │
    │ 1 : *
    ▼
 Orders
    │
    ├──────────────► Payments
    │
    ├──────────────► Returns
    │
    │ 1 : *
    ▼
Order Items
    ▲
    │ * : 1
    │
 Products

Marketing campaigns are analyzed as a separate campaign dataset.

🛠️ Technology Stack
Technology	Purpose
Python	Data cleaning & ETL
Pandas	Data manipulation
NumPy	Numerical processing
Jupyter Notebook	Data profiling & ETL
MySQL	Relational database
SQL	Business analysis
Power BI	Dashboard & visualization
DAX	KPI calculations
Git	Version control
GitHub	Project repository
Git LFS	Power BI file storage
📚 Skills Demonstrated

This project demonstrates practical experience with:

Data Analytics
Exploratory Data Analysis
KPI development
Business analysis
Customer analytics
Product analytics
Marketing analytics
Data Cleaning
Missing-value treatment
Duplicate detection
Data validation
Outlier/invalid-record handling
Data-quality reporting
SQL
SELECT
WHERE
GROUP BY
HAVING
JOIN
Subqueries
Aggregate functions
CASE statements
CTEs
Business KPI calculations
Power BI
Data modeling
Relationships
DAX
KPI cards
Interactive dashboards
Slicers
Drill-down analysis
Business storytelling
Python
Pandas
NumPy
Data profiling
Data transformation
ETL automation
📖 Documentation

Detailed documentation is available in:

08_Documentation/

Including:

Data Dictionary
ETL Documentation
SQL Documentation
Power BI Documentation

Business insights are available in:

07_Insights/Business_Insights.md
⚠️ Dataset & Project Disclaimer

ShopSphere is a simulated portfolio project created for educational and demonstration purposes.

The dataset represents a fictional e-commerce business and should not be interpreted as real company data.

Some values, including estimated product costs and profitability, are derived as part of the analytical modeling process.

The project demonstrates the analytics workflow and methodology rather than representing the actual performance of a real organization.

🚀 How to Explore the Project
1. Explore the raw data

Start with:

02_Raw_Data/
2. Review data quality

Open:

03_Data_Quality/01_Data_Profiling.ipynb
3. Review the ETL process

Open:

04_Python_ETL/01_Data_Cleaning.ipynb
4. Explore SQL analysis

Open:

05_SQL/
5. Open the Power BI dashboard

Open:

06_PowerBI/ShopSphere_Ecommerce_Analytics.pbix
6. Read the business insights

Open:

07_Insights/Business_Insights.md
👨‍💻 Author

AKHIL A.

B.Tech Computer Science & Engineering

Interested in:

Data Analytics
Business Intelligence
SQL
Python
Power BI
Data Visualization
⭐ Project Highlights
180K+ Orders
40K Customers
3K Products
339K+ Order Items
₹1.65B Revenue
₹203M Estimated Profit
5 Power BI Dashboard Pages
Python + SQL + Power BI
End-to-End ETL Pipeline
🔗 Repository

ShopSphere E-Commerce Analytics on GitHub


### One important thing before you upload it

Your current GitHub README is only the short title, as shown in your screenshot. Replace it with the full version above.

Since you've already migrated the PBIX to Git LFS, **don't upload the PBIX manually through the browser*
