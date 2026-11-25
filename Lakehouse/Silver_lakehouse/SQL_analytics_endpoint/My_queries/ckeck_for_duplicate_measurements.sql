SELECT station_id,
    sensor_id,
    parameter_id,
    measurement_datetime,
    COUNT(*) AS duplicate_count
FROM [dbo].[openaq_measurements_hours]
GROUP BY station_id, sensor_id, parameter_id, measurement_datetime
HAVING COUNT(*) > 1;

SELECT station_id,
    sensor_id,
    parameter_id,
    measurement_datetime,
    COUNT(*) AS duplicate_count
FROM [dbo].[openaq_measurements_days]
GROUP BY station_id, sensor_id, parameter_id, measurement_datetime
HAVING COUNT(*) > 1;