
WITH base AS(
SELECT top_genre, SUM(winner) AS #OfWin, nominee
FROM hiromi_oscar_nominees n
LEFT JOIN hiromi_nominee_information i ON n.nominee = i.name 
GROUP BY nominee, top_genre
)

SELECT TOP 1 top_genre, nominee
FROM base
GROUP BY top_genre, nominee, #OfWin
ORDER BY #OfWin DESC, nominee 