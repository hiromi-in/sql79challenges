
--1st attempt
WITH current_launch AS (
SELECT company_name, COUNT(*) #OfLaunch
FROM hiromi_car_launches
WHERE year = 2020
GROUP BY company_name),

previous AS(
SELECT company_name, COUNT(*) #OfLaunch
FROM hiromi_car_launches
WHERE year = 2019
GROUP BY company_name)


SELECT c.company_name, (c.#OfLaunch - (CASE WHEN p.#OfLaunch IS NULL THEN 0 ELSE p.#OfLaunch END)) AS net_difference
FROM current_launch c 
LEFT JOIN previous p ON c.company_name = p.company_name
ORDER BY net_difference DESC

--2nd attempt
WITH base AS(
SELECT company_name
	,  SUM(CASE WHEN year=2020 THEN 1 ELSE 0 END) AS #OfLaunch20
	,  SUM(CASE WHEN year=2019 THEN 1 ELSE 0 END) AS #OfLaunch19
FROM hiromi_car_launches
GROUP BY company_name
)

SELECT company_name, #OfLaunch20 - #OfLaunch19 AS net_difference
FROM base
ORDER BY net_difference DESC

--3rd attempt
SELECT company_name, SUM(CASE WHEN year=2020 THEN 1 ELSE 0 END) - SUM(CASE WHEN year=2019 THEN 1 ELSE 0 END) AS net_difference
FROM hiromi_car_launches
GROUP BY company_name 
ORDER BY net_difference DESC