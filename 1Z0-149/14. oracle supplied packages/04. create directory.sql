-- SYS AS SYSDBA
-- I only managed to get this to work by specifying MYDIR in uppercase!
ALTER SESSION SET CONTAINER = orcl;

CREATE DIRECTORY MYDIR AS '/u01/userhome/oracle/test';

GRANT READ, WRITE ON DIRECTORY MYDIR TO PUBLIC;

SELECT * FROM dba_directories;
