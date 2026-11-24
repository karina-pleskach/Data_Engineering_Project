SELECT
    [sensors.id],
    MAX([measurement.period.datetimeTo.utc]) AS last_date,
    MAX([datetimeLast.utc]) AS date_to
FROM dbo.OpenAQ_measurements_hours
GROUP BY [sensors.id]
ORDER BY [sensors.id];

SELECT
    [sensors.id],
    MAX([measurement.period.datetimeTo.utc]) AS last_date,
    MAX([datetimeLast.utc]) AS date_to
FROM dbo.OpenAQ_measurements_days
GROUP BY [sensors.id]
ORDER BY [sensors.id];