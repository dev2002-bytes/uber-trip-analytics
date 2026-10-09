/*
Project: Uber Trip Analytics
Purpose: Create enriched analytical dataset
*/


ALTER VIEW [dbo].[vw_TripAnalysis] AS
SELECT
    T.TripID,
    T.PickupTime,
    T.DropOffTime,

    -- Trip metrics
    T.PassengerCount,
    T.TripDistance,
    T.FareAmount,
    T.SurgeFee,
    T.Vehicle,
    T.PaymentType,

    -- Duration
    DATEDIFF(MINUTE, T.PickupTime, T.DropOffTime)
        AS TripDurationMinutes,

    -- Time attributes
    DATEPART(HOUR, T.PickupTime)
        AS PickupHour,

    DATENAME(WEEKDAY, T.PickupTime)
        AS PickupDay,

    DATEPART(MONTH, T.PickupTime)
        AS PickupMonth,

    DATEPART(DAY, T.PickupTime)
        AS PickupDayOfMonth,

    -- Average speed
    CASE
        WHEN DATEDIFF(MINUTE, T.PickupTime, T.DropOffTime) > 0
        THEN T.TripDistance /
             (DATEDIFF(MINUTE, T.PickupTime, T.DropOffTime) / 60.0)
        ELSE NULL
    END AS AverageSpeedMPH,

    -- Pickup location
    T.PULocationID,

    CASE
        WHEN PU.LocationID IN (264, 265)
            THEN 'Unknown'
        ELSE PU.Location
    END AS PickupLocation,

    CASE
        WHEN PU.LocationID IN (264, 265)
            THEN 'Unknown'
        ELSE PU.City
    END AS PickupCity,

    -- Drop-off location
    T.DOLocationID,

    CASE
        WHEN DO.LocationID IN (264, 265)
            THEN 'Unknown'
        ELSE DO.Location
    END AS DropoffLocation,

    CASE
        WHEN DO.LocationID IN (264, 265)
            THEN 'Unknown'
        ELSE DO.City
    END AS DropoffCity

FROM vw_TripDetails AS T

LEFT JOIN vw_Locations AS PU
    ON T.PULocationID = PU.LocationID

LEFT JOIN vw_Locations AS DO
    ON T.DOLocationID = DO.LocationID

    ---Testing the query
    select * from vw_TripAnalysis