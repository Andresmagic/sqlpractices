-- We learned how to clean data 
-- First here's an example to find duplicates 
SELECT company,
       street,
       city,
       st,
       count(*) AS address_count
FROM meat_poultry_egg_establishments
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;
-- Group data and finding non functional data
SELECT st, 
       count(*) AS st_count
FROM meat_poultry_egg_establishments
GROUP BY st
ORDER BY st;
-- Create new columns and sorting the table through it
ALTER TABLE meat_poultry_egg_establishments ADD COLUMN meat_processing boolean;
UPDATE meat_poultry_egg_establishments set meat_processing = true WHERE activities LIKE '%Meat Processing%';
-- with this u can do an aggregate function
SELECT max(establishment_number)
FROM meat_pultry_egg_establishments
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;