/* ---------- TASK 1 ---------- */
SELECT * FROM employees
WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees);

/* ---------- TASK 2 ---------- */
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/* ---------- TASK 3 ---------- */
SELECT city, SUM(salary)
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
GROUP BY city
HAVING SUM(salary) = (
    SELECT MIN(SUM(salary)) FROM employees e
    JOIN departments d ON (e.department_id = d.department_id)
    JOIN locations l ON (d.location_id = l.location_id)
    GROUP BY city
);

/* ---------- TASK 4 ---------- */
SELECT * FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE salary > 15000);

/* ---------- TASK 5 ---------- */
SELECT * FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id FROM employees
    WHERE department_id IS NOT NULL
);

/* ---------- TASK 6 ---------- */
SELECT * FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT manager_id FROM employees
    WHERE manager_id IS NOT NULL
);

/* ---------- TASK 7 ---------- */
SELECT * FROM employees
WHERE employee_id IN (
    SELECT manager_id FROM employees
    GROUP BY manager_id
    HAVING COUNT(*) > 6
);

SELECT * FROM employees e
WHERE (
    SELECT COUNT(*) FROM employees
    WHERE manager_id = e.employee_id
) > 6;

/* ---------- TASK 8 ---------- */
SELECT * FROM employees
WHERE department_id = (
    SELECT department_id FROM departments
    WHERE department_name = 'IT'
);

/* ---------- TASK 9 ---------- */
SELECT * FROM employees e
WHERE TO_CHAR(hire_date, 'YYYY') < '2005'
AND (
    SELECT TO_CHAR(hire_date, 'YYYY') FROM employees
    WHERE employee_id =  e.manager_id
) = '2005';

SELECT * FROM employees
WHERE manager_id IN (
    SELECT employee_id FROM employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2005'
) AND TO_CHAR(hire_date, 'YYYY') < '2005';

SELECT * FROM employees
WHERE hire_date < TO_DATE('01/01/2005', 'DD/MM/YYYY')
AND manager_id IN (
    SELECT employee_id FROM employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2005'
);

/* ---------- TASK 10 ---------- */
SELECT * FROM employees e
WHERE manager_id IN (
    SELECT employee_id FROM employees
    WHERE TO_CHAR(hire_date, 'MM') = '01'
) AND (
    SELECT LENGTH(job_title) FROM jobs
    WHERE job_id = e.job_id
) > 15;

/* -------------------------------------------------------------------------- */
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT AVG(salary) FROM employees;

SELECT
(SELECT MIN(min_salary) FROM jobs) min_salary, 
(SELECT MAX(LENGTH(first_name)) FROM employees) longest_name
FROM dual;

SELECT MIN(min_salary) FROM jobs;

SELECT MAX(LENGTH(first_name)) FROM employees;

SELECT first_name, last_name
FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees);

SELECT manager_id FROM employees;

SELECT department_name, MIN(salary), MAX(salary) FROM
(SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id))
GROUP BY department_name;

SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT department_name, MIN(salary), MAX(salary)
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY department_name;

SELECT department_name, MIN(salary), MAX(salary) FROM
(SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id))
GROUP BY department_name
HAVING MAX(salary) > (SELECT 2*5000 FROM dual)
AND MIN(salary) < (SELECT salary FROM employees WHERE employee_id = 113);

SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT 2*5000 FROM dual;

SELECT salary FROM employees WHERE employee_id = 113;

SELECT MAX(salary) FROM employees;

SELECT first_name, last_name, salary FROM employees
WHERE salary < 24000/5;

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT MAX(salary)/5 FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees)/5;

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 180);

SELECT job_title FROM jobs j JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title
HAVING AVG(salary) = 
(SELECT MAX(AVG(salary)) FROM employees GROUP BY job_id);

SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

SELECT MAX(AVG(salary)) FROM employees GROUP BY job_id;

SELECT job_title FROM jobs j JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title
HAVING AVG(salary) = 24000;

SELECT job_title FROM jobs j JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title;

SELECT first_name, last_name, salary FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE min_salary > 8000);

SELECT first_name, last_name, salary FROM employees
WHERE job_id NOT IN (SELECT job_id FROM jobs WHERE min_salary > 8000);

SELECT first_name, last_name, salary FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE job_id = 'AD_VP');

SELECT first_name, last_name, salary FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_id = 'AD_VP');

SELECT first_name, last_name, salary FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 100);

SELECT first_name, last_name, salary FROM employees
WHERE salary > ALL (SELECT MAX(salary) FROM employees WHERE department_id = 100);

SELECT DISTINCT department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT DISTINCT department_name FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT department_name FROM departments
WHERE department_id IN (SELECT DISTINCT department_id FROM employees);

SELECT e1.first_name, e1.last_name, e1.salary FROM employees e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2
WHERE e2.department_id = e1.department_id);

SELECT first_name, last_name, salary FROM employees e1
WHERE salary > (SELECT AVG(e2.salary) FROM employees e2
WHERE e2.department_id = e1.department_id);

SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT first_name, last_name, salary FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE location_id IN 
(SELECT location_id FROM locations WHERE country_id = 
(SELECT country_id FROM countries WHERE country_name = 'Germany')));

SELECT first_name, last_name, salary FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE location_id IN 
(SELECT location_id FROM locations WHERE country_id = 
(SELECT country_id FROM countries WHERE country_name = 'United Kingdom')));

SELECT * FROM jobs;

SELECT first_name, last_name, salary FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE UPPER(job_title) LIKE '%MANAGER%')
AND salary > (SELECT AVG(salary) FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE first_name = 'David');

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE first_name = 'David');
/* -------------------------------------------------------------------------- */
