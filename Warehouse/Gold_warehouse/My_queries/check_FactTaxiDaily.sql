SELECT
    taxi_type_id,
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM [dbo].[FactTaxiDaily]
GROUP BY taxi_type_id
ORDER BY taxi_type_id;

SELECT [date],
    [pickup_location_id],
    [dropoff_location_id],
    [taxi_type_id],
    COUNT(*) AS duplicate_count
FROM [dbo].[FactTaxiDaily]
GROUP BY [date], [pickup_location_id], [dropoff_location_id], [taxi_type_id]
HAVING COUNT(*) > 1;

SELECT DISTINCT MONTH([date]) AS month, YEAR([date]) AS year
FROM [dbo].[FactTaxiDaily]
ORDER BY [year], [month];