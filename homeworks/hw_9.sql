---------- TASK 1 ----------
SELECT manager_id, TO_CHAR(null) job_id, TO_NUMBER(null) department_id,
    SUM(salary)
FROM employees
GROUP BY manager_id
UNION
SELECT TO_NUMBER(null), job_id, TO_NUMBER(null), SUM(salary)
FROM employees
GROUP BY job_id
UNION
SELECT TO_NUMBER(null), TO_CHAR(null), department_id, SUM(salary)
FROM employees
GROUP BY department_id;

---------- TASK 2 ----------
SELECT department_id FROM employees WHERE manager_id = 100
MINUS
SELECT department_id FROM employees WHERE manager_id = 145
MINUS
SELECT department_id FROM employees WHERE manager_id = 201;

SELECT department_id FROM employees WHERE manager_id = 100
MINUS
SELECT department_id FROM employees WHERE manager_id = 145 OR manager_id = 201;

SELECT department_id FROM employees WHERE manager_id = 100
MINUS
SELECT department_id FROM employees WHERE manager_id IN (145, 201);

---------- TASK 3 ----------
SELECT first_name, last_name, salary FROM employees
WHERE first_name LIKE '_a%'
INTERSECT
SELECT first_name, last_name, salary FROM employees
WHERE LOWER(last_name) LIKE '%s%'
ORDER BY salary DESC;

---------- TASK 4 ----------
SELECT location_id, postal_code, city FROM locations
WHERE country_id IN ('DE', 'IT')
UNION ALL
SELECT location_id, postal_code, city FROM locations
WHERE postal_code LIKE '%9%';

SELECT location_id, postal_code, city FROM locations
WHERE country_id IN (
    SELECT country_id FROM countries
    WHERE country_name IN ('Germany', 'Italy')
)
UNION ALL
SELECT location_id, postal_code, city FROM locations
WHERE postal_code LIKE '%9%';

---------- TASK 5 ----------
SELECT country_id id, country_name country, region_id region
FROM countries
WHERE LENGTH(country_name) > 8
UNION
SELECT country_id, country_name, region_id
FROM countries
WHERE region_id IN (
    SELECT region_id FROM regions
    WHERE region_name != 'Europe'
)
ORDER BY country DESC;

SELECT country_id id, country_name country, region_id region
FROM countries
WHERE LENGTH(country_name) > 8
UNION
SELECT country_id, country_name, region_id
FROM countries
WHERE region_id != (
    SELECT region_id FROM regions
    WHERE region_name = 'Europe'
)
ORDER BY country DESC;

--------------------------------------------------------------------------------
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs;

SELECT job_id, max_salary FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%';

SELECT job_id col_1, max_salary col_2 FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_title xxxx, min_salary yyyy FROM jobs WHERE job_id LIKE '%MAN%';

SELECT job_id, job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY min_salary;

SELECT job_id, job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, max_salary FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY min_salary;

SELECT job_id, job_title, min_salary m FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, max_salary FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY m;

SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY 3;

SELECT first_name, last_name, salary FROM employees WHERE employee_id > 200
UNION ALL
SELECT job_id, job_title, max_salary FROM jobs WHERE job_id LIKE '%MAN%';

SELECT country_id FROM countries
UNION ALL
SELECT country_name FROM countries;

SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
UNION
SELECT * FROM jobs WHERE max_salary BETWEEN 10000 AND 15000;

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
UNION
SELECT * FROM jobs WHERE max_salary BETWEEN 10000 AND 15000
ORDER BY 3;

SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
INTERSECT
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
INTERSECT
SELECT * FROM jobs WHERE max_salary BETWEEN 10000 AND 15000;

SELECT first_name, last_name FROM employees
INTERSECT
SELECT street_address, city FROM locations;

SELECT job_id, job_title, max_salary FROM jobs
WHERE min_salary BETWEEN 4500 AND 8000
INTERSECT
SELECT job_id, job_title, max_salary FROM jobs
WHERE max_salary BETWEEN 10000 AND 15000
ORDER BY max_salary DESC;

SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
MINUS
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT job_id, job_title, max_salary FROM jobs
WHERE min_salary BETWEEN 4500 AND 8000
MINUS
SELECT job_id, job_title, max_salary FROM jobs
WHERE max_salary BETWEEN 10000 AND 15000;

SELECT job_id, job_title, max_salary FROM jobs
WHERE max_salary BETWEEN 10000 AND 15000
MINUS
SELECT job_id, job_title, max_salary FROM jobs
WHERE min_salary BETWEEN 4500 AND 8000;

SELECT first_name, salary FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT first_name, salary FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name, salary FROM employees WHERE first_name LIKE '%l%';

SELECT first_name, salary FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT first_name, salary FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name, salary FROM employees WHERE first_name LIKE '%l%';

SELECT first_name, salary FROM employees WHERE first_name LIKE '%a%'
UNION (
    SELECT first_name, salary FROM employees WHERE first_name LIKE '%e%'
    MINUS
    SELECT first_name, salary FROM employees WHERE first_name LIKE '%l%'
);

SELECT manager_id FROM employees WHERE department_id = 20
INTERSECT
SELECT manager_id FROM employees WHERE department_id = 30;

SELECT manager_id FROM employees WHERE department_id = 20
INTERSECT
SELECT manager_id FROM employees WHERE department_id = 30
MINUS
SELECT manager_id FROM employees WHERE department_id = 40;

SELECT department_id, SUM(salary) FROM employees
GROUP BY department_id;

SELECT job_id, SUM(salary) FROM employees
GROUP BY job_id;

SELECT department_id dep_id, TO_CHAR(null) job_id, SUM(salary) FROM employees
GROUP BY department_id
UNION
SELECT TO_NUMBER(null), job_id, SUM(salary) FROM employees
GROUP BY job_id;
--------------------------------------------------------------------------------
