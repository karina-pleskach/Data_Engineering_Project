SELECT *
FROM [dbo].[yellow_tripdata]
WHERE pickup_location_id < 1 OR pickup_location_id > 265
   OR dropoff_location_id < 1 OR dropoff_location_id > 265;