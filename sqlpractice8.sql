-- In this practice we saw Data and Time 
-- An example of this was extracting components of a timestamp using date_part()

SELECT
    date_part('year', '2022-12-01 18:37:12 EST'::timestamptz) AS year,
    date_part('month', '2022-12-01 18:37:12 EST'::timestamptz) AS month,
    date_part('day', '2022-12-01 18:37:12 EST'::timestamptz) AS day,
    date_part('hour', '2022-12-01 18:37:12 EST'::timestamptz) AS hour,
    date_part('minute', '2022-12-01 18:37:12 EST'::timestamptz) AS minute,
    date_part('seconds', '2022-12-01 18:37:12 EST'::timestamptz) AS seconds,
    date_part('timezone_hour', '2022-12-01 18:37:12 EST'::timestamptz) AS tz,
    date_part('week', '2022-12-01 18:37:12 EST'::timestamptz) AS week,
    date_part('quarter', '2022-12-01 18:37:12 EST'::timestamptz) AS quarter,
    date_part('epoch', '2022-12-01 18:37:12 EST'::timestamptz) AS epoch;
	
SELECT extract(year from '2022-12-01 18:37:12 EST'::timestamptz) AS year;

SELECT
    current_timestamp,
    localtimestamp,
    current_date,
    current_time,
    localtime,
    now();

-- Setting the time zone for a client session.

SET TIME ZONE 'US/Pacific';

CREATE TABLE time_zone_test (
    test_date timestamptz
);
INSERT INTO time_zone_test VALUES ('2023-01-01 4:00');

SELECT test_date
FROM time_zone_test;

SET TIME ZONE 'US/Eastern';

SELECT test_date
FROM time_zone_test;

SELECT test_date AT TIME ZONE 'Asia/Seoul'
FROM time_zone_test;

-- Math with dates.

SELECT '1929-09-30'::date - '1929-09-27'::date; --Difference displayed in days
SELECT '1929-09-30'::date + '5 years'::interval;


-- Creating a table and importing NYC yellow taxi data.

CREATE TABLE nyc_yellow_taxi_trips (
    trip_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vendor_id text NOT NULL,
    tpep_pickup_datetime timestamptz NOT NULL,
    tpep_dropoff_datetime timestamptz NOT NULL,
    passenger_count integer NOT NULL,
    trip_distance numeric(8,2) NOT NULL,
    pickup_longitude numeric(18,15) NOT NULL,
    pickup_latitude numeric(18,15) NOT NULL,
    rate_code_id text NOT NULL,
    store_and_fwd_flag text NOT NULL,
    dropoff_longitude numeric(18,15) NOT NULL,
    dropoff_latitude numeric(18,15) NOT NULL,
    payment_type text NOT NULL,
    fare_amount numeric(9,2) NOT NULL,
    extra numeric(9,2) NOT NULL,
    mta_tax numeric(5,2) NOT NULL,
    tip_amount numeric(9,2) NOT NULL,
    tolls_amount numeric(9,2) NOT NULL,
    improvement_surcharge numeric(9,2) NOT NULL,
    total_amount numeric(9,2) NOT NULL
);

COPY nyc_yellow_taxi_trips (
    vendor_id,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    passenger_count,
    trip_distance,
    pickup_longitude,
    pickup_latitude,
    rate_code_id,
    store_and_fwd_flag,
    dropoff_longitude,
    dropoff_latitude,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount
   )
FROM '/tmp/nyc_yellow_taxi_trips.csv'
WITH (FORMAT CSV, HEADER);

CREATE INDEX tpep_pickup_idx
ON nyc_yellow_taxi_trips (tpep_pickup_datetime);