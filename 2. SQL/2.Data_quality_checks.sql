/*
Project: Uber Trip Analytics
Purpose: Data quality validation
*/

select 'TripDetails' as TableName,count(*) as Counts from [dbo].['Trip Details$']
union all
select 'Location' as Tablename, count(*) as Counts from [dbo].['Location Table$']


--Describe data
Exec sp_help "[dbo].['Trip Details$']"
Exec sp_help "[dbo].['Location Table$']"

--Check Nulls

select

	count(*) as TotalRows,
	sum(case when [Trip ID] is null then 1 else 0 end) as Null_TripID,
	sum(case when [Pickup Time] is null then 1 else 0 end) as Null_PickupTime,
	sum(case when [Drop Off Time] is null then 1 else 0 end) as Null_Drop_Off_Time,
	sum(case when [passenger_count] is null then 1 else 0 end) as Null_passenger_count,
	sum(case when [trip_distance] is null then 1 else 0 end) as Null_trip_distance,
	sum(case when [PULocationID] is null then 1 else 0 end) as Null_PULocationID,
	sum(case when [fare_amount] is null then 1 else 0 end) as Null_fare_amount

	from [dbo].['Trip Details$']



	--Check Duplicates on TripID

	select [Trip ID],count(*) as Duplicates
	from [dbo].['Trip Details$']
	group by [Trip ID]
	having count(*)>1


	--Check Duplicates on LocationID

	select [LocationID],count(*) as Duplicates
	from [dbo].['Location Table$']
	group by [LocationID]
	having count(*)>1

	-- Check TripID,PULocationID,DOLOcationID,LoactionID is not floor/decimal
	
	select [Trip ID],count(*) as NonintTripid
	from [dbo].['Trip Details$']
	where [Trip ID]<>floor([Trip ID])
	group by [Trip ID]

	select PULocationID,count(*) as nonintPULocationID
	from [dbo].['Trip Details$']
	where [PULocationID]<>floor(PULocationID)
	group by PULocationID

	select DOLocationID,count(*) as nonintDOLocationID
	from [dbo].['Trip Details$']
	where [DOLocationID]<>floor(DOLocationID)
	group by DOLocationID

	select COUNT(*) AS nonintLocid
	from [dbo].['Location Table$']
	where LocationID<>floor(LocationID)

	--Check LocationID is not null

	select count(*) as TotalRows,
	SUM(case when [LocationID] is null then 1 else 0 end) as TotalNullLocationID,
	SUM(case when [Location] is null then 1 else 0 end) as TotalNullLocation,
	SUM(case when [city] is null then 1 else 0 end) as TotalNullCity
	from [dbo].['Location Table$']
	

	--Check for Orphan Pickup Location

	select distinct Pulocationid
	from [dbo].['Trip Details$'] as T  left join [dbo].['Location Table$'] as L on T.PULocationID=L.Locationid
	where L.locationid is null


	--Check for Orphan DropOff Location

	select distinct DOlocationid 
	from [dbo].['Trip Details$'] as T left join [dbo].['Location Table$'] as L on T.Dolocationid=L.locationid
	where L.Locationid is null

	--Check Invalid Numeric Values

	SELECT
    SUM(CASE WHEN passenger_count < 0 THEN 1 ELSE 0 END) AS NegativePassengers,
    SUM(CASE WHEN trip_distance < 0 THEN 1 ELSE 0 END) AS NegativeDistance,
    SUM(CASE WHEN fare_amount < 0 THEN 1 ELSE 0 END) AS NegativeFare,
    SUM(CASE WHEN [Surge Fee] < 0 THEN 1 ELSE 0 END) AS NegativeSurgeFee
FROM dbo.['Trip Details$']

