WITH customer_revenue AS (
	SELECT 
		customer,
		COUNT(DISTINCT order_id) AS total_orders,
		SUM(sales) AS total_revenue,
		AVG(sales) AS avg_order_value 
	FROM superstore_dataset sd 
	GROUP BY customer
)
SELECT
	customer,
	total_orders,
	ROUND(total_revenue::NUMERIC, 2) AS total_revenue,
	ROUND(avg_order_value::NUMERIC, 2) AS avg_order_value,
	CASE
		WHEN NTILE(5) OVER (ORDER BY total_revenue DESC) = 1 THEN 'High Value'
		WHEN NTILE(5) OVER (ORDER BY total_revenue DESC) IN (2, 3, 4) THEN 'Mid Value'
		ELSE 'Low Value'
	END AS customer_segment
FROM customer_revenue
ORDER BY total_revenue DESC;
