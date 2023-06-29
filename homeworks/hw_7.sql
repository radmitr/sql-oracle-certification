/* ---------- TASK 1 ---------- */
SELECT region_name, COUNT(*) count
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name;

SELECT region_name, COUNT(*) count
FROM regions r
JOIN countries c ON (r.region_id = c.region_id)
JOIN locations l ON (c.country_id = l.country_id)
JOIN departments d ON (l.location_id = d.location_id)
JOIN employees e ON (d.department_id = e.department_id)
GROUP BY region_name;

SELECT region_name, COUNT(*) count
FROM employees e
JOIN departments d USING (department_id)
JOIN locations l USING (location_id)
JOIN countries c USING (country_id)
JOIN regions r USING (region_id)
GROUP BY region_name;

/* ---------- TASK 2 ---------- */
SELECT first_name, last_name, department_name, job_id,
street_address, country_name, region_name
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id);

/* ---------- TASK 3 ---------- */
SELECT man.first_name, COUNT(*)
FROM employees emp JOIN employees man
ON (emp.manager_id = man.employee_id)
GROUP BY man.first_name
HAVING COUNT(*) > 6;

/* ---------- TASK 4 ---------- */
SELECT department_name, COUNT(*)
FROM employees JOIN departments USING (department_id)
GROUP BY department_name
HAVING COUNT(*) > 30;

/* ---------- TASK 5 ---------- */
SELECT department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id)
WHERE e.first_name IS NULL;

/* ---------- TASK 6 ---------- */
SELECT emp.*
FROM employees emp JOIN employees man
ON (emp.manager_id = man.employee_id)
WHERE TO_CHAR(man.hire_date, 'YYYY') = 2005
AND TO_CHAR(emp.hire_date, 'YYYY') < 2005;

SELECT emp.*
FROM employees emp JOIN employees man
ON (emp.manager_id = man.employee_id)
WHERE TO_CHAR(man.hire_date, 'YYYY') = '2005'
AND emp.hire_date < TO_DATE('01-01-2005', 'DD-MM-YYYY');

/* ---------- TASK 7 ---------- */
SELECT country_name, region_name
FROM countries NATURAL JOIN regions;

/* ---------- TASK 8 ---------- */
SELECT first_name, last_name, salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE salary < min_salary + 1000;

SELECT first_name, last_name, salary, min_salary + 1000
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE salary < min_salary + 1000;

SELECT first_name, last_name, salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary < min_salary + 1000);

/* ---------- TASK 9 ---------- */
SELECT DISTINCT first_name, last_name, country_name
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
FULL OUTER JOIN countries c ON (l.country_id = c.country_id);

/* ---------- TASK 10 ---------- */
SELECT DISTINCT first_name, last_name, country_name
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
CROSS JOIN countries
ORDER BY country_name;

SELECT first_name, last_name, country_name
FROM employees CROSS JOIN countries;

/* ---------- TASK 11 ---------- */
SELECT region_name, COUNT(*) count
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
AND l.country_id = c.country_id AND c.region_id = r.region_id
GROUP BY region_name;

/* ---------- TASK 12 ---------- */
SELECT department_name
FROM employees e, departments d
WHERE e.department_id (+) = d.department_id
AND e.first_name IS NULL;

/* -------------------------------------------------------------------------- */
SELECT * FROM regions;
SELECT * FROM countries;

SELECT * FROM regions NATURAL JOIN countries;

SELECT * FROM employees;
SELECT * FROM departments;

SELECT first_name, last_name, salary, department_name, department_id, manager_id
FROM employees NATURAL JOIN departments;

SELECT first_name, last_name, salary, department_name,
e.manager_id emp_manager, d.manager_id dep_manager, department_id
FROM employees e JOIN departments d
USING (department_id);

SELECT * FROM employees;
SELECT * FROM job_history;

SELECT first_name, last_name, jh.job_id, start_date, end_date,
employees.employee_id, jh.employee_id
FROM employees JOIN job_history jh
ON (employees.employee_id = jh.employee_id);

SELECT * FROM regions;
SELECT * FROM departments;

SELECT * FROM departments JOIN regions
ON (region_id * 10 = department_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date
FROM employees JOIN job_history jh
USING (employee_id, department_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date
FROM employees e JOIN job_history jh
ON (e.employee_id = jh.employee_id AND e.department_id = jh.department_id)
WHERE salary > 10000;

SELECT * FROM departments;
SELECT * FROM employees;

SELECT first_name, department_name
FROM employees JOIN departments
ON (employees.employee_id = departments.manager_id);

SELECT * FROM regions;
SELECT * FROM locations;
SELECT * FROM countries;

SELECT * FROM locations NATURAL JOIN countries NATURAL JOIN regions;

SELECT * FROM locations JOIN countries USING (country_id)
JOIN regions USING (region_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date, department_name
FROM employees e JOIN job_history jh ON (e.employee_id = jh.employee_id)
JOIN departments d ON (jh.department_id = d.department_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date, department_name
FROM employees e JOIN job_history jh USING (employee_id)
JOIN departments d ON (jh.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

SELECT department_name, min(salary), max(salary)
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name ORDER BY department_name DESC;

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary * 2 < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE salary * 2 < max_salary;

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary = max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE salary = max_salary;

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE salary < max_salary;

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j ON (e.job_id = j.job_id AND
salary BETWEEN min_salary + 2000 AND max_salary - 3000);

SELECT employee_id, first_name, manager_id
FROM employees;

SELECT emp1.employee_id, emp1.first_name, emp1.manager_id,
emp2.first_name manager_name
FROM employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id);

SELECT emp2.first_name manager_name, COUNT(*)
FROM employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
GROUP BY emp2.first_name ORDER BY COUNT(*);

SELECT first_name, last_name, salary, department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
WHERE department_name like '%i%';

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id AND salary * 2 < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e LEFT OUTER JOIN jobs j
ON (e.job_id = j.job_id AND salary * 2 < max_salary);

SELECT * FROM locations;
SELECT * FROM departments;

SELECT postal_code, city, department_name
FROM locations l JOIN departments d
ON (l.location_id = d.location_id);

SELECT postal_code, city, department_name
FROM locations l LEFT OUTER JOIN departments d
ON (l.location_id = d.location_id);

SELECT postal_code, city, department_name, d.location_id
FROM locations l LEFT OUTER JOIN departments d
ON (l.location_id = d.location_id);

SELECT postal_code, city, department_name, l.location_id
FROM locations l LEFT OUTER JOIN departments d
ON (l.location_id = d.location_id);

SELECT department_name, d.department_id
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id);

SELECT department_name, d.department_id, first_name
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id);

SELECT department_name, d.department_id, first_name, e.department_id 
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id);

SELECT department_name, d.department_id
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
WHERE e.first_name IS NULL;

SELECT department_name, d.department_id
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
WHERE e.department_id IS NULL;

SELECT department_name, d.department_id, e.department_id
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
WHERE e.department_id IS NULL;

SELECT department_name, d.department_id, first_name
FROM departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
WHERE e.first_name IS NULL;

SELECT first_name, last_name, salary, department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM employees RIGHT OUTER JOIN departments
USING (department_id);

SELECT first_name, last_name, salary, department_name, department_id
FROM employees RIGHT OUTER JOIN departments
USING (department_id);

SELECT * FROM countries;
SELECT * FROM locations;

SELECT country_name, city, street_address
FROM locations l RIGHT OUTER JOIN countries c
ON (l.country_id = c.country_id);

SELECT first_name, last_name, salary, department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT
    NVL(first_name, 'no employee'),
    NVL(last_name, 'no employee'),
    NVL(salary, 0),
    NVL(department_name, 'no department')
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT * FROM countries;
SELECT * FROM jobs;
SELECT * FROM regions;

SELECT * FROM countries CROSS JOIN regions;

SELECT COUNT(*) FROM countries CROSS JOIN regions;

SELECT * FROM countries CROSS JOIN regions
ORDER BY country_id;

SELECT * FROM countries CROSS JOIN regions
where countries.region_id >= 2
ORDER BY country_id;

SELECT * FROM countries NATURAL JOIN jobs;

SELECT * FROM countries CROSS JOIN jobs;

SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

SELECT * FROM countries, regions;
/* -------------------------------------------------------------------------- */
