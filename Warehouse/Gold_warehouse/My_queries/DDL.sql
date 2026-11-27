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

CREATE TABLE [dbo].[DimTime] (
    [hour] SMALLINT NOT NULL,
    [time_label] VARCHAR(5) NOT NULL,
    [time_of_day] VARCHAR(20) NOT NULL
);

ALTER TABLE [dbo].[DimTime]
ADD CONSTRAINT [PK_DimTime] PRIMARY KEY NONCLUSTERED ([hour]) NOT ENFORCED;

INSERT INTO [dbo].[DimTime] ([hour], [time_label], [time_of_day])
VALUES (0, '00:00', 'Night'),
    (1, '01:00', 'Night'),
    (2, '02:00', 'Night'),
    (3, '03:00', 'Night'),
    (4, '04:00', 'Night'),
    (5, '05:00', 'Early morning'),
    (6, '06:00', 'Early morning'),
    (7, '07:00', 'Early morning'),
    (8, '08:00', 'Morning'),
    (9, '09:00', 'Morning'),
    (10, '10:00', 'Morning'),
    (11, '11:00', 'Morning'),
    (12, '12:00', 'Afternoon'),
    (13, '13:00', 'Afternoon'),
    (14, '14:00', 'Afternoon'),
    (15, '15:00', 'Afternoon'),
    (16, '16:00', 'Afternoon'),
    (17, '17:00', 'Evening'),
    (18, '18:00', 'Evening'),
    (19, '19:00', 'Evening'),
    (20, '20:00', 'Late evening'),
    (21, '21:00', 'Late evening'),
    (22, '22:00', 'Late evening'),
    (23, '23:00', 'Late evening');

CREATE TABLE [dbo].[FactTaxiDaily] (
    [date] DATE NOT NULL,
    [pickup_location_id] INT NOT NULL,
    [dropoff_location_id] INT NOT NULL,
    [taxi_type_id] SMALLINT NOT NULL,
    [trip_count] BIGINT NOT NULL,
    [total_distance] FLOAT,
    [avg_trip_distance] FLOAT,
    [total_fare] FLOAT,
    [avg_fare] FLOAT,
    [total_amount] FLOAT,
    [avg_total_amount] FLOAT,
    [total_tip] FLOAT,
    [avg_tip] FLOAT
);

ALTER TABLE [dbo].[FactTaxiDaily]
ADD CONSTRAINT [PK_FactTaxiDaily] PRIMARY KEY NONCLUSTERED ([date], [pickup_location_id], [dropoff_location_id], [taxi_type_id]) NOT ENFORCED;
