-- In this clas we saw:
-- Constraints 
-- Primary Keys (must be unique and not null)
-- Foreign Keys (must exist in the main table)
-- Check 
-- Check in
-- We did some examples in our local database for these operations 
-- This example is for create a table to check constraints
CREATE TABLE check_constraint_example (
    user_id bigint GENERATED ALWAYS AS IDENTITY,
    user_role text,
    salary numeric(10,2),
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
    CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
    CONSTRAINT check_salary_not_below_zero CHECK (salary >= 0)
);
