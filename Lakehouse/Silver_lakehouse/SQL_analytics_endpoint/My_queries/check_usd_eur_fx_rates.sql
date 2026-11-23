SELECT
    COUNT(*) AS total_rows,
    DATEDIFF(day, MIN(date), MAX(date)) + 1 AS expected_rows,
    MIN(date) AS min_date,
    MAX(date) AS max_date,
    SUM(CASE WHEN eur_to_usd_multiplier IS NULL THEN 1 ELSE 0 END) AS missing_eur_to_usd,
    SUM(CASE WHEN usd_to_eur_multiplier IS NULL THEN 1 ELSE 0 END) AS missing_usd_to_eur
FROM dbo.usd_eur_fx_rates;
