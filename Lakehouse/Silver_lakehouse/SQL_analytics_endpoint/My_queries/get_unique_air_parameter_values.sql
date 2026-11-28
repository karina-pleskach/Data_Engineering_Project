SELECT DISTINCT [parameter_name] AS parameter_value, 'name' AS column_name
FROM [dbo].[openaq_measurements_days]
UNION
SELECT DISTINCT [parameter_display_name], 'display_name'
FROM [dbo].[openaq_measurements_days]
UNION
SELECT DISTINCT [parameter_units], 'units'
FROM [dbo].[openaq_measurements_days]
ORDER BY column_name, parameter_value;

SELECT DISTINCT [parameter_name] AS parameter_value
FROM [dbo].[openaq_measurements_hours]
ORDER BY parameter_value;