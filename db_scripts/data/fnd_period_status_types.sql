REM INSERTING into ENERGY_ADF.FND_PERIOD_STATUS_TYPES
SET DEFINE OFF;
Insert into FND_PERIOD_STATUS_TYPES (PERIOD_STATUS_TYPE_ID,NAME,DESCRIPTION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (1,'Closed','Closed',to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,1);
Insert into FND_PERIOD_STATUS_TYPES (PERIOD_STATUS_TYPE_ID,NAME,DESCRIPTION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (2,'Close Posting','Close Posting',to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,1);
Insert into FND_PERIOD_STATUS_TYPES (PERIOD_STATUS_TYPE_ID,NAME,DESCRIPTION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (3,'Future','Future',to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,1);
Insert into FND_PERIOD_STATUS_TYPES (PERIOD_STATUS_TYPE_ID,NAME,DESCRIPTION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (4,'Open','Open',to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,to_date('13-NOV-2015 10:12','DD-MON-RRRR HH24:MI'),1,1);
COMMIT;
