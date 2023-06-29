/* ---------- TASK 1 ---------- */
SELECT department_id,
    MIN(salary) min_salary,
    MAX(salary) max_salary,
    MIN(hire_date) min_hire_date,
    MAX(hire_date) max_hire_date,
    COUNT(*) count
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) DESC;

/* ---------- TASK 2 ---------- */
SELECT SUBSTR(first_name, 1, 1) first_char, COUNT(*) count
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY COUNT(*);

SELECT SUBSTR(first_name, 1, 1) first_char, COUNT(*) count
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY count;

SELECT SUBSTR(first_name, 1, 1) first_char, COUNT(*) count
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY 2;

/* ---------- TASK 3 ---------- */
SELECT department_id, salary, COUNT(*) count
FROM employees
GROUP BY department_id, salary;

/* ---------- TASK 4 ---------- */
SELECT TO_CHAR(hire_date, 'Day') day, COUNT(*) count
FROM employees
GROUP BY TO_CHAR(hire_date, 'Day');

/* ---------- TASK 5 ---------- */
SELECT department_id
FROM employees
GROUP BY department_id
HAVING(COUNT(*) > 30 AND SUM(salary) > 300000);

SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000;

SELECT department_id, COUNT(*), SUM(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000;

/* ---------- TASK 6 ---------- */
SELECT region_id
FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

/* ---------- TASK 7 ---------- */
SELECT job_id, ROUND(AVG(salary)) avg_salary
FROM employees
GROUP BY job_id;

/* ---------- TASK 8 ---------- */
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1;

SELECT department_id, COUNT(DISTINCT job_id) count_distinct_job_id
FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1;

/* ---------- TASK 9 ---------- */
SELECT department_id, job_id, MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000;

SELECT department_id,
    job_id,
    MAX(salary),
    MIN(salary),
    ROUND(AVG(salary)) avg_salary,
    COUNT(*) count
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 5000;

/* ---------- TASK 10 ---------- */
SELECT manager_id
FROM employees
WHERE commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;

SELECT manager_id, COUNT(*) count
FROM employees
WHERE commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;

SELECT manager_id, COUNT(*) count
FROM employees
WHERE commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000
ORDER BY manager_id;


/* ---------- TASK 11 ---------- */
SELECT ROUND(MAX(AVG(salary)), -3)
FROM employees
GROUP BY department_id;

/* -------------------------------------------------------------------------- */
