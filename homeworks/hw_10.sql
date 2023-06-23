---------- TASK 1 ----------
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

SELECT * FROM locations2;

---------- TASK 2 ----------
INSERT INTO locations2 (location_id, street_address, city, country_id) (
    SELECT location_id, street_address, city, country_id FROM locations
    WHERE country_id = (
        SELECT country_id FROM countries
        WHERE country_name = 'Italy'
    )
);
ROLLBACK;

INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (3300, '1314 Sezam', 'Milan', 'IT');

INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (3400, '1516 Pushkin', 'Turin', 'IT');

---------- TASK 3 ----------
COMMIT;

---------- TASK 4 ----------
INSERT INTO locations2
VALUES (3500, '1718 De Golle', 12345, INITCAP('paris'),
'Some province 1', UPPER('fr'));

INSERT INTO locations2
VALUES (3600, '1920 Jules Verne', 67890, INITCAP('lion'),
'Some province 2', UPPER('fr'));

---------- TASK 5 ----------
COMMIT;

---------- TASK 6 ----------
INSERT INTO locations2
(SELECT * FROM locations WHERE LENGTH(state_province) > 9);

---------- TASK 7 ----------
COMMIT;

---------- TASK 8 ----------
CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);

SELECT * FROM locations4europe;

---------- TASK 9 ----------
INSERT ALL
WHEN 1=1 THEN
INTO locations2
VALUES (location_id, street_address, postal_code,
city, state_province, country_id)
WHEN country_id IN (
    SELECT country_id FROM countries
    WHERE region_id = (
        SELECT region_id FROM regions
        WHERE region_name = 'Europe'
    )
) THEN
INTO locations4europe (location_id, street_address, city, country_id)
VALUES (location_id, street_address, city, country_id)
SELECT * FROM locations;

---------- TASK 10 ----------
COMMIT;

---------- TASK 11 ----------
UPDATE locations2 SET postal_code = 77777
WHERE postal_code IS NULL;

SELECT * FROM locations2 WHERE postal_code IS NULL;

SELECT * FROM locations2;

---------- TASK 12 ----------
ROLLBACK;

---------- TASK 13 ----------
UPDATE locations2 SET postal_code =
(SELECT postal_code FROM locations WHERE location_id = 2600)
WHERE postal_code IS NULL;

---------- TASK 14 ----------
COMMIT;

---------- TASK 15 ----------
DELETE FROM locations2 WHERE country_id = 'IT';

---------- TASK 16 ----------
SAVEPOINT sp1;

---------- TASK 17 ----------
UPDATE locations2 SET street_address = 'Sezam st. 18'
WHERE location_id > 2500;

---------- TASK 18 ----------
SAVEPOINT sp2;

---------- TASK 19 ----------
DELETE FROM locations2 WHERE street_address = 'Sezam st. 18';

---------- TASK 20 ----------
ROLLBACK TO SAVEPOINT sp1;

---------- TASK 21 ----------
COMMIT;

--------------------------------------------------------------------------------
SELECT * FROM employees;
SELECT * FROM countries;

INSERT INTO countries VALUES('SE', 'Sweden', 1);

INSERT INTO countries (region_id, country_name, country_id)
VALUES(1, 'Greece', 'GR');

INSERT INTO countries (country_id, country_name, region_id)
VALUES('NO', 'Norway', 1);

INSERT INTO countries (country_id, country_name)
VALUES('PO', 'Portugal');

INSERT INTO countries (country_id, country_name, region_id)
VALUES('NO', 'Norway', 1);

INSERT INTO countries (country_id, country_name, region_id)
VALUES('FI', 'Finland', null);

INSERT INTO countries (country_id, country_name, region_id)
VALUES('HR', 'Croatia', 5);

SELECT * FROM employees;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (210, 'Radionov', 'RADIONOV', '29-APR-2023', 'IT_PROG');

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (
    211,
    INITCAP('radionov'),
    UPPER('radionov1'),
    TO_DATE('29-APR-2023', 'DD-MON-YYYY'),
    UPPER('it_prog')
);

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (
    200 + 12,
    INITCAP('radionov'),
    UPPER('radionov2'),
    SYSDATE,
    UPPER('it_prog')
);

CREATE TABLE new_emps (
    emp_id integer,
    name varchar2(20),
    start_date date,
    job varchar2(10)
);

SELECT * FROM new_emps;

INSERT INTO new_emps (emp_id, name, start_date)
(SELECT employee_id, first_name, hire_date FROM employees
WHERE employee_id > 200);

INSERT INTO new_emps
(SELECT employee_id, first_name, hire_date, job_id FROM employees
WHERE employee_id > 200);

CREATE TABLE emps_with_high_salary (
    name varchar2(20),
    salary integer
);

CREATE TABLE emps_with_dep_100 (
    name varchar2(20),
    salary integer
);

CREATE TABLE some_emps (
    name varchar2(20),
    salary integer
);

INSERT ALL
WHEN department_id = 100 THEN
INTO emps_with_dep_100 VALUES (first_name, salary)
WHEN salary > 15000 THEN
INTO emps_with_high_salary (name) VALUES (last_name)
WHEN 5 = 5 THEN
INTO some_emps (name, salary) VALUES (first_name, salary)
SELECT first_name, last_name, salary, department_id
FROM employees WHERE LENGTH(first_name) > 5;

SELECT * FROM emps_with_dep_100;
SELECT * FROM emps_with_high_salary;
SELECT * FROM some_emps;

SELECT * FROM employees;

UPDATE employees SET salary = 10000 WHERE employee_id = 100;
UPDATE employees SET salary = salary * 2 WHERE employee_id = 100;

UPDATE employees SET salary = 24000, job_id = 'AD_PRES' WHERE employee_id = 100;

UPDATE employees SET salary = 27000, job_id = 'IT_PROG' WHERE employee_id = 100;

UPDATE employees SET salary = 8000 WHERE employee_id < 105;

UPDATE employees SET salary = 100;

UPDATE employees SET salary = 5000 WHERE department_id = (
    SELECT department_id FROM departments
    WHERE department_name = 'Marketing'
);

UPDATE employees SET salary = (SELECT MAX(salary) FROM employees),
hire_date = (SELECT MIN(start_date) FROM job_history)
WHERE employee_id = 180;

SELECT * FROM new_emps;

DELETE FROM new_emps;

INSERT INTO new_emps
(SELECT employee_id, first_name, hire_date, job_id FROM employees);

DELETE FROM new_emps WHERE emp_id = 210;

DELETE FROM new_emps WHERE job LIKE '%CLERK%' OR name IS NULL;

DELETE FROM new_emps WHERE job IN (
    SELECT DISTINCT job_id FROM employees
    WHERE department_id IN (
        SELECT department_id FROM departments
        WHERE manager_id = 100
    )
);

SELECT * FROM new_emps;
SELECT * FROM employees;

INSERT INTO new_emps (
    SELECT employee_id, first_name, hire_date, job_id
    FROM employees
    WHERE employee_id < 110
);

MERGE INTO new_emps ne
USING employees e
ON (ne.emp_id = e.employee_id)
WHEN MATCHED THEN
    UPDATE SET ne.start_date = SYSDATE
    DELETE WHERE ne.job LIKE '%IT%'
WHEN NOT MATCHED THEN
    INSERT (emp_id, name, start_date, job)
    VALUES (employee_id, first_name, hire_date, job_id);
    
COMMIT;

DELETE FROM new_emps;

INSERT INTO new_emps
(SELECT employee_id, last_name, hire_date, job_id FROM employees);

COMMIT;

SELECT * FROM new_emps;

DELETE FROM new_emps WHERE name = 'Radionov';

ROLLBACK;

INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
UPDATE new_emps SET emp_id = 300 WHERE emp_id = 100;
DELETE FROM new_emps WHERE emp_id = 101;

ROLLBACK;

INSERT INTO new_emps VALUES (1000, 'Igor', sysdate, 'IT_PROG');
SAVEPOINT s1;
UPDATE new_emps SET emp_id = 300 WHERE emp_id = 100;
SAVEPOINT s2;
DELETE FROM new_emps WHERE emp_id = 101;

ROLLBACK TO SAVEPOINT s2;
ROLLBACK TO SAVEPOINT s1;

SELECT * FROM new_emps FOR UPDATE;

UPDATE new_emps SET emp_id = 1500 WHERE emp_id = 104;

COMMIT;

SELECT * FROM new_emps WHERE emp_id > 900;
SELECT * FROM new_emps;

UPDATE new_emps SET emp_id = 400 WHERE emp_id = 106;
COMMIT;

UPDATE new_emps SET emp_id = 250 WHERE name = 'Igor';
COMMIT;
--------------------------------------------------------------------------------
