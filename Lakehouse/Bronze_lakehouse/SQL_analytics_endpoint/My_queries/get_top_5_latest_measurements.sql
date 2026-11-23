SELECT count(*)
FROM dbo.OpenAQ_measurements_hours;

SELECT TOP 5 *
FROM dbo.OpenAQ_measurements_hours
WHERE [sensors.id] = 7972608
ORDER BY [measurement.period.datetimeFrom.utc] ASC;

SELECT TOP 5 *
FROM dbo.OpenAQ_measurements_hours
WHERE [sensors.id] = 7972608
ORDER BY [measurement.period.datetimeFrom.utc] DESC;

SELECT TOP 5 *
FROM dbo.OpenAQ_measurements_days
WHERE [sensors.id] = 7972608
ORDER BY [measurement.period.datetimeFrom.utc] ASC;

SELECT TOP 5 *
FROM dbo.OpenAQ_measurements_days
WHERE [sensors.id] = 7972608
ORDER BY [measurement.period.datetimeFrom.utc] DESC;
