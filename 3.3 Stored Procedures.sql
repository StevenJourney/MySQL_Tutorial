-- Stored Procedures

SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 5000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$
DELIMITER ;

CALL large_salaries2();

-- Delete a procedure
DROP PROCEDURE IF EXISTS large_salaries2;

-- Recreate the procedure
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_params INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id_params
    ;
END $$
DELIMITER ;

CALL large_salaries3(2);