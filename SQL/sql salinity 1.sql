USE salinity_health_db;
SHOW TABLES;
SELECT COUNT(*) FROM salinity_data;
SELECT DISTINCT district FROM salinity_data;
SELECT district, COUNT(*) AS total_stations
FROM salinity_data
GROUP BY district;
SELECT river, COUNT(*) AS total
FROM salinity_data
GROUP BY river;
SELECT district, COUNT(*) AS total
FROM salinity_data
GROUP BY district
ORDER BY total DESC;
SELECT * FROM salinity_data
WHERE district = 'Khulna';
SELECT * FROM salinity_data
ORDER BY last_date DESC;