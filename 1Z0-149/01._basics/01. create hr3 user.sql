alter session set container=orcl

create user hr3 identified by hr3;
grant create session to hr3;
grant create table, create view to hr3;
grant create procedure to hr3;
grant create synonym, create trigger to hr3;
grant unlimited tablespace to hr3;
