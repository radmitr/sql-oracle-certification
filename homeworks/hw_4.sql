/* ---------- TASK 1 ---------- */
SELECT * FROM employees
WHERE LENGTH(first_name) > 10;

/* ---------- TASK 2 ---------- */
SELECT * FROM employees
WHERE MOD(salary, 1000) = 0;

/* ---------- TASK 3 ---------- */
SELECT phone_number, SUBSTR(phone_number, 1, 3)
FROM employees
WHERE LENGTH(phone_number) = 12;

SELECT phone_number, SUBSTR(phone_number, 1, 3)
FROM employees
WHERE phone_number LIKE '___.___.____';

/* ---------- TASK 4 ---------- */
SELECT * FROM employees
WHERE first_name LIKE '%m'
AND LENGTH(first_name) > 5;

SELECT * FROM employees
WHERE SUBSTR(first_name, -1) = 'm'
AND LENGTH(first_name) > 5;

/* ---------- TASK 5 ---------- */
SELECT NEXT_DAY(SYSDATE, 5) FROM dual;

SELECT NEXT_DAY(SYSDATE, 'Пятница') FROM dual;

SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM dual;

SELECT NEXT_DAY(SYSDATE, 'Пт') next_friday FROM dual;

SELECT NEXT_DAY(SYSDATE, 'FRI') next_friday FROM dual;

/* ---------- TASK 6 ---------- */
SELECT * FROM employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 150;

/* ---------- TASK 7 ---------- */
SELECT REPLACE(phone_number, '.', '-') new_phone_number
FROM employees;

/* ---------- TASK 8 ---------- */
SELECT UPPER(first_name) || '  ' || LOWER(email) || '  ' || INITCAP(job_id)
FROM employees;

SELECT RPAD(UPPER(first_name), 10, ' '), RPAD(LOWER(email), 10, ' '),
RPAD(INITCAP(job_id), 10, ' ')
FROM employees;

SELECT UPPER(first_name), LOWER(email), INITCAP(job_id)
FROM employees;

/* ---------- TASK 9 ---------- */
SELECT CONCAT(first_name, salary)
FROM employees;

/* ---------- TASK 10 ---------- */
SELECT hire_date, ROUND(hire_date, 'MM'), TRUNC(hire_date, 'YYYY')
FROM employees;

/* ---------- TASK 11 ---------- */
SELECT RPAD(first_name, 10, '$'), LPAD(last_name, 15, '!')
FROM employees;

/* ---------- TASK 12 ---------- */
SELECT first_name, INSTR(first_name, 'a', 1, 2) FROM employees;

/* ---------- TASK 13 ---------- */
SELECT '!!!HELLO!! MY FRIEND!!!!!!!!',
TRIM(BOTH '!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!')
FROM dual;

SELECT '!!!HELLO!! MY FRIEND!!!!!!!!',
TRIM('!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!')
FROM dual;

/* ---------- TASK 14 ---------- */
SELECT salary, salary * 3.1415, ROUND(salary * 3.1415),
TRUNC(salary * 3.1415, -3) / 1000
FROM employees;

/* ---------- TASK 15 ---------- */
SELECT hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date)
FROM employees;

/* -------------------------------------------------------------------------- */
