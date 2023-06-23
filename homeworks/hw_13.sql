---------- TASK 1 ----------
CREATE TABLE emp1000 AS (
    SELECT first_name, last_name, salary, department_id
    FROM employees
);
SELECT * FROM emp1000;

CREATE TABLE emp1000 AS
SELECT first_name, last_name, salary, department_id FROM employees;

---------- TASK 2 ----------
CREATE FORCE VIEW v1000 AS (
    SELECT first_name, last_name, salary, department_name, city
    FROM emp1000 e JOIN departments d
    ON (e.department_id = d.department_id)
);
SELECT * FROM v1000;

CREATE FORCE VIEW v1000 AS
SELECT first_name, last_name, salary, department_name, city
FROM emp1000 e JOIN departments d
ON (e.department_id = d.department_id);

---------- TASK 3 ----------
ALTER TABLE emp1000 ADD (city VARCHAR2(25));

---------- TASK 4 ----------
ALTER VIEW v1000 COMPILE;
SELECT * FROM v1000;

---------- TASK 5 ----------
CREATE SYNONYM syn1000 FOR v1000;
SELECT * FROM syn1000;

---------- TASK 6 ----------
DROP VIEW v1000;

---------- TASK 7 ----------
DROP SYNONYM syn1000;

---------- TASK 8 ----------
DROP TABLE emp1000;

---------- TASK 9 ----------
CREATE SEQUENCE seq1000
INCREMENT BY 4
START WITH 12
MAXVALUE 200
CYCLE;

---------- TASK 10 ----------
ALTER SEQUENCE seq1000
NOMAXVALUE
NOCYCLE;

---------- TASK 11 ----------
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.NEXTVAL, 'Petrov', 'VPETROV',
        TO_DATE('20/05/2023', 'dd/MM/YYYY'), 'IT_PROG');
        
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.NEXTVAL, 'Ivanov', 'MIVANOV', SYSDATE - 7, 'IT_PROG');

---------- TASK 12 ----------
COMMIT;

SELECT * FROM employees;

--------------------------------------------------------------------------------
SELECT * FROM employees;

CREATE VIEW fin_emp AS
SELECT employee_id, job_id, salary FROM employees;

SELECT * FROM fin_emp;

CREATE VIEW fin_emp2 AS
SELECT department_name, SUM(salary) sum_salary
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY department_name;

SELECT * FROM fin_emp2;

SELECT department_name FROM fin_emp2 WHERE sum_salary > 10000;

CREATE VIEW emps_with_high_salary2 AS
SELECT first_name, last_name FROM employees WHERE salary >= 12000;

SELECT * FROM emps_with_high_salary2;

UPDATE employees SET salary = 15000 WHERE employee_id = 103;

SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 2);
INSERT INTO students VALUES (2, 'Misha', 1, 3);
INSERT INTO students VALUES (3, 'Masha', 1, 1);

CREATE VIEW v101 AS SELECT name, course FROM students;

SELECT * FROM v101;

INSERT INTO v101 VALUES ('Ivan', 4);

DELETE FROM v101 WHERE name = 'Ivan';

ALTER TABLE students MODIFY (id NOT NULL);

INSERT INTO v101 VALUES ('Ivan', 4);

SELECT * FROM fin_emp2;

INSERT INTO fin_emp2 VALUES ('abra-kadabra', 100000);
UPDATE fin_emp2 SET department_name = 'abra-kadabra' WHERE sum_salary > 5000;
DELETE FROM fin_emp2;

CREATE VIEW v105 AS
SELECT SUBSTR(name, 2) name, course FROM students;

SELECT * FROM v105;

INSERT INTO v105 VALUES ('Kolya', 3);
DELETE FROM V105 WHERE name = 'mitriy';

CREATE VIEW v106 AS SELECT DISTINCT name, course FROM students;

SELECT * FROM v106;
SELECT * FROM students;

INSERT INTO v106 VALUES ('Kolya', 3);
DELETE FROM V106 WHERE name = 'Masha';

CREATE VIEW v107 AS SELECT name n, course c FROM students;

SELECT * FROM v107;
SELECT * FROM students;

DELETE FROM V107 WHERE n = 'Masha';

INSERT INTO v107 VALUES ('Kolya', 3);

ALTER TABLE students MODIFY (id NULL);

INSERT INTO v107 VALUES ('Kolya', 3);

CREATE VIEW v108 AS SELECT rownum r, name, course FROM students;

SELECT * FROM v108;
SELECT * FROM students;

INSERT INTO v108 VALUES (3, 'Petya', 3);
DELETE FROM V108 WHERE r = 1;

SELECT * FROM students;
DROP TABLE students;
DROP TABLE faculties;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3);
INSERT INTO students VALUES (2, 'Misha', 2);
INSERT INTO students VALUES (3, 'Kolya', 4);
INSERT INTO students VALUES (4, 'Vasya', 5);
INSERT INTO students VALUES (5, 'Petya', 1);

CREATE OR REPLACE VIEW fin_emp2 AS SELECT * FROM students;
SELECT * FROM fin_emp2;

CREATE OR REPLACE VIEW fin_emp12 AS SELECT * FROM students;
SELECT * FROM fin_emp12;

CREATE OR REPLACE VIEW v201 AS SELECT * FROM students2;

CREATE OR REPLACE VIEW v201 AS SELECT name, surname FROM students;

CREATE FORCE VIEW v201 AS SELECT * FROM students2;
SELECT * FROM students2;

CREATE VIEW v202 AS SELECT * FROM students WHERE course > 2;
SELECT * FROM v202;
INSERT INTO v202 VALUES (7, 'Katya', 1);

CREATE VIEW v203 AS SELECT * FROM students WHERE course > 2 WITH CHECK OPTION;
SELECT * FROM v203;
INSERT INTO v203 VALUES (8, 'Fedya', 1);
INSERT INTO v203 VALUES (8, 'Fedya', 3);
SELECT * FROM students;
UPDATE v203 SET course = 2 WHERE name = 'Fedya';
UPDATE students SET course = 2 WHERE name = 'Fedya';
UPDATE v203 SET course = 5 WHERE name = 'Fedya';

CREATE VIEW v204 AS SELECT * FROM students WITH READ ONLY;
INSERT INTO v204 VALUES (8, 'Fedya', 3);

CREATE VIEW v210 AS SELECT * FROM students
WITH READ ONLY CONSTRAINT ogranichenie_1;

INSERT INTO v210 VALUES (8, 'Fedya', 3);

CREATE VIEW v211 (a, b) AS SELECT * FROM students;
CREATE VIEW v211 (a, b, c) AS SELECT * FROM students;
SELECT * FROM v211;

CREATE FORCE VIEW v18 AS SELECT name, last_name FROM students;
SELECT * FROM v18;

ALTER TABLE students ADD (last_name VARCHAR2(15));
SELECT * FROM students;

ALTER VIEW v18 COMPILE;

DROP VIEW v18;

SELECT * FROM v211;

CREATE VIEW v212 AS SELECT * FROM v211;
SELECT * FROM v212;

CREATE VIEW v300 AS SELECT * FROM students;
SELECT * FROM v300;

CREATE VIEW v301 AS SELECT * FROM students WHERE id > 4;
SELECT * FROM v301;
SELECT * FROM v301 WHERE name = 'Petya';

SELECT * FROM students WHERE id > 4 AND name = 'Petya';

SELECT * fROM employees;
SELECT * fROM hr.employees;
SELECT * fROM hr.employees@orclpdb2;

SELECT * FROM students;

CREATE SYNONYM syn1 FOR students; 
SELECT * FROM syn1;

DELETE FROM syn1 WHERE ID = 8;

CREATE PUBLIC SYNONYM syn1 FOR employees;

SELECT * FROM syn1;

DROP PUBLIC SYNONYM syn1;

SELECT * FROM syn1;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER
);

ALTER SYNONYM syn1 COMPILE;

SELECT * FROM syn1;

CREATE SEQUENCE s1;

SELECT s1.NEXTVAL FROM dual;

SELECT s1.CURRVAL FROM dual;

DROP TABLE students;

CREATE TABLE students(
    id NUMBER,
    name VARCHAR2(25),
    course NUMBER,
    faculty_id NUMBER 
);
SELECT * FROM students;

DROP TABLE faculties;

CREATE TABLE faculties(
    id NUMBER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

CREATE SEQUENCE seq_st;

CREATE SEQUENCE seq_faculty START WITH 20 INCREMENT BY 5;

INSERT INTO faculties VALUES(seq_faculty.NEXTVAL, 'IT');
INSERT INTO students VALUES(seq_st.NEXTVAL, 'Dmitriy', 3, seq_faculty.CURRVAL);
INSERT INTO faculties VALUES(seq_faculty.NEXTVAL, 'Marketing');
INSERT INTO faculties VALUES(seq_faculty.NEXTVAL, 'Philology');
INSERT INTO students VALUES(seq_st.NEXTVAL, 'Misha', 2, 25);

CREATE SEQUENCE s3 INCREMENT BY 2 MAXVALUE 17;
SELECT s3.NEXTVAL FROM dual;

CREATE SEQUENCE s4 INCREMENT BY 2 MAXVALUE 17 CYCLE CACHE 3;
SELECT s4.NEXTVAL FROM dual;

CREATE SEQUENCE s5 START WITH 7 INCREMENT BY 4 MAXVALUE 17 CYCLE CACHE 2;
SELECT s5.NEXTVAL FROM dual;

DROP TABLE students;

CREATE TABLE students(
    id NUMBER,
    name VARCHAR2(25)
);
SELECT * FROM students;

CREATE SEQUENCE s10;

INSERT INTO students VALUES(s10.NEXTVAL, 'Dmitriy');
INSERT INTO students VALUES(s10.NEXTVAL, 'Misha');
INSERT INTO students VALUES(s10.NEXTVAL, 'Masha');

SELECT * FROM students;

CREATE TABLE seq(
    n NUMBER
);

INSERT INTO seq VALUES (1);

DROP TABLE students;

CREATE TABLE students(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(25)
);
SELECT * FROM students;

INSERT INTO students VALUES ((SELECT n FROM seq), 'Dmitriy');
UPDATE seq SET n = n + 1;
COMMIT;

SELECT * FROM seq;

CREATE SEQUENCE s10;

INSERT INTO students VALUES(s10.NEXTVAL, 'Misha');
INSERT INTO students VALUES(s10.NEXTVAL, 'Masha');

SELECT * FROM students;

ALTER SEQUENCE s10 INCREMENT BY 5;

INSERT INTO students VALUES(s10.NEXTVAL, 'Kolya');
INSERT INTO students VALUES(s10.NEXTVAL, 'Vasya');

SELECT s10.CURRVAL FROM DUAL;

DROP sequence s10;

CREATE SEQUENCE s20;

SELECT s20.CURRVAL FROM DUAL;
SELECT s20.NEXTVAL FROM DUAL;
--------------------------------------------------------------------------------
