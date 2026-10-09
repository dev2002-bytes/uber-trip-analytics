/*
Project: Uber Trip Analytics
Purpose: Create standardized SQL views
*/


CREATE VIEW vw_TripDetails AS
SELECT
    CAST([Trip ID] AS INT) AS TripID,
    [Pickup Time] AS PickupTime,
    [Drop Off Time] AS DropOffTime,
    CAST(passenger_count AS INT) AS PassengerCount,
    trip_distance AS TripDistance,
    CAST(PULocationID AS INT) AS PULocationID,
    CAST(DOLocationID AS INT) AS DOLocationID,
    fare_amount AS FareAmount,
    [Surge Fee] AS SurgeFee,
    Vehicle,
    Payment_type AS PaymentType
FROM dbo.['Trip Details$']


CREATE VIEW vw_Locations AS
SELECT
    CAST(LocationID AS INT) AS LocationID,
    Location,
    City
FROM dbo.['Location Table$']


--Testing Queries
select * from vw_TripDetails
select * from vw_Locations


