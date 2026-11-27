SELECT COUNT(*) AS num_of_rows,
    COUNT(DISTINCT LocationID) AS unique_location_ids,
    MIN(LocationID) AS min_location_id,
    MAX(LocationID) AS max_location_id
FROM [dbo].[DimZone];

SELECT *
FROM [Silver_lakehouse].[dbo].[nyc_taxi_zones]
EXCEPT
SELECT *
FROM [dbo].[DimZone];