{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Baskerville;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0

\f0\fs72 \cf0 # Project 3: Product Performance Analysis
\fs26 \
\

\fs36 ## Overview\
This project analyzes product-level performance in a retail dataset (Superstore) to identify the top revenue drivers and profitability trends. The dashboard provides a comprehensive view of revenue, profit, and profit margin across products and categories, allowing stakeholders to make data-driven decisions.\
\
Key features include:\
- **KPIs** for Total Revenue, Total Profit, and Average Profit Margin\
- **Top 10 Products** by Revenue\
- **Revenue by Category**\
- **Profit vs Revenue Scatter Plot** with dot size representing units sold and color representing category\
\
Interactive filters for **Category** and **Sub-Category** allow users to explore specific product segments.\
\
---\
\
## Data\
- **Source:** Superstore dataset (CSV exported from SQL query)\
- **Key Fields:**\
  - `product_name`\
  - `category`\
  - `sub_category`\
  - `total_revenue` (SUM of sales)\
  - `total_profit` (SUM of profit)\
  - `profit_margin` (Profit \'f7 Revenue)\
  - `units_sold` (SUM of quantity)\
  - `total_orders` (COUNT of orders)\
  - `revenue_rank` (RANK by revenue)\
\
---\
\
## SQL\
The SQL query aggregates product-level performance metrics to create a clean, Tableau-ready dataset. It calculates total revenue, profit, units sold, profit margin, and assigns a revenue rank to each product. This dataset powers KPIs, bar charts, and the scatter plot in the dashboard.\
\
```sql\
SELECT\
    product_name,\
    category,\
    sub_category,\
    COUNT(DISTINCT order_id) AS total_orders,\
    SUM(quantity) AS units_sold,\
    ROUND(SUM(sales)::numeric, 2) AS total_revenue,\
    ROUND(SUM(profit)::numeric, 2) AS total_profit,\
    ROUND(SUM(profit)::numeric / NULLIF(SUM(sales)::numeric, 0), 2) AS profit_margin,\
    RANK() OVER (ORDER BY SUM(sales) DESC) AS revenue_rank\
FROM superstore\
GROUP BY product_name, category, sub_category;}