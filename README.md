# Olist SQL Analysis

## Overview

This project analyzes the Brazilian Olist e-commerce dataset from kaggle using
**MySQL**.It demonstrates how SQL can be used to transform raw
e-commerce data into an actionable insights. 
The analysis focuses on customer spending and segmentation, revenue trends,
and product performance and rankings.

The SQL analysis was performed in MySQL Workbench and uses joins,
aggregations, Common Table Expressions (CTEs), window functions,
`CASE WHEN`, date functions, and other SQL techniques to answer
business questions.

## Business Questions

1.  **Who are the top 10 customers by total amount spent?**
2.  **What is the monthly revenue trend across the dataset?**
3.  **What is the month-over-month change in revenue?**
4.  **Which product categories generate the most revenue?**
5.  **What are the top 3 products within each category by revenue?**
6.  **How can customers be segmented into Low, Medium, and High spend
    tiers?**
7.  **How many customers are repeat vs. one-time buyers?**
8.  **What percentage of total revenue comes from the top category?**

## Key Findings

### 1. Top Customers by Total Spending

The analysis identified the top 10 customers based on their total
payment value. The highest displayed customer total was **13,664.08**,
followed by another high value customer at **7274.88**.

This analysis used join function to combine 3 tables to obtain the total
money spent by each unique customer id.

### 2. Monthly Revenue Trend

Monthly revenue dramatically increased from September 2016 to November 2017 on 
a monthly basis with a slight decline in December 2017

Some notable monthly revenue values were:

  Month                   Revenue
  ---------------- --------------
  September 2016           267.36
  October 2016          49,507.66
  January 2017         120,312.87
  May 2017             506,071.14
  August 2017          573,971.68
  September 2017       624,401.69
  October 2017         664,219.43
  November 2017      1,010,271.37
  December 2017        743,914.17
  January 2018         950,030.36
  February 2018        844,178.71

The highest monthly revenue displayed was **1,010,271.37 in November
2017**.

### 3. Month-over-Month Revenue Change

The analysis used the `LAG()` window function to compare each month's
revenue with the previous month.

The displayed results show very large percentage changes during the
early months.

-   October 2016 showed a very large increase compared with September
    2016.
-   December 2016 showed a sharp decline from November 2016.
-   January 2017 showed a very large increase from December 2016.
-   February 2017 increased by approximately **106%** compared with
    January 2017.

These unusually large percentages should be interpreted in the context
of the low revenue values at the beginning of the available period.

### 4. Highest-Revenue Product Category

The highest-revenue category displayed in the analysis was:

**`beleza_saude` --- 1,258,681.34**

The query calculates revenue by product category using the item price
and then orders the categories by revenue.

### 5. Top 3 Products Within Each Category

The analysis ranked products within each product category using the
`ROW_NUMBER()` window function.

The ranking was partitioned by `product_category_name` and ordered by
total product revenue in descending order. Only products with a rank of
**1, 2, or 3** were returned.

This approach makes it possible to identify the highest-revenue products
separately for every category rather than producing only one overall
product ranking.

### 6. Customer Spend Segmentation

Customers were segmented using their total spending:

  Spend                  Segment
  ---------------------- --------------
  Less than 100          Low Value
  100 to less than 500   Medium Value
  500 and above          High Value

The segmentation was implemented using a `CASE WHEN` statement after
calculating each customer's total spending.

### 7. Repeat vs. One-Time Buyers

Customers were classified according to their number of distinct orders:

-   **One-time buyer** --- 1 order
-   **Repeat buyer** --- more than 1 order

The displayed query result showed **93,099 one-time buyers** accounting 
for 96.88% of the total customer while the rest are repeat buyers.


### 8. Revenue Contribution of the Top Category

The top category, `beleza_saude`, generated:

-   **Category revenue:** 1,258,681.34
-   **Total revenue:** 13,591,643.70001419
-   **Share of total revenue:** **9.26%**

This means the highest-revenue category accounted for 9.26% of the total
revenue calculated from the `items` table.

## Recommendations

Based on the analysis, the following business actions can be considered:

1.  **Focus on high-revenue categories**\
    Monitor `beleza_saude` closely because it generated the highest
    category revenue in the analysis.

2.  **Monitor monthly revenue patterns**\
    The changes in monthly revenue suggest that revenue
    should be tracked over time to identify periods of growth and
    decline.

3.  **Investigate high-value customers**\
    The top-customer analysis can be used to identify customers
    contributing revenue and to support targeted retention
    rates.

4.  **Use customer spend tiers for segmentation**\
    The Low, Medium, and High Value segments can be used to organize
    customers for different marketing and retention strategies.

5.  **Evaluate top products within each category**\
    The top-three product ranking can help identify products that
    contribute the most revenue within their respective categories.

6.  **Further investigate customer repeat purchasing**\
    The repeat-versus-one-time analysis can be expanded to understand
    customer retention and purchasing behavior.

## Tools & Skills

### Tools

-   **MySQL**
-   **MySQL Workbench**
-   **SQL**
-   **Olist Brazilian E-Commerce Dataset**

### SQL Skills Demonstrated

-   `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`
-   `INNER JOIN`
-   `CROSS JOIN`
-   Aggregate functions such as `SUM()` and `COUNT()`
-   `ROUND()`
-   `DATE_FORMAT()`
-   `YEAR()` and `MONTH()`
-   `CASE WHEN`
-   Common Table Expressions (`WITH`)
-   Window functions
    -   `ROW_NUMBER()`
    -   `LAG()`
-   `COUNT(DISTINCT ...)`
-   Customer segmentation
-   Revenue calculations
-   Ranking within groups
-   Month-over-month analysis

## Files

-   `README.md`
-   `q1_top10_customer.sql`
-   `q2_monthly_revenue_trend.sql`
-   `q3_MoM_revenue.sql`
-   `q4_top_category.sql`
-   `q5_top3_products_by_category.sql`
-   `q6_customer_segmentation_spendingLvL.sql`
-   `q7_customer_segmentation_purchasefrequency.sql`
-   `q8_topcategory_percent_revenue.sql`


