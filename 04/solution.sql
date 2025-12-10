
--No LAG approach
WITH actual AS (
SELECT FORMAT(request_date, 'yyyy-MM') a_year_month, SUM(distance_to_travel) / SUM(monetary_cost) AS a_distance_per_dollar  
FROM hiromi_uber_request_logs
GROUP BY FORMAT(request_date, 'yyyy-MM')),

forecast AS (
SELECT FORMAT(DATEADD(MONTH, 1, CAST(request_date as date)), 'yyyy-MM') f_year_month, SUM(distance_to_travel) / SUM(monetary_cost) AS f_distance_per_dollar  
FROM hiromi_uber_request_logs
GROUP BY FORMAT(DATEADD(MONTH, 1, CAST(request_date as date)), 'yyyy-MM')
)

SELECT ROUND(sqrt(avg(square((a_distance_per_dollar - f_distance_per_dollar)))),2) AS RMSE
FROM actual a
LEFT JOIN forecast f ON a.a_year_month = f.f_year_month


--With LAG approach
WITH actual AS (
SELECT FORMAT(request_date, 'yyyy-MM') a_year_month, SUM(distance_to_travel) / SUM(monetary_cost) AS a_distance_per_dollar  
FROM hiromi_uber_request_logs
GROUP BY FORMAT(request_date, 'yyyy-MM')),

forecast AS (
SELECT a_year_month, a_distance_per_dollar, LAG(a_distance_per_dollar, 1) OVER (ORDER BY a_year_month) AS forecasted_value
FROM actual
)

SELECT ROUND(sqrt(avg(square((a_distance_per_dollar - forecasted_value)))),2) AS RMSE
FROM forecast
WHERE forecasted_value IS NOT NULL