--With DATEDIFF
SELECT FLOOR(DATEDIFF(day, '2023-01-01', date) / 7.0) + 1 AS week_number, SUM(amount_spent) / COUNT(user_id) AS Average_amt_spent
FROM hiromi_user_purchases
WHERE day_name = 'Friday' AND MONTH(date) IN (1, 2, 3)
GROUP BY date

--With DATEPART
SELECT DATEPART(WEEK, date) AS week_number, SUM(amount_spent) / COUNT(user_id) AS Average_amt_spent
FROM hiromi_user_purchases
WHERE day_name = 'Friday' AND MONTH(date) IN (1, 2, 3)
GROUP BY date