DROP TABLE students;

CREATE TABLE students (
    student_id NUMBER,
    first_name VARCHAR2(50),
    birthday DATE,
    CONSTRAINT PK_students PRIMARY KEY (student_id)
);

DROP SEQUENCE student_seq;

CREATE SEQUENCE student_seq;

CREATE OR REPLACE PACKAGE General_Student
IS
    PROCEDURE insert_student
    (p_first_name VARCHAR2, p_birthday DATE);
    
    PROCEDURE delete_student
    (p_student_id NUMBER);
    
    FUNCTION get_name
    (p_student_id NUMBER)
    RETURN VARCHAR2;
END;

CREATE OR REPLACE PACKAGE BODY General_Student
IS
    PROCEDURE insert_student
    (p_first_name VARCHAR2, p_birthday DATE)
    IS
    BEGIN
        INSERT INTO students (student_id, first_name, birthday)
        VALUES (student_seq.NEXTVAL, p_first_name, p_birthday);
        
        COMMIT;
    END;
    
    PROCEDURE delete_student
    (p_student_id NUMBER)
    IS
    BEGIN
        DELETE FROM students
        WHERE student_id = p_student_id;
        
        COMMIT;
    END;
    
    FUNCTION get_name
    (p_student_id NUMBER)
    RETURN VARCHAR2
    IS
        v_student_firstname VARCHAR2(50);
    BEGIN
        SELECT first_name
        INTO v_student_firstname
        FROM students
        WHERE student_id = p_student_id;
        
        RETURN v_student_firstname;
    END;
END;

EXECUTE general_student.insert_student('sebastian',to_date('1992-11-15', 'YYYY-MM-DD'));

