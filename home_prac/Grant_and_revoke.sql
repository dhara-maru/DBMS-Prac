--GRANT
GRANT INSERT, SELECT
ON person_table
TO dhara

--revoke
REVOKE INSERT 
ON person_table
FROM dhara

REVOKE ALL PRIVILEGES 
ON employees 
FROM dhara

GRANT ALL PRIVILEGES 
ON employees 
TO dhara