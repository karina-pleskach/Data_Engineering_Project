SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT year) AS unique_years,
    SUM(CASE WHEN gdp_value IS NULL THEN 1 ELSE 0 END) AS missing_values,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM dbo.usa_gdp_values;