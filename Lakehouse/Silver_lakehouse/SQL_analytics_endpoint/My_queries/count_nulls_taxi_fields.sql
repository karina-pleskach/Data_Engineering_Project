SELECT
    COUNT(*) AS total_rows,
    COUNT(pickup_datetime) AS pickup_datetime_not_null,
    COUNT(dropoff_datetime) AS dropoff_datetime_not_null,
    COUNT(passenger_count) AS passenger_count_not_null,
    COUNT(trip_distance) AS trip_distance_not_null,
    COUNT(pickup_location_id) AS pickup_location_id_not_null,
    COUNT(dropoff_location_id) AS dropoff_location_id_not_null,
    COUNT(fare_amount) AS fare_amount_not_null,
    COUNT(total_amount) AS total_amount_not_null,
    COUNT(tip_amount) AS tip_amount_not_null
FROM dbo.yellow_tripdata;