SELECT COUNT(*) AS total_rows,
    SUM(CASE 
            WHEN station_id IS NULL OR sensor_id IS NULL OR parameter_id IS NULL OR parameter_name IS NULL OR measurement_value IS NULL OR measurement_datetime IS NULL 
                THEN 1 
            ELSE 0 
        END) AS null_rows,
    SUM(CASE 
            WHEN (measurement_value < 0 AND parameter_name IN ('pm10', 'pm25', 'pm1', 'no2', 'co', 'so2', 'o3', 'no', 'nox')) 
                    OR (parameter_name = 'relativehumidity' AND (measurement_value < 0 OR measurement_value > 100)) 
                THEN 1 
            ELSE 0 
        END) AS invalid_rows
FROM [dbo].[openaq_measurements_hours];

SELECT COUNT(*) AS total_rows,
    SUM(CASE 
            WHEN station_id IS NULL OR sensor_id IS NULL OR parameter_id IS NULL OR parameter_name IS NULL OR measurement_value IS NULL OR measurement_datetime IS NULL 
                THEN 1 
            ELSE 0 
        END) AS null_rows,
    SUM(CASE 
            WHEN (measurement_value < 0 AND parameter_name IN ('pm10', 'pm25', 'pm1', 'no2', 'co', 'so2', 'o3', 'no', 'nox')) 
                    OR (parameter_name = 'relativehumidity' AND (measurement_value < 0 OR measurement_value > 100)) 
                THEN 1 
            ELSE 0 
        END) AS invalid_rows
FROM [dbo].[openaq_measurements_days];