SELECT TOP 10 driver_name, total_points
FROM driver_features
ORDER BY total_points DESC;

SELECT TOP 10 name_constructor, performance_index
FROM constructor_features
ORDER BY performance_index DESC;

SELECT driver_name, avg_points, high_performer_flag, reliable_driver_flag
FROM driver_features
WHERE high_performer_flag = 1 AND reliable_driver_flag = 1;

SELECT driver_name, avg_points, high_performer_flag, reliable_driver_flag
FROM driver_features
WHERE high_performer_flag = 1 AND reliable_driver_flag = 1;

--Trend analysis
SELECT season, AVG(points) AS avg_points
FROM f1_recent_10yrs
GROUP BY season
ORDER BY season;

SELECT season, AVG(CAST(dnf AS FLOAT)) * 100 AS dnf_percentage
FROM f1_recent_10yrs
GROUP BY season
ORDER BY season;

SELECT driver_name, season, SUM(points) AS total_points
FROM f1_recent_10yrs
WHERE driver_name IN ('Lewis Hamilton', 'Max Verstappen', 'Lando Norris')
GROUP BY driver_name, season
ORDER BY driver_name, season;

--Segmentation
SELECT driver_name, avg_points, dnf_rate, consistency_index
FROM driver_features
ORDER BY avg_points DESC, consistency_index DESC;

SELECT name_constructor, avg_points, dnf_rate
FROM constructor_features
ORDER BY avg_points DESC, dnf_rate ASC;

SELECT driver_name, AVG(grid_vs_finish) AS avg_grid_vs_finish
FROM f1_recent_10yrs
GROUP BY driver_name
ORDER BY avg_grid_vs_finish DESC;

-- Driver performance with constructor
SELECT d.driver_name, d.avg_points, c.name_constructor, c.avg_points AS constructor_avg_points
FROM driver_features d
JOIN f1_recent_10yrs f ON d.driver_name = f.driver_name
JOIN constructor_features c ON f.name_constructor = c.name_constructor
GROUP BY d.driver_name, d.avg_points, c.name_constructor, c.avg_points;

SELECT driver_name, avg_points,
       NTILE(4) OVER (ORDER BY avg_points DESC) AS performance_quartile
FROM driver_features;










