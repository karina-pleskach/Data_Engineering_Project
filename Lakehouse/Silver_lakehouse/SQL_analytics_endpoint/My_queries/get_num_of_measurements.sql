SELECT 'hours' AS type, COUNT(*)
FROM [dbo].[openaq_measurements_hours]
UNION ALL
SELECT 'days', COUNT(*)
FROM [dbo].[openaq_measurements_days];