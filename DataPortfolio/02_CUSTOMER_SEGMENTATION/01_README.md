{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Baskerville;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0

\f0\fs72 \cf0 # Project 2: Customer Segmentation Analysis\

\fs26 \

\fs36 ## Overview\
This project segments customers based on their purchasing behavior using a retail dataset (Superstore). The goal is to identify high-value and low-value customer groups to inform marketing strategies, promotions, and business decisions.\
\
The dashboard provides:\
- **Customer KPIs:** Total Revenue and Average Order Value  \
- **Revenue by Customer:** Bar chart of top customers  \
- **Customer Segments:** Scatter plot showing customers grouped into segments based on revenue and average order value  \
\
Interactive filters for **Region** and **Customer Segment** allow stakeholders to explore patterns across different customer groups.\
\
---\
\
## Data\
- **Source:** Superstore dataset (CSV exported from SQL query)  \
- **Key Fields:**\
  - `customer_id` (generated if not in source)  \
  - `region`  \
  - `total_revenue` (SUM of sales per customer)  \
  - `avg_order_value` (Total Revenue \'f7 Total Orders)  \
  - `total_orders` (COUNT of orders)  \
  - `customer_segment` (calculated via revenue/avg_order_value segmentation)\
\
---\
\
## SQL\
The SQL query aggregates customer-level metrics and creates segments for analysis. It calculates total revenue, average order value, total orders, and assigns each customer to a segment using window functions.\
\
```sql\
WITH customer_data AS (\
    SELECT\
        customer_id,\
        region,\
        COUNT(DISTINCT order_id) AS total_orders,\
        SUM(sales) AS total_revenue,\
        SUM(sales)/NULLIF(COUNT(DISTINCT order_id),0) AS avg_order_value\
    FROM superstore\
    GROUP BY customer_id, region\
),\
customer_segments AS (\
    SELECT\
        *,\
        NTILE(3) OVER (ORDER BY total_revenue DESC) AS revenue_segment,\
        NTILE(3) OVER (ORDER BY avg_order_value DESC) AS order_value_segment\
    FROM customer_data\
)\
SELECT *,\
    CASE\
        WHEN revenue_segment = 3 AND order_value_segment = 3 THEN 'High-Value'\
        WHEN revenue_segment = 1 AND order_value_segment = 1 THEN 'Low-Value'\
        ELSE 'Mid-Value'\
    END AS customer_segment\
FROM customer_segments;}