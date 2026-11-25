SELECT MAX([pickup_datetime])
FROM [dbo].[yellow_tripdata];

SELECT DISTINCT(FORMAT([pickup_datetime], 'yyyy-MM'))
FROM [dbo].[yellow_tripdata];