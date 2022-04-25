-- In this class we saw a lot of Join and Union 
-- We saw how to use Select Join, Inner Join, Left Join, Right Join, Full Outer Join, Cross Join 
-- For Union we saw the classic for combining query results
SELECT * FROM district_2020
UNION
SELECT * FROM district_2035
ORDER BY id;
-- Also how to customize an Union
SELECT '2020' AS year,
       school_2020 AS school
FROM district_2020

UNION ALL

SELECT '2035' AS year,
       school_2035
FROM district_2035
ORDER BY school, year;
-- Also intersect for elements that are interesct in 2 tables and Except for elements that are excluded from the other table