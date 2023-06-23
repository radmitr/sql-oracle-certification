---------- TASK 1 ----------
SELECT * FROM regions;

---------- TASK 2 ----------
SELECT first_name, department_id, salary, last_name
FROM employees;

---------- TASK 3 ----------
SELECT employee_id, email, hire_date-7 AS "One week before hire date" 
FROM employees;

---------- TASK 4 ----------
SELECT first_name || '(' || job_id || ')' AS our_employees 
FROM employees;

---------- TASK 5 ----------
SELECT DISTINCT first_name FROM employees;

---------- TASK 6 ----------
SELECT job_title, 'min = ' || min_salary || ', max = ' || max_salary AS info, 
max_salary AS max, max_salary * 2 - 2000 AS new_salary
FROM jobs;

---------- TASK 7 ----------
SELECT q'<Peter's dog is very clever>' FROM dual;

---------- TASK 8 ----------
SELECT 'Peter''s dog is very clever' FROM dual;

---------- TASK 9 ----------
SELECT 100 * 365.25 * 24 * 60 FROM dual;

--------------------------------------------------------------------------------
