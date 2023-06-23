---------- TASK 1 ----------
CREATE TABLE address (
    id INTEGER CONSTRAINT ad_id_unique UNIQUE,
    country VARCHAR2(25),
    city VARCHAR2(25)
);
SELECT * FROM address;

CREATE TABLE address (
    id INTEGER UNIQUE,
    country VARCHAR2(25),
    city VARCHAR2(25)
);
SELECT * FROM address;

---------- TASK 2 ----------
CREATE TABLE friends (
    id INTEGER,
    name VARCHAR2(25),
    email VARCHAR2(25),
    address_id INTEGER CONSTRAINT fk REFERENCES address (id) ON DELETE SET NULL,
    birthday DATE,
    CONSTRAINT ch CHECK (LENGTH(name) > 3)
);
SELECT * FROM friends;

CREATE TABLE friends (
    id INTEGER,
    name VARCHAR2(25),
    email VARCHAR2(25),
    address_id INTEGER REFERENCES address (id) ON DELETE SET NULL,
    birthday DATE,
    CHECK (LENGTH(name) > 3)
);
SELECT * FROM friends;

---------- TASK 3 ----------
CREATE UNIQUE INDEX fr_id_un_in ON friends (id);

---------- TASK 4 ----------
ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

---------- TASK 5 ----------
CREATE INDEX fr_email_in ON friends (email);

---------- TASK 6 ----------
ALTER TABLE friends MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

---------- TASK 7 ----------
DROP TABLE friends;

---------- TASK 8 ----------
DROP TABLE address;

--------------------------------------------------------------------------------
CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER
);

CREATE TABLE facultiess (
    id INTEGER,
    name VARCHAR2(15)
);

CREATE TABLE students (
    id NUMBER CONSTRAINT st_id_unique UNIQUE,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER
);
SELECT * FROM students;

CREATE TABLE faculties (
    id INTEGER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (2, 'Misha', 2, 3, 7.5, TO_DATE('01-SEP-21'), 800);

INSERT INTO students
VALUES (null, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER,
    CONSTRAINT st_id_unique UNIQUE (id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER,
    CONSTRAINT st_id_unique UNIQUE (id, name)
);
SELECT * FROM students;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (null, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (1, 'Kolya', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER,
    CONSTRAINT st_id_unique UNIQUE (id)
);
SELECT * FROM students;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (1, 'Kolya', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (2, 'Misha', 2, 3, 7.5, TO_DATE('01-SEP-21'), 800);

INSERT INTO students
VALUES (null, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER,
    UNIQUE (id)
);
SELECT * FROM students;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (1, 'Kolya', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER UNIQUE,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER
);
SELECT * FROM students;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (1, 'Kolya', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (2, 'Misha', 2, 3, 7.5, TO_DATE('01-SEP-21'), 800);

INSERT INTO students
VALUES (null, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER
);
SELECT * FROM students;

ALTER TABLE students ADD CONSTRAINT st_id_unique UNIQUE (id);

CREATE TABLE faculties (
    id INTEGER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Economics');
INSERT INTO faculties VALUES (2, 'Philology');

ALTER TABLE faculties ADD CONSTRAINT st_id_unique UNIQUE (id);

ALTER TABLE faculties ADD UNIQUE (id);

UPDATE faculties SET id = 3 WHERE name = 'Philology';

INSERT INTO faculties VALUES (3, 'Philology');

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    avg_score NUMBER(5, 2),
    start_date DATE,
    scholarship INTEGER
);
SELECT * FROM students;

DROP TABLE faculties;

CREATE TABLE faculties (
    id INTEGER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

ALTER TABLE students MODIFY (id CONSTRAINT abc UNIQUE);
ALTER TABLE faculties MODIFY (id UNIQUE);

ALTER TABLE students DROP CONSTRAINT abc;

INSERT INTO students
VALUES (1, 'Dmitriy', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

INSERT INTO students
VALUES (1, 'Kolya', 3, 1, 8.7, TO_DATE('15-SEP-20'), 1500);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER CONSTRAINT stud_course_notnull NOT NULL,
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 5);
INSERT INTO students VALUES (1, 'Dmitriy', null, 5);
INSERT INTO students (id, name, faculty_id) VALUES (1, 'Dmitriy', 5);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER NOT NULL,
    faculty_id INTEGER
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER NOT NULL,
    faculty_id INTEGER
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (course CONSTRAINT st_course_notnull NOT NULL);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (course NOT NULL);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER DEFAULT 3,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (course NOT NULL);

INSERT INTO students (id, name, faculty_id)
VALUES (5, 'Dmitriy', 3);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER NOT NULL,
    faculty_id INTEGER,
    CONSTRAINT con1 UNIQUE (course)
);
SELECT * FROM students;

INSERT INTO students VALUES (5, 'Dmitriy', 2, 3);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (5, 'Dmitriy', 2, 3);
INSERT INTO students VALUES (7, 'Misha', null, 5);

ALTER TABLE students MODIFY (course NOT NULL);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (course NOT NULL);

INSERT INTO students VALUES (7, 'Misha', null, 5);

ALTER TABLE students MODIFY (course NULL);

INSERT INTO students VALUES (7, 'Misha', null, 5);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER CONSTRAINT st_id_pk PRIMARY KEY,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (7, 'Misha', null, 5);
INSERT INTO students VALUES (8, 'Pasha', 3, 7);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    CONSTRAINT st_id_pk PRIMARY KEY (id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    PRIMARY KEY (id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    PRIMARY KEY (id, name)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    PRIMARY KEY (id, name)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (id PRIMARY KEY);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (id CONSTRAINT st_id_pk PRIMARY KEY);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students ADD CONSTRAINT st_id_pk PRIMARY KEY (id);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students ADD PRIMARY KEY (id);

DROP TABLE students;
DROP TABLE faculties;

CREATE TABLE faculties (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER CONSTRAINT st_faculty_fk REFERENCES faculties(id)
);
SELECT * FROM students;

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');

INSERT INTO students VALUES (1, 'Dmitriy', 3, 5);
INSERT INTO students VALUES (1, 'Dmitriy', null, 1);
INSERT INTO students VALUES (5, 'Misha', 2, 2);
INSERT INTO students VALUES (1, 'Dmitriy', null, 1);
INSERT INTO students VALUES (9, 'Ivan', 5, null);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER REFERENCES faculties(id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    CONSTRAINT st_faculty_id_fk FOREIGN KEY(faculty_id) REFERENCES faculties(id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    FOREIGN KEY(faculty_id) REFERENCES faculties(id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    FOREIGN KEY(faculty_id) REFERENCES faculties
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (CONSTRAINT fk faculty_id REFERENCES faculties(id));

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (faculty_id CONSTRAINT fk REFERENCES faculties(id));

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (faculty_id REFERENCES faculties(id));

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students ADD CONSTRAINT fk FOREIGN KEY (faculty_id)
REFERENCES faculties(id);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students ADD FOREIGN KEY (faculty_id)
REFERENCES faculties(id);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

DROP TABLE faculties;

CREATE TABLE faculties (
    id NUMBER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

DROP TABLE students;

DROP TABLE faculties;

CREATE TABLE faculties (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER REFERENCES faculties
);
SELECT * FROM students;

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (3, 'Misha', 1, 1);

DELETE FROM faculties WHERE id = 1;

INSERT INTO faculties VALUES (3, 'Philology');

DELETE FROM faculties WHERE id = 3;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER REFERENCES faculties ON DELETE CASCADE
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (3, 'Misha', 1, 1);

DELETE FROM faculties WHERE id = 1;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER REFERENCES faculties ON DELETE SET NULL
);
SELECT * FROM students;

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (3, 'Misha', 1, 1);

DELETE FROM faculties WHERE id = 1;

INSERT INTO faculties VALUES (1, 'CS');

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER NOT NULL,
    CONSTRAINT fk FOREIGN KEY (faculty_id)
    REFERENCES faculties ON DELETE SET NULL
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (3, 'Misha', 1, 1);

DELETE FROM faculties WHERE id = 1;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    CONSTRAINT fk FOREIGN KEY (faculty_id)
    REFERENCES faculties ON DELETE SET NULL
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', 2, 2);
INSERT INTO students VALUES (3, 'Misha', 1, 1);

DROP TABLE faculties;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER CONSTRAINT ch CHECK (course > 0 AND course < 6),
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', -1, 2);
INSERT INTO students VALUES (3, 'Misha', 6, 1);

UPDATE students SET course = 10 WHERE id = 1;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    CONSTRAINT ch CHECK (course > id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER,
    CHECK (course > id)
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

ALTER TABLE students MODIFY (id CONSTRAINT ch CHECK (id >= 1));

ALTER TABLE students MODIFY (id CHECK (id >= 1));

ALTER TABLE students ADD CONSTRAINT ch2 CHECK (course < 20);

ALTER TABLE students ADD CHECK (course < 30);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 1);
INSERT INTO students VALUES (2, 'Ivan', -1, 2);
INSERT INTO students VALUES (3, 'Misha', 6, 1);

ALTER TABLE students ADD CHECK (course > 0);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    email VARCHAR2(25) CHECK (INSTR(email, '@') > 0),
    faculty_id INTEGER
);
SELECT * FROM students;

INSERT INTO students VALUES (1, 'Dmitriy', 3, 'radmidevmail.ru', 1);
INSERT INTO students VALUES (1, 'Dmitriy', 3, 'radmidev@mail.ru', 1);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    email VARCHAR2(25) CHECK (INSTR(email, '@') > 0) UNIQUE,
    faculty_id INTEGER
);
SELECT * FROM students;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    email VARCHAR2(25) CHECK (INSTR(email, '@') > 0) CONSTRAINT un UNIQUE,
    faculty_id INTEGER
);
SELECT * FROM students;

CREATE TABLE new_emps10 AS SELECT * FROM employees;

DROP TABLE new_emps10;

SELECT rowid FROM employees WHERE first_name = 'John';
SELECT * FROM employees WHERE rowid = 'AAAR7IAAEAAALC2AAK';

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER
);
SELECT * FROM students;

CREATE INDEX in1 ON students (id);

INSERT INTO students VALUES (1, 'Dmitriy', 3);
INSERT INTO students VALUES (2, 'Misha', 2);
INSERT INTO students VALUES (2, 'Lesha', 5);
INSERT INTO students VALUES (3, 'Lesha', 3);

CREATE UNIQUE INDEX in2 ON students (name);

DELETE FROM students WHERE id = 3;

CREATE UNIQUE INDEX in2 ON students (name);

INSERT INTO students VALUES (3, 'Lesha', 3);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER
);
SELECT * FROM students;

CREATE INDEX in3 ON students (name, id);

DROP TABLE faculties;

CREATE TABLE faculties (
    id NUMBER,
    name VARCHAR2(15)
);
SELECT * FROM faculties;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER
);
SELECT * FROM students;

CREATE UNIQUE INDEX st_in1 ON students (id);
CREATE UNIQUE INDEX f_in1 ON faculties (id);
CREATE UNIQUE INDEX st_in2 ON students (course);
CREATE INDEX st_in3 ON students (name);

ALTER TABLE students ADD CONSTRAINT st_pk PRIMARY KEY (id);
ALTER TABLE faculties ADD CONSTRAINT f_pk PRIMARY KEY (id);

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id NUMBER
);
SELECT * FROM students;

CREATE UNIQUE INDEX st_in1 ON students (id);
CREATE UNIQUE INDEX st_in2 ON students (course);
CREATE INDEX st_in3 ON students(name);

ALTER TABLE students ADD CONSTRAINT st_pk PRIMARY KEY (id);
ALTER TABLE students ADD CONSTRAINT st_fk FOREIGN KEY (faculty_id)
REFERENCES faculties (id);
ALTER TABLE students ADD CONSTRAINT st_un UNIQUE (course);

DROP INDEX st_in3;
DROP INDEX st_in1;

DROP TABLE students;

CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(15),
    course NUMBER,
    faculty_id NUMBER
);
SELECT * FROM students;

CREATE BITMAP INDEX b_ind1 ON students (faculty_id);
SELECT * FROM v$version;
--------------------------------------------------------------------------------
