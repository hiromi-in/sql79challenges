
WITH monthly_rev AS (
SELECT FORMAT(created_at, 'yyyy-MM') year_month
	,  SUM(value) monthly_revenue
FROM hiromi_sf_transactions
GROUP BY FORMAT(created_at, 'yyyy-MM')
)


SELECT year_month
    ,  monthly_revenue 
	,  CASE WHEN LAG(monthly_revenue, 1) OVER (ORDER BY year_month) IS NULL THEN NULL
		WHEN LAG(monthly_revenue, 1) OVER (ORDER BY year_month) IS NOT NULL THEN ROUND(CAST((monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY year_month)) as float) / CAST((LAG(monthly_revenue, 1) OVER (ORDER BY year_month)) as float) * 100 , 2)
		END AS percentage_change
FROM monthly_rev

