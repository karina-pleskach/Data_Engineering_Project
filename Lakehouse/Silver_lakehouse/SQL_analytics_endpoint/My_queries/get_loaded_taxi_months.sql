SELECT 'yellow' AS taxi_type, MAX([pickup_datetime]) AS max_loaded_date
FROM [dbo].[yellow_tripdata]
UNION
SELECT 'green' AS taxi_type, MAX([pickup_datetime]) AS max_loaded_date
FROM [dbo].[green_tripdata]
UNION
SELECT 'fhv' AS taxi_type, MAX([pickup_datetime]) AS max_loaded_date
FROM [dbo].[fhv_tripdata]
UNION
SELECT 'fhvhv' AS taxi_type, MAX([pickup_datetime]) AS max_loaded_date
FROM [dbo].[fhvhv_tripdata];

SELECT DISTINCT 'yellow' AS taxi_type, FORMAT([pickup_datetime], 'yyyy-MM') AS year_month
FROM [dbo].[yellow_tripdata]
-- ORDER BY taxi_type, year_month;
UNION
SELECT DISTINCT 'green', FORMAT([pickup_datetime], 'yyyy-MM')
FROM [dbo].[green_tripdata]
UNION
SELECT DISTINCT 'fhv', FORMAT([pickup_datetime], 'yyyy-MM')
FROM [dbo].[fhv_tripdata]
UNION
SELECT DISTINCT 'fhvhv', FORMAT([pickup_datetime], 'yyyy-MM')
FROM [dbo].[fhvhv_tripdata]
ORDER BY taxi_type, year_month;
