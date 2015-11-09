DROP USER energy_adf CASCADE;

CREATE USER energy_adf IDENTIFIED BY energy_adf DEFAULT TABLESPACE users 
                                  TEMPORARY TABLESPACE temp  
                                  QUOTA UNLIMITED ON users;

GRANT create session TO energy_adf ;
GRANT alter session TO energy_adf ;
GRANT create table TO energy_adf ;
GRANT create trigger TO energy_adf ;
GRANT create view TO energy_adf ;
GRANT create sequence TO energy_adf ;
GRANT create synonym TO energy_adf ;
GRANT create type TO energy_adf ;
GRANT create procedure TO energy_adf ;
