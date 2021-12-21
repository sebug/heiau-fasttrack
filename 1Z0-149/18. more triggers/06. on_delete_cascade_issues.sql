DROP TABLE dpet1;

CREATE TABLE dpet1 (
    deptno NUMBER,
    dname VARCHAR2(100),
    CONSTRAINT PK_dpet1 PRIMARY KEY (deptno)
);

INSERT INTO dpet1 (deptno, dname) VALUES (1, 'Software Engineering');
INSERT INTO dpet1 (deptno, dname) VALUES (2, 'System Engineering');

COMMIT;

SELECT * FROM dpet1;

DROP TABLE emp1;

CREATE TABLE emp1 (
    empid NUMBER PRIMARY KEY,
    ename VARCHAR2(100),
    deptno NUMBER,
    CONSTRAINT emp1_FK FOREIGN KEY (deptno) REFERENCES dpet1(deptno) ON DELETE CASCADE
);

INSERT INTO emp1 (
    empid, ename, deptno
) VALUES (1, 'seb', 1);

DELETE FROM dpet1;

-- On delete cascade we can also face the mutating table issue