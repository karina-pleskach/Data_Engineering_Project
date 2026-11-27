SELECT
    taxi_type_id,
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM [dbo].[FactTaxiHourly]
GROUP BY taxi_type_id
ORDER BY taxi_type_id;

SELECT [date],
    [hour],
    [pickup_location_id],
    [dropoff_location_id],
    [taxi_type_id],
    COUNT(*) AS duplicate_count
FROM [dbo].[FactTaxiHourly]
GROUP BY [date], [hour], [pickup_location_id], [dropoff_location_id], [taxi_type_id]
HAVING COUNT(*) > 1;
