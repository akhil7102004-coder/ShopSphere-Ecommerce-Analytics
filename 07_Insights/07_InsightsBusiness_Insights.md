# ShopSphere E-Commerce Analytics — Business Insights

## 1. Project Overview

ShopSphere is an end-to-end e-commerce analytics project designed to analyze sales performance, customer behavior, product performance, returns, and marketing effectiveness.

The analysis covers 180,000 orders, 40,000 customers, 3,000 products, 339,013 order items, 18,000 return records, and 180 marketing campaigns.

The project uses Python for data profiling and cleaning, MySQL for structured analysis, and Power BI/DAX for interactive business reporting.

---

# 2. Executive Summary

### Overall Performance

- Total Orders: **180,000**
- Total Customers: **40,000**
- Total Products: **3,000**
- Total Units Sold: **423,555**
- Gross Revenue: **₹1.65 billion**
- Average Order Value: **₹9,178.97**
- Return Rate: **10.00%**
- Estimated Profit: **₹203.04 million**
- Estimated Profit Margin: **12.29%**

The business generated approximately ₹1.65 billion in gross sales across the three-year analysis period.

---

# 3. Sales Insights

## 3.1 Revenue by Category

Electronics is the largest revenue-generating category.

| Category | Revenue Share |
|---|---:|
| Electronics | 50.25% |
| Home & Kitchen | 13.53% |
| Sports | 9.48% |
| Fashion | 8.62% |
| Toys | 6.58% |
| Beauty | 5.73% |
| Grocery | 3.01% |
| Books | 2.80% |

### Insight

Electronics contributes approximately half of total gross revenue, making it the dominant category in the ShopSphere dataset.

This indicates that changes in electronics sales can have a significant impact on overall business revenue.

---

## 3.2 Revenue by State

The highest-revenue states are:

1. Maharashtra — approximately ₹178.15M
2. Uttar Pradesh — approximately ₹170.62M
3. Karnataka — approximately ₹167.22M
4. Delhi — approximately ₹133.18M
5. Gujarat — approximately ₹132.38M

Maharashtra is the largest individual state market in the dataset.

---

## 3.3 Payment Method

UPI generates the highest gross sales among the payment methods.

Approximate gross revenue:

- UPI — ₹590.97M
- Credit Card — ₹333.74M
- COD — ₹251.74M
- Debit Card — ₹227.47M
- Wallet — ₹150.36M
- Net Banking — ₹97.85M

UPI represents the largest payment channel by transaction value in the dataset.

---

# 4. Customer Insights

## 4.1 Customer Segments

The customer base consists of:

- Standard — **76.11%**
- Premium — **19.90%**
- Business — **4.00%**

Standard customers generate approximately **₹1.26 billion** in gross revenue.

Premium customers generate approximately **₹327.28 million**, while Business customers generate approximately **₹67.11 million**.

### Insight

The Standard segment represents the majority of the customer base and revenue, while the Premium segment represents a smaller but significant revenue contributor.

---

## 4.2 Repeat Customers

Among customers who placed at least one order:

- Purchasing customers: **34,552**
- Repeat customers: **28,889**
- One-time customers: **5,663**

Approximately **83.61%** of purchasing customers placed two or more orders.

### Insight

The dataset shows a high proportion of repeat purchasing customers, indicating strong repeat-purchase behavior within the simulated business.

---

## 4.3 Customer Acquisition

Revenue by acquisition channel:

| Acquisition Channel | Gross Revenue |
|---|---:|
| Organic Search | ₹432.37M |
| Paid Search | ₹334.48M |
| Social Media | ₹302.41M |
| Email | ₹234.30M |
| Referral | ₹191.70M |
| Affiliate | ₹156.87M |

Organic Search generates the highest gross revenue among the customer acquisition channels.

---

# 5. Product Insights

## 5.1 Top Product Categories

Electronics is the largest category by gross revenue, followed by Home & Kitchen and Sports.

The concentration of revenue in Electronics makes category-level monitoring important for overall sales performance.

---

## 5.2 Top Products

The highest-revenue products include:

- Accessories Product 1468 — approximately ₹10.86M
- Audio Product 1613 — approximately ₹9.62M
- Accessories Product 789 — approximately ₹9.50M
- Laptops Product 1867 — approximately ₹9.41M
- Accessories Product 249 — approximately ₹9.28M

These products represent the highest individual gross-revenue contributors in the dataset.

---

## 5.3 Estimated Profitability

Estimated profit:

**₹203.04 million**

Estimated profit margin:

**12.29%**

Profit is calculated using product cost and selling price information available in the cleaned dataset.

Because some product costs were estimated during data preparation, the profitability figures should be treated as estimated rather than accounting-level profit.

---

# 6. Return Insights

There are:

- 18,000 return records
- 10% return rate based on unique returned orders

The most common return reasons are:

| Return Reason | Share of Returns |
|---|---:|
| Not as Expected | 27.85% |
| Size Issue | 16.89% |
| Damaged | 15.73% |
| Wrong Item | 13.86% |
| Changed Mind | 13.60% |
| Late Delivery | 12.07% |

### Insight

"Not as Expected" is the largest recorded return reason, accounting for approximately 27.85% of return records.

Product expectations, descriptions, specifications, and customer experience can therefore be areas for further investigation.

---

# 7. Marketing Insights

## 7.1 Overall Marketing Performance

- Marketing Spend: **₹44.05M**
- Attributed Revenue: **₹207.29M**
- ROAS: **4.71**
- Conversions: **1.84M**
- CTR: **3.60%**
- Conversion Rate: **6.12%**

---

## 7.2 Marketing Channel Performance

| Channel | Spend | Attributed Revenue | ROAS |
|---|---:|---:|---:|
| Email | ₹9.10M | ₹50.17M | 5.51 |
| Affiliate | ₹8.99M | ₹41.90M | 4.66 |
| Google Ads | ₹8.85M | ₹41.09M | 4.64 |
| Meta Ads | ₹8.71M | ₹39.71M | 4.56 |
| Influencer | ₹8.40M | ₹34.42M | 4.10 |

Email has the highest ROAS in the campaign dataset at approximately **5.51**.

Google Ads generated the highest number of conversions at approximately **411,567**.

### Insight

Different channels perform differently depending on the business metric being considered. Email leads on ROAS, while Google Ads generates the highest number of conversions.

---

# 8. Overall Business Takeaways

### 1. Electronics is the main revenue driver

Electronics contributes approximately 50% of total gross revenue and therefore has a major influence on overall sales performance.

### 2. Repeat purchasing is significant

More than 83% of purchasing customers are repeat customers in the dataset.

### 3. Organic Search is an important acquisition source

Organic Search generates the highest gross revenue among the customer acquisition channels.

### 4. UPI is the largest payment channel

UPI accounts for the highest gross sales among the payment methods analyzed.

### 5. Returns require monitoring

The overall return rate is 10%, with "Not as Expected" being the most common return reason.

### 6. Marketing channels have different strengths

Email produces the highest ROAS, while Google Ads generates the highest conversion count.

### 7. Profitability should be monitored alongside revenue

The estimated profit margin is 12.29%, showing that high revenue does not automatically represent high profitability.

---

# 9. Recommended Business Actions

Based on the analysis:

1. Monitor Electronics performance closely because of its large contribution to total revenue.
2. Investigate the causes behind "Not as Expected" returns.
3. Analyze repeat-customer behavior to identify factors associated with repeat purchases.
4. Continue evaluating acquisition channels using both revenue and efficiency metrics.
5. Compare marketing channels using ROAS, conversion rate, and conversion volume rather than a single metric.
6. Monitor product-level estimated profitability in addition to sales revenue.
7. Use state-level performance to identify markets requiring additional analysis.

---

# 10. Important Metric Definitions

### Gross Revenue

Sum of `gross_amount` from order items.

### AOV

Gross Revenue divided by the number of orders containing order items.

### Return Rate

Unique returned orders divided by total orders.

### Estimated Profit

Quantity × (Unit Price − Final Product Cost)

### Estimated Profit Margin

Estimated Profit ÷ Gross Revenue

### ROAS

Attributed Marketing Revenue ÷ Marketing Spend