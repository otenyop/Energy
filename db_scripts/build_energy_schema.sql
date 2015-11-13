

@@create_user

REM If this fails with ORA-01940 because energy_adf user is connected, issue the following as system:
REM select sid, serial#, username from v$session where username='energy_adf';
REM alter system kill session '<SID>,<SERIAL#>' immediate;

REM Modify the next line to point to your database SID if not local (connect energy_adf/energy_adf@SID)

connect energy_adf/energy_adf
@@create_tables
@@create_sequences
@@create_functions
@@create_packages
@@create_triggers
@@data/fnd_currencies
@@data/fnd_period_status_types
@@data/mtl_item_types
commit;
