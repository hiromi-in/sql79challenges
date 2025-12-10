SELECT nationality, SUM(n_beds) #ofBeds
FROM hiromi_airbnb_apartments a
LEFT JOIN hiromi_airbnb_hosts h ON a.host_id = h.host_id
GROUP BY nationality
ORDER BY #ofBeds DESC