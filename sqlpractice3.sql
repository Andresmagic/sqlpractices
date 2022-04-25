-- We did math in SQL with some basic operations like addition, subtraction, multiplication, division, etc.
-- Here are some examples 
SELECT 6 + 10;

SELECT 10 / 2;

SELECT 7 * 7;

-- Percentiles  
SELECT
    percentile_cont(.5)
    WITHIN GROUP (ORDER BY numbers),
    percentile_disc(.5)
    WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;
-- Average and sumation
SELECT sum(pop_est_2019) AS county_sum,
       round(avg(pop_est_2019), 0) AS county_average,
       percentile_cont(.5)
       WITHIN GROUP (ORDER BY pop_est_2019) AS county_median
FROM us_counties_pop_est_2019;
