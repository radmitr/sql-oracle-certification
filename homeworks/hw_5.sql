SELECT hire_date, TO_CHAR(hire_date, 'Month', 'NLS_DATE_LANGUAGE = RUSSIAN')
FROM employees;

---------- TASK 1 ----------
SELECT * FROM employees
WHERE UPPER(first_name) LIKE '%B%';

SELECT * FROM employees
WHERE INSTR(UPPER(first_name), 'B') != 0;

SELECT * FROM employees
WHERE INSTR(LOWER(first_name), 'b') > 0;

---------- TASK 2 ----------
SELECT * FROM employees
WHERE INSTR(first_name, 'a', 1, 2) > 0;

---------- TASK 3 ----------
SELECT SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1) first_word
FROM departments
WHERE INSTR(department_name, ' ') > 0;

---------- TASK 4 ----------
SELECT first_name, SUBSTR(first_name, 2, LENGTH(first_name) - 2) new_name
FROM employees;

---------- TASK 5 ----------
SELECT * FROM employees
WHERE LENGTH(SUBSTR(job_id, INSTR(job_id, '_') + 1)) >= 3
AND SUBSTR(job_id, INSTR(job_id, '_') + 1) != 'CLERK';

---------- TASK 6 ----------
SELECT * FROM employees
WHERE hire_date = ROUND(hire_date, 'MM');

SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'DD') = '01';

---------- TASK 7 ----------
SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

---------- TASK 8 ----------
SELECT 'Tomorrow is ' ||
TO_CHAR(NEXT_DAY(SYSDATE, MOD(TO_NUMBER(TO_CHAR(SYSDATE, 'D')) + 1, 7) + 1),
    'Ddspth') ||
' day of ' ||
TO_CHAR(NEXT_DAY(SYSDATE, MOD(TO_NUMBER(TO_CHAR(SYSDATE, 'D')) + 1, 7) + 1),
    'Month') info
FROM dual;

SELECT TO_CHAR(SYSDATE + 1, '"Tomorrow is" Ddspth "day of" Month') info
FROM dual;

---------- TASK 9 ----------
SELECT first_name,
TO_CHAR(hire_date, 'Ddth') || ' of ' || TO_CHAR(hire_date, 'fmMonth, YYYY')
FROM employees;

SELECT first_name, TO_CHAR(hire_date, 'fmddth "of" Month, YYYY')
FROM employees;

---------- TASK 10 ----------
SELECT first_name, TO_CHAR(salary + 0.2 * salary, '$999,999.99') new_salary
FROM employees;

---------- TASK 11 ----------
SELECT
    SYSDATE now,
    SYSDATE + 1 / (24 * 60 * 60) plus_second,
    SYSDATE + 1 / (24 * 60) plus_minute,
    SYSDATE + 1 / 24 plus_hour,
    SYSDATE + 1 plus_day,
    ADD_MONTHS(SYSDATE, 1) plus_month,
    ADD_MONTHS(SYSDATE, 12) plus_year
FROM dual;

SELECT
    SYSDATE now,
    SYSDATE + 1 / 24 / 60 / 60 plus_second,
    SYSDATE + 1 / 24 / 60 plus_minute,
    SYSDATE + 1 / 24 plus_hour,
    SYSDATE + 1 plus_day,
    ADD_MONTHS(SYSDATE, 1) plus_month,
    ADD_MONTHS(SYSDATE, 12) plus_year
FROM dual;

---------- TASK 12 ----------
SELECT first_name, salary,
salary + TO_NUMBER('$12,345.55', '$999,999.99') new_salary
FROM employees;

---------- TASK 13 ----------
SELECT first_name, hire_date,
MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'),
    hire_date) AS mounth_count
FROM employees;

---------- TASK 14 ----------
SELECT first_name, salary,
TO_CHAR(salary + salary * NVL(commission_pct, 0), '$99,999.99') full_salary
FROM employees;

---------- TASK 15 ----------
SELECT first_name, last_name,
NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)),
    'different length', 'same length') AS equality
FROM employees;

---------- TASK 16 ----------
SELECT first_name, commission_pct, NVL2(commission_pct, 'Yes', 'No') has_bonus
FROM employees;

---------- TASK 17 ----------
SELECT first_name, COALESCE(commission_pct, manager_id, salary) info
FROM employees;

---------- TASK 18 ----------
SELECT first_name, salary, 
    CASE
        WHEN salary < 5000 THEN 'Low level'
        WHEN salary < 10000 THEN 'Normal level'
        ELSE 'High level'
        END salary_level
FROM employees;

SELECT first_name, salary, 
    CASE
        WHEN salary < 5000 THEN 'Low level'
        WHEN salary >= 5000 AND salary < 10000 THEN 'Normal level'
        WHEN salary >= 10000 THEN 'High level'
        ELSE 'Unknown'
        END salary_level
FROM employees;

SELECT first_name, salary, 
    CASE
        WHEN salary < 5000 THEN 'Low level'
        WHEN salary >= 5000 AND salary < 10000 THEN 'Normal level'
        WHEN salary >= 10000 THEN 'High level'
        END salary_level
FROM employees;

---------- TASK 19 ----------
SELECT country_name,
    DECODE(region_id,
        1, 'Europe',
        2, 'America',
        3, 'Asia',
        4, 'Africa',
        'Unknown') region
FROM countries;

SELECT country_name,
    DECODE(region_id,
        1, 'Europe',
        2, 'America',
        3, 'Asia',
        4, 'Middle East and Africa',
        'Unknown') region
FROM countries;

---------- TASK 20 ----------
SELECT country_name,
    CASE region_id
        WHEN 1 THEN 'Europe'
        WHEN 2 THEN 'America'
        WHEN 3 THEN 'Asia'
        WHEN 4 THEN 'Africa'
        ELSE 'Unknown'
        END region
FROM countries;

SELECT country_name,
    CASE region_id
        WHEN 1 THEN 'Europe'
        WHEN 2 THEN 'America'
        WHEN 3 THEN 'Asia'
        WHEN 4 THEN 'Middle East and Africa'
        ELSE 'Unknown'
        END region
FROM countries;

---------- TASK 21 ----------
SELECT first_name, salary,
    CASE
        WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
        WHEN salary >= 10000 AND salary < 15000
            OR commission_pct IS NOT NULL THEN 'NORMAL'
        WHEN salary >= 15000 THEN 'GOOD'
        ELSE 'Unknown'
        END status
FROM employees;

SELECT first_name, salary,
    CASE
        WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
        WHEN salary BETWEEN 10000 AND 15000
            OR commission_pct IS NOT NULL THEN 'NORMAL'
        WHEN salary >= 15000 THEN 'GOOD'
        ELSE 'Unknown'
        END work_conditions
FROM employees;

--------------------------------------------------------------------------------
