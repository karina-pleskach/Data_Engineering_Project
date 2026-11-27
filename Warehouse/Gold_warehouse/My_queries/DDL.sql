CREATE TABLE [dbo].[DimDate] (
    [date] DATE NOT NULL,
    [year] SMALLINT NOT NULL,
    [month] SMALLINT NOT NULL,
    [month_name] VARCHAR(9) NOT NULL,
    [day] SMALLINT NOT NULL,
    [day_of_week] SMALLINT NOT NULL,
    [day_name] VARCHAR(9) NOT NULL,
    [season] VARCHAR(6) NOT NULL
);

ALTER TABLE [dbo].[DimDate]
ADD CONSTRAINT [PK_DimDate] PRIMARY KEY NONCLUSTERED ([date]) NOT ENFORCED;