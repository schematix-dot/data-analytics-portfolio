# Project 3: Product Performance Analysis

## Overview
This project analyzes product-level performance in a retail dataset (Superstore) to identify the top revenue drivers and profitability trends. The dashboard provides a comprehensive view of revenue, profit, and profit margin across products and categories, allowing stakeholders to make data-driven decisions.

Key features include:
- **KPIs** for Total Revenue, Total Profit, and Average Profit Margin
- **Top 10 Products** by Revenue
- **Revenue by Category**
- **Profit vs Revenue Scatter Plot** with dot size representing units sold and color representing category

Interactive filters for **Category** and **Sub-Category** allow users to explore specific product segments.

---

## Data
- **Source:** Superstore dataset (CSV exported from SQL query)
- **Key Fields:**
  - `product_name`
  - `category`
  - `sub_category`
  - `total_revenue` (SUM of sales)
  - `total_profit` (SUM of profit)
  - `profit_margin` (Profit ÷ Revenue)
  - `units_sold` (SUM of quantity)
  - `total_orders` (COUNT of orders)
  - `revenue_rank` (RANK by revenue)

---

## SQL
The SQL query aggregates product-level performance metrics to create a clean, Tableau-ready dataset. It calculates total revenue, profit, units sold, profit margin, and assigns a revenue rank to each product. This dataset powers KPIs, bar charts, and the scatter plot in the dashboard.

```sql
SELECT
    product_name,
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS unit
```

---

## Tableau Dashboard

The dashboard includes:
- **KPIs:** Total Revenue, Total Profit, and Average Profit Margin
- **Top 10 Products:** Bar chart showing highest revenue products
- **Revenue by Category:** Comparison of category-level performance
- **Profit vs Revenue Scatter Plot:** Dot size represents units sold, color represents category
- **Filters:** Category and Sub-Category for interactive exploration

### Dashboard Screenshots

![Product KPIs](./04_Tableau/Dashboard%20Images/Dashboard_overview.png)
*KPIs displaying total revenue, total profit, and average profit margin for products.*

![Top 10 Products](./04_Tableau/Dashboard%20Images/Top-10_Products.png)
*Bar chart of top 10 products by revenue.*

![Revenue by Category](./04_Tableau/Dashboard%20Images/Revenue_by_Category.png)
*Comparison of revenue across product categories.*

![Profit vs Revenue Scatter Plot](./04_Tableau/Dashboard%20Images/Profit_vs._Revenue_scatter.png)
*Scatter plot visualizing product profitability with units sold as dot size.*

---

## Key Insights
- A small number of products drive the majority of revenue
- Certain categories have higher profit margins, highlighting opportunities for focus
- The scatter plot helps identify products that are both high revenue and high profit

---

## Skills Demonstrated
- SQL: Aggregations, ranking, calculating profit margin, preparing Tableau-ready datasets
- Tableau: KPIs, bar charts, scatter plots, filters, interactive dashboards
- Business analytics and data storytelling
