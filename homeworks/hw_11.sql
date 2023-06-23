---------- TASK 1 ----------
CREATE TABLE friends AS (
    SELECT employee_id id, first_name name, last_name surname
    FROM employees
    WHERE commission_pct IS NOT NULL
);
SELECT * FROM friends;

CREATE TABLE friends AS
SELECT employee_id id, first_name name, last_name surname
FROM employees
WHERE commission_pct IS NOT NULL;

---------- TASK 2 ----------
ALTER TABLE friends
ADD (email VARCHAR(25));

---------- TASK 3 ----------
ALTER TABLE friends
MODIFY (email VARCHAR(25) DEFAULT 'no email');

---------- TASK 4 ----------
INSERT INTO friends (id, name, surname)
VALUES (300, 'Vladimir', 'Radionov');

---------- TASK 5 ----------
ALTER TABLE friends
RENAME COLUMN id TO friends_id;

---------- TASK 6 ----------
DROP TABLE friends;

---------- TASK 7 ----------
CREATE TABLE friends (
    id INTEGER,
    name VARCHAR2(25),
    surname VARCHAR2(25),
    email VARCHAR2(25),
    salary NUMBER(9, 2) DEFAULT 100000,
    city VARCHAR2(30),
    birthday DATE DEFAULT TO_DATE('01-JAN-1984', 'DD-MON-YYYY')
);
SELECT * FROM friends;

---------- TASK 8 ----------
INSERT INTO friends
VALUES (1, 'Stanislav', 'Miturich', 'stanislav.miturich@gmail.com', 150000, 'Sevastopol', TO_DATE('13-AUG-1987', 'DD-MON-YYYY'));

---------- TASK 9 ----------
INSERT INTO friends (id, name, surname, email, city)
VALUES (2, 'Vladimir', 'Radionov', 'rvladimir@mail.ru', 'Murmansk');

---------- TASK 10 ----------
COMMIT;

---------- TASK 11 ----------
ALTER TABLE friends
DROP COLUMN salary;

---------- TASK 12 ----------
ALTER TABLE friends
SET UNUSED COLUMN email;

---------- TASK 13 ----------
ALTER TABLE friends
SET UNUSED COLUMN birthday;

---------- TASK 14 ----------
ALTER TABLE friends DROP UNUSED COLUMNS;

---------- TASK 15 ----------
ALTER TABLE friends READ ONLY;

---------- TASK 16 ----------
UPDATE friends SET city = 'Sevastopol' WHERE id = 2;

---------- TASK 17 ----------
TRUNCATE TABLE friends;
 
---------- TASK 18 ----------
DROP TABLE friends;

--------------------------------------------------------------------------------
SELECT * FROM user_objects;

SELECT object_type, count(object_type) FROM user_objects
GROUP BY object_type ORDER BY object_type;

SELECT object_type, count(object_type) FROM all_objects
GROUP BY object_type ORDER BY object_type;

SELECT table_name FROM user_tables;

SELECT column_name, data_type, nullable FROM user_tab_columns;

SELECT column_name, data_type, nullable FROM user_tab_columns
WHERE table_name = 'DEPARTMENTS';

CREATE TABLE "3abc def" (
    id number
);

SELECT * FROM "3abc def";

CREATE TABLE abc_def (
    id number
);

CREATE TABLE abc (
    id number
);

CREATE TABLE "def" (
    id number
);

SELECT * FROM "def";

SELECT last_name, salary FROM employees;
SELECT rowid, last_name, salary FROM employees;

DROP TABLE "3abc def";
DROP TABLE "def";
DROP TABLE abc;
DROP TABLE abc_def;

CREATE TABLE students (
    student_id INTEGER,
    name VARCHAR2(15),
    start_date DATE DEFAULT ROUND(SYSDATE),
    scholarship NUMBER(6, 2),
    avg_score NUMBER(4, 2) DEFAULT 5
) ORGANIZATION HEAP;

CREATE TABLE students (
    student_id INTEGER,
    name VARCHAR2(15),
    start_date DATE DEFAULT ROUND(SYSDATE),
    scholarship NUMBER(6, 2),
    avg_score NUMBER(4, 2) DEFAULT 5
);

SELECT * FROM students;

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (1, 'Dmitriy', TO_DATE('01-MAY-23'), 1500.3, 7.8);

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (2, 'Ivan', TO_DATE('10-MAY-23'), 800.356, 8);

INSERT INTO students (student_id, name, scholarship)
VALUES (3, 'Nina', 555);

SELECT * FROM new_emps;

CREATE TABLE new_emps2 AS (
    SELECT employee_id, first_name, last_name, salary, department_id
    FROM employees
);
SELECT * FROM new_emps2;

CREATE TABLE new_deps AS (
    SELECT department_name, MAX(salary) max_salary, MIN(salary) min_salary
    FROM employees e JOIN departments d ON (e.department_id = d.department_id)
    GROUP BY department_name
);
SELECT * FROM new_deps;

CREATE TABLE regions2 AS (
    SELECT * FROM regions
    WHERE 5 = 6
);
SELECT * FROM regions2;

SELECT * FROM students;

ALTER TABLE students
ADD (course number DEFAULT 3);

ALTER TABLE students
MODIFY (avg_score number(5, 3));

ALTER TABLE students
MODIFY (start_date date DEFAULT NULL);

INSERT INTO students (student_id, name)
VALUES (4, 'Vova');

ALTER TABLE students
DROP COLUMN scholarship;

ALTER TABLE students
SET UNUSED COLUMN start_date;

SELECT start_date FROM students;

ALTER TABLE students
DROP UNUSED COLUMNS;

ALTER TABLE students
RENAME COLUMN student_id TO id;

ALTER TABLE students
READ ONLY;

DELETE FROM students
WHERE id = 1;

DROP TABLE students;

ALTER TABLE students
ADD (faculty_name varchar2(20));

SELECT * FROM students;

TRUNCATE TABLE students;

DROP TABLE students;
--------------------------------------------------------------------------------
