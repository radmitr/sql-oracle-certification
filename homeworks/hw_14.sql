/* ---------- TASK 1 ---------- */
CREATE TABLE test200 (
    id INTEGER,
    name1 VARCHAR2(25),
    name2 VARCHAR2(25),
    address1 VARCHAR2(25),
    address2 VARCHAR2(25)
);
SELECT * FROM test200;

/* ---------- TASK 2 ---------- */
UPDATE test200 SET &col = &val WHERE id = &id_val;

SET VERIFY OFF;
SET VERIFY ON;

/* ---------- TASK 3 ---------- */
SELECT * FROM test200
WHERE name1 = '&&val1' AND name2 = '&val1'
AND address1 = '&&val2' AND address2 = '&val2';

/* ---------- TASK 4 ---------- */
UNDEFINE val1;
UNDEFINE val2;

DEFINE;

/* -------------------------------------------------------------------------- */
SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = 130;

SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = &ID;

SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = &abc;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = &name;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = '&name';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = '&name'
AND salary > &sal;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&bukva%'
AND last_name LIKE '%&bukva%';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&bukva%'
AND last_name LIKE '%&bukva%';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&bukva2%'
AND last_name LIKE '%&bukva2%';

SELECT first_name, last_name, &col FROM employees;

SELECT first_name, last_name, &col1 FROM employees
ORDER BY &col2;

SELECT first_name, last_name, &&col FROM employees
ORDER BY &col;

SELECT &prodoljenie;

SELECT &select_list
FROM &table_name
WHERE &conditions
ORDER BY &col;

SELECT &select_list
FROM &table_name
WHERE &conditions
ORDER BY &col5;

SELECT * FROM students;

UPDATE students SET &col3 = &value WHERE &condition;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&bukva%'
AND last_name LIKE '%&bukva%';

UNDEFINE bukva;
DEFINE;
DEFINE bukva = a;
SET DEFINE OFF;
SET DEFINE ON;
/* -------------------------------------------------------------------------- */
