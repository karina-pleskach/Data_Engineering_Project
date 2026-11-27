SELECT MIN([date]) AS min_date,
    MAX([date]) AS max_date,
    COUNT(*) AS num_of_rows,
    DATEDIFF(DAY, MIN([date]), MAX([date])) + 1 AS expected_num_of_rows
FROM [dbo].[DimDate];