---------- TASK 1 ----------
SELECT * FROM employees 
WHERE first_name = 'David';

---------- TASK 2 ----------
SELECT * FROM employees 
WHERE job_id = 'FI_ACCOUNT';

---------- TASK 3 ----------
SELECT first_name, last_name, salary, department_id
FROM employees 
WHERE department_id = 50 AND salary > 4000;

---------- TASK 4 ----------
SELECT * FROM employees 
WHERE department_id = 20 OR department_id = 30;

SELECT * FROM employees 
WHERE department_id IN (20, 30);

---------- TASK 5 ----------
SELECT * FROM employees WHERE first_name LIKE '_a%a';

---------- TASK 6 ----------
SELECT * FROM employees 
WHERE (department_id = 50 OR department_id = 80) AND commission_pct IS NOT NULL 
ORDER BY email;

SELECT * FROM employees 
WHERE department_id IN (50, 80) AND commission_pct IS NOT NULL 
ORDER BY email;

SELECT * FROM employees 
WHERE department_id IN (50, 80) AND commission_pct IS NOT NULL 
ORDER BY 4;

---------- TASK 7 ----------
SELECT * FROM employees 
WHERE first_name LIKE '%n%n%';

---------- TASK 8 ----------
SELECT * FROM employees 
WHERE first_name LIKE '_____%' 
ORDER BY department_id DESC NULLS LAST;

---------- TASK 9 ----------
SELECT * FROM employees 
WHERE salary BETWEEN 3000 AND 7000 
AND commission_pct IS NULL 
AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

---------- TASK 10 ----------
SELECT * FROM employees 
WHERE first_name LIKE '%\%%' ESCAPE '\';

---------- TASK 11 ----------
SELECT job_id, first_name, salary
FROM employees 
WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY job_id, first_name DESC;

SELECT job_id, first_name, salary
FROM employees 
WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY 1 ASC, 2 DESC;

SELECT job_id, first_name, salary
FROM employees 
WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY 1, 2 DESC;

--------------------------------------------------------------------------------
