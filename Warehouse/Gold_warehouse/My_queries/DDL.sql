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

CREATE TABLE [dbo].[DimZone] (
    [LocationID] INT NOT NULL,
    [Borough] VARCHAR(50),
    [Zone] VARCHAR(50),
    [service_zone] VARCHAR(50)
);

ALTER TABLE [dbo].[DimZone]
ADD CONSTRAINT [PK_DimZone] PRIMARY KEY NONCLUSTERED ([LocationID]) NOT ENFORCED;

CREATE TABLE [dbo].[DimTaxiType] (
    [taxi_type_id] SMALLINT NOT NULL,
    [taxi_type] VARCHAR(10) NOT NULL
);

ALTER TABLE [dbo].[DimTaxiType]
ADD CONSTRAINT [PK_DimTaxiType] PRIMARY KEY NONCLUSTERED ([taxi_type_id]) NOT ENFORCED;