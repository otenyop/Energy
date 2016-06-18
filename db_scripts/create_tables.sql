CREATE TABLE FND_CURRENCIES 
   (	
	CURRENCY_CODE 				VARCHAR2(15) 				NOT NULL, 
	NAME                      	VARCHAR2(80) 				NOT NULL,
	DESCRIPTION 				VARCHAR2(240)						,
	ENABLED_FLAG 				VARCHAR2(1) 				NOT NULL,  
	PRECISION 					NUMBER(1)							, 
	EXTENDED_PRECISION 			NUMBER(2)							, 
	SYMBOL 						VARCHAR2(12)						, 
	START_DATE_ACTIVE 			DATE								, 
	END_DATE_ACTIVE 			DATE								,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15) 				DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15) 				DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15) 				DEFAULT 1			NOT NULL,
	CONSTRAINT CURRENCY_CODE_PK PRIMARY KEY 
	  (
		CURRENCY_CODE
	  )
	  ENABLE
   ); 

   CREATE TABLE FND_PERIOD_STATUS_TYPES   
   (
	PERIOD_STATUS_TYPE_ID		NUMBER(15)					NOT NULL,
	NAME                      	VARCHAR2(15) 				NOT NULL,
	DESCRIPTION 				VARCHAR2(240)						,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15) 				DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15) 				DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15) 				DEFAULT 1			NOT NULL,
	CONSTRAINT PERIOD_STATUS_TYPE_ID_PK PRIMARY KEY 
	  (
		PERIOD_STATUS_TYPE_ID
	  )
	  ENABLE
   ); 
   
	ALTER TABLE FND_PERIOD_STATUS_TYPES
	ADD CONSTRAINT FND_PRD_STATUS_TYPES_NAME_UK UNIQUE 
	(
	  NAME 
	)
	ENABLE;   
	
   CREATE TABLE FND_USERS 
   (
	FND_USER_ID					NUMBER(15)					NOT NULL,
	USER_NAME                 	VARCHAR2(100) 				NOT NULL,
	USER_PASSWORD				VARCHAR2(100)				NOT NULL,
	LAST_NAME					VARCHAR2(150)				NOT NULL,
	FIRST_NAME					VARCHAR2(150)				NOT NULL,
	DESCRIPTION 				VARCHAR2(240)						,
	START_DATE_ACTIVE 			DATE								, 
	END_DATE_ACTIVE 			DATE								,	
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15) 				DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15) 				DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15) 			    DEFAULT 1			NOT NULL,
	CONSTRAINT FND_USER_ID_PK PRIMARY KEY 
	  (
		FND_USER_ID
	  )
	  ENABLE
   ); 
   
	ALTER TABLE FND_USERS 
	ADD CONSTRAINT FND_USER_USER_NAME_UK UNIQUE 
	(
	  USER_NAME
	)
	ENABLE;  	
   
  CREATE TABLE HR_BUSINESS_GROUPS
   (	
	BUSINESS_GROUP_ID           NUMBER(15) 					NOT NULL,
	BUSINESS_GROUP_NAME         VARCHAR2(240) 				NOT NULL,
	ADDRESS_LINE_1              VARCHAR2(240)  						,    
	ADDRESS_LINE_2              VARCHAR2(240)      					,
	ADDRESS_LINE_3              VARCHAR2(240)  						,
	TOWN_OR_CITY                VARCHAR2(30)       					,
	COUNTRY                     VARCHAR2(60)       					,
	POSTAL_CODE                 VARCHAR2(30) 						,
	REGION_1                    VARCHAR2(120)      					,
	REGION_2                    VARCHAR2(120)      					,
	REGION_3                    VARCHAR2(120)						,
	TELEPHONE_NUMBER_1          VARCHAR2(60)       					,
	TELEPHONE_NUMBER_2          VARCHAR2(60)       					,	
	TELEPHONE_NUMBER_3          VARCHAR2(60)						,
	START_DATE_ACTIVE 			DATE								, 
	END_DATE_ACTIVE 			DATE								,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT BUSINESS_GROUP_ID_PK PRIMARY KEY 
	  (
		BUSINESS_GROUP_ID
	  )
	  ENABLE	
   ); 
    

   CREATE TABLE HR_OPERATING_UNITS
   (	
	OPERATING_UNIT_ID           NUMBER(15) 					NOT NULL,
	BUSINESS_GROUP_ID           NUMBER(15) 					NOT NULL,
	OPERATING_UNIT_NAME         VARCHAR2(240) 				NOT NULL,
	SHORT_CODE                 	VARCHAR2(150)						,
	ADDRESS_LINE_1              VARCHAR2(240)  						,    
	ADDRESS_LINE_2              VARCHAR2(240)      					,
	ADDRESS_LINE_3              VARCHAR2(240)  						,
	TOWN_OR_CITY                VARCHAR2(30)       					,
	COUNTRY                     VARCHAR2(60)       					,
	POSTAL_CODE                 VARCHAR2(30) 						,
	REGION_1                    VARCHAR2(120)      					,
	REGION_2                    VARCHAR2(120)      					,
	REGION_3                    VARCHAR2(120)						,
	TELEPHONE_NUMBER_1          VARCHAR2(60)       					,
	TELEPHONE_NUMBER_2          VARCHAR2(60)       					,	
	TELEPHONE_NUMBER_3          VARCHAR2(60)						,
	START_DATE_ACTIVE 			DATE								, 
	END_DATE_ACTIVE 			DATE								,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT OPERATING_UNIT_ID_PK PRIMARY KEY 
	  (
		OPERATING_UNIT_ID
	  )
	  ENABLE		
   ); 
   
	ALTER TABLE HR_OPERATING_UNITS
	ADD CONSTRAINT OU_BUSINESS_GROUP_ID_FK FOREIGN KEY
	(
	  BUSINESS_GROUP_ID
	)
	REFERENCES HR_BUSINESS_GROUPS
	(
	  BUSINESS_GROUP_ID
	)
	ENABLE;   
	
   CREATE TABLE GL_CALENDAR_HEADERS
   (	
	GL_CALENDAR_ID           	NUMBER(15) 					NOT NULL,
	GL_CALENDAR_NAME            VARCHAR2(15) 				NOT NULL,
	DESCRIPTION				    VARCHAR2(240) 				NOT NULL,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT GL_CALENDAR_ID_PK PRIMARY KEY 
	  (
		GL_CALENDAR_ID
	  )
	  ENABLE		
   ); 	
   
   CREATE TABLE GL_CALENDAR_LINES
   (	
	GL_CALENDAR_LINE_ID         NUMBER(15) 					NOT NULL,
	GL_CALENDAR_ID           	NUMBER(15) 					NOT NULL,	
	PERIOD_YEAR             	NUMBER(15) 					NOT NULL,
	FROM_DATE 					DATE						NOT NULL, 
	TO_DATE		 				DATE						NOT NULL,	
	PERIOD_NAME					VARCHAR2(15) 				NOT NULL,
	PERIOD_NUM              	NUMBER(15)					NOT NULL,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT GL_CALENDAR_LINE_ID_PK PRIMARY KEY 
	  (
		GL_CALENDAR_LINE_ID
	  )
	  ENABLE		
   );   

   	ALTER TABLE GL_CALENDAR_LINES
	ADD CONSTRAINT CALNDR_LINES_GL_CALENDAR_ID_FK FOREIGN KEY
	(
	  GL_CALENDAR_ID
	)
	REFERENCES GL_CALENDAR_HEADERS
	(
	  GL_CALENDAR_ID
	)
	ENABLE; 
	
   CREATE TABLE GL_PERIODS
   (	
	GL_PERIOD_ID         		NUMBER(15) 					NOT NULL,
	OPERATING_UNIT_ID           NUMBER(15) 					NOT NULL,	
	GL_CALENDAR_LINE_ID         NUMBER(15) 					NOT NULL,	
	PERIOD_STATUS_TYPE_ID		NUMBER(15)					NOT NULL,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT PERIOD_ID_PK PRIMARY KEY 
	  (
		GL_PERIOD_ID
	  )
	  ENABLE		
   ); 
   	ALTER TABLE GL_PERIODS
	ADD CONSTRAINT GLPRD_OPERATING_UNIT_ID_FK FOREIGN KEY
	(
	  OPERATING_UNIT_ID
	)
	REFERENCES HR_OPERATING_UNITS
	(
	  OPERATING_UNIT_ID
	)
	ENABLE;  
	
   	ALTER TABLE GL_PERIODS
	ADD CONSTRAINT GLPRD_GL_CALENDAR_LINE_ID_FK FOREIGN KEY
	(
	  GL_CALENDAR_LINE_ID
	)
	REFERENCES GL_CALENDAR_LINES
	(
	  GL_CALENDAR_LINE_ID
	)
	ENABLE;  
	
   	ALTER TABLE GL_PERIODS
	ADD CONSTRAINT GLPRD_PERIOD_STATUS_TYPE_ID_FK FOREIGN KEY
	(
	  PERIOD_STATUS_TYPE_ID
	)
	REFERENCES FND_PERIOD_STATUS_TYPES
	(
	  PERIOD_STATUS_TYPE_ID
	)
	ENABLE;  	

   CREATE TABLE INV_INVENTORY_ORGANIZATIONS
   (	
	INVENTORY_ORGANIZATION_ID 	NUMBER(15) 					NOT NULL,
	INVENTORY_ORGANIZATION_CODE	VARCHAR2(15)				NOT NULL,
	INVENTORY_ORGANIZATION_NAME	VARCHAR2(250)				NOT NULL,
	OPERATING_UNIT_ID           NUMBER(15) 					NOT NULL,	
	GL_CALENDAR_ID           	NUMBER(15) 					NOT NULL,
	MATERIAL_ACCOUNT			NUMBER(15)					NOT NULL,
	INTRANSIT_INVENTORY_ACCOUNT	NUMBER(15)					NOT NULL,
	COGS_ACCOUNT				NUMBER(15)					NOT NULL,
	PPV_ACCOUNT					NUMBER(15)					NOT NULL,
	ACCRUAL_ACCOUNT				NUMBER(15)					NOT NULL,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT INVENTORY_ORGANIZATION_ID_PK PRIMARY KEY 
	  (
		INVENTORY_ORGANIZATION_ID
	  )
	  ENABLE		
   ); 	
   
   	ALTER TABLE INV_INVENTORY_ORGANIZATIONS
	ADD CONSTRAINT INVORG_OPERATING_UNIT_ID_FK FOREIGN KEY
	(
	  OPERATING_UNIT_ID
	)
	REFERENCES HR_OPERATING_UNITS
	(
	  OPERATING_UNIT_ID
	)
	ENABLE;  
	
   	ALTER TABLE INV_INVENTORY_ORGANIZATIONS
	ADD CONSTRAINT INVORG_GL_CALENDAR_ID_FK FOREIGN KEY
	(
	  GL_CALENDAR_ID
	)
	REFERENCES GL_CALENDAR_HEADERS
	(
	  GL_CALENDAR_ID
	)
	ENABLE; 	
	
   CREATE TABLE INV_INVENTORY_PERIODS
   (	
	INVENTORY_PERIOD_ID 		NUMBER(15) 					NOT NULL,
	INVENTORY_ORGANIZATION_ID 	NUMBER(15) 					NOT NULL,	
	PERIOD_STATUS_TYPE_ID		NUMBER(15)					NOT NULL,
	CLOSE_DATE					DATE								,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT INVENTORY_PERIOD_ID_PK PRIMARY KEY 
	  (
		INVENTORY_PERIOD_ID
	  )
	  ENABLE		
   ); 	
   
   	ALTER TABLE INV_INVENTORY_PERIODS
	ADD CONSTRAINT INVPRD_INV_ORGANIZATION_ID_FK FOREIGN KEY
	(
	  INVENTORY_ORGANIZATION_ID
	)
	REFERENCES INV_INVENTORY_ORGANIZATIONS
	(
	  INVENTORY_ORGANIZATION_ID
	)
	ENABLE;       
   
   	ALTER TABLE INV_INVENTORY_PERIODS
	ADD CONSTRAINT INVPRD_PRD_STATUS_TYPE_ID_FK FOREIGN KEY
	(
	  PERIOD_STATUS_TYPE_ID
	)
	REFERENCES FND_PERIOD_STATUS_TYPES
	(
	  PERIOD_STATUS_TYPE_ID
	)
	ENABLE;    
	
   CREATE TABLE MTL_CATEGORY_SETS
   (	
	CATEGORY_SET_ID		 		NUMBER(15) 					NOT NULL,
	CATEGORY_SET_NAME			VARCHAR2(30)				NOT NULL,
	DESCRIPTION					VARCHAR2(240)						,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT CATEGORY_SET_ID_PK PRIMARY KEY 
	  (
		CATEGORY_SET_ID
	  )
	  ENABLE		
   ); 	

   CREATE TABLE MTL_CATEGORIES
   (	
	CATEGORY_ID		 			NUMBER(15) 					NOT NULL,
	CATEGORY_SET_ID		 		NUMBER(15) 					NOT NULL,	
	START_DATE_ACTIVE 			DATE								,
	END_DATE_ACTIVE				DATE								,
	DESCRIPTION					VARCHAR2(240)						,	
	SEGMENT1					VARCHAR2(40)						,	
	SEGMENT2					VARCHAR2(40)						,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT CATEGORY_ID_PK PRIMARY KEY 
	  (
		CATEGORY_ID
	  )
	  ENABLE		
   );   

   	ALTER TABLE MTL_CATEGORIES
	ADD CONSTRAINT CATSET_CATEGORY_SET_ID_FK FOREIGN KEY
	(
	  CATEGORY_SET_ID
	)
	REFERENCES MTL_CATEGORY_SETS
	(
	  CATEGORY_SET_ID
	)
	ENABLE;    
	
	
   CREATE TABLE MTL_UNITS_OF_MEASURE
   (	
	UOM_ID						NUMBER(15)					NOT NULL,						
	UOM_CODE					VARCHAR2(3)					NOT NULL,
	UOM_NAME					VARCHAR2(25)				NOT NULL,
	START_DATE_ACTIVE 			DATE								,
	END_DATE_ACTIVE				DATE								,	
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT UOM_ID_PK PRIMARY KEY 
	  (
		UOM_ID
	  )
	  ENABLE		
   ); 	
   
   CREATE TABLE MTL_ITEM_TYPES
   (	
	ITEM_TYPE_ID				NUMBER(15)					NOT NULL,						
	ITEM_TYPE_NAME				VARCHAR2(25)				NOT NULL,
	DESCRIPTION					VARCHAR2(240)						,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT ITEM_TYPE_ID_PK PRIMARY KEY 
	  (
		ITEM_TYPE_ID
	  )
	  ENABLE		
   ); 	

   CREATE TABLE MTL_INVENTORY_ITEMS
   (	
	INVENTORY_ITEM_ID			NUMBER(15)					NOT NULL,	
	INVENTORY_ORGANIZATION_ID	NUMBER(15) 					NOT NULL,
	ITEM_CODE					VARCHAR2(40)				NOT NULL,
	DESCRIPTION					VARCHAR2(240)				NOT NULL,
	LONG_DESCRIPTION			VARCHAR2(4000)						,
	UOM_ID						NUMBER(15)					NOT NULL,
	ITEM_TYPE_ID				NUMBER(15)					NOT NULL,
	PURCHASING_ITEM_FLAG		VARCHAR2(1)							,
	INVOICEABLE_ITEM_FLAG		VARCHAR2(1)							,
	SERIAL_CONTROL_ITEM_FLAG	VARCHAR2(1)							,
	LOT_CONTROL_ITEM_FLAG		VARCHAR2(1)							,
	LAYERED_COSTING_ITEM_FLAG	VARCHAR2(1)							,
	EXPENSE_ACCT				NUMBER(15)							,
	COGS_ACCT					NUMBER(15)							,
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15) 				DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15) 				DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15) 				DEFAULT 1			NOT NULL		
   );    

   	ALTER TABLE MTL_INVENTORY_ITEMS
	ADD CONSTRAINT MTL_INV_ITEM_INV_ORG_ID_FK FOREIGN KEY
	(
	  INVENTORY_ORGANIZATION_ID
	)
	REFERENCES INV_INVENTORY_ORGANIZATIONS
	(
	  INVENTORY_ORGANIZATION_ID
	)
	ENABLE;  

   	ALTER TABLE MTL_INVENTORY_ITEMS
	ADD CONSTRAINT MTL_INV_ITEM_UOM_ID_FK FOREIGN KEY
	(
	  UOM_ID
	)
	REFERENCES MTL_UNITS_OF_MEASURE
	(
	  UOM_ID
	)
	ENABLE; 

   	ALTER TABLE MTL_INVENTORY_ITEMS
	ADD CONSTRAINT MTL_INV_ITEM_ITEM_TYPE_ID_FK FOREIGN KEY
	(
	  ITEM_TYPE_ID
	)
	REFERENCES MTL_ITEM_TYPES
	(
	  ITEM_TYPE_ID
	)
	ENABLE; 	
   
   CREATE TABLE MTL_ITEM_CATEGORIES
   (	
	ITEM_CATEGORY_ID			NUMBER(15)					NOT NULL,
	INVENTORY_ITEM_ID		 	NUMBER(15) 					NOT NULL,
	INVENTORY_ORGANIZATION_ID	NUMBER(15) 					NOT NULL,
	CATEGORY_ID			 		NUMBER(15) 					NOT NULL,	
	CREATION_DATE 				DATE					DEFAULT SYSDATE		NOT NULL, 
	CREATED_BY 					NUMBER(15,0) 			DEFAULT 1			NOT NULL, 
	LAST_UPDATE_DATE 			DATE 					DEFAULT SYSDATE		NOT NULL, 
	LAST_UPDATED_BY 			NUMBER(15,0) 			DEFAULT 1			NOT NULL, 	
	LAST_UPDATE_LOGIN 			NUMBER(15,0) 			DEFAULT 1			NOT NULL,
	CONSTRAINT ITEM_CATEGORY_ID_PK PRIMARY KEY 
	  (
		ITEM_CATEGORY_ID
	  )
	  ENABLE		
   );   

   	ALTER TABLE MTL_ITEM_CATEGORIES	
	ADD CONSTRAINT MTL_ITEM_CATEGORIES_CK UNIQUE (INVENTORY_ITEM_ID,INVENTORY_ORGANIZATION_ID,CATEGORY_ID);
	
   	ALTER TABLE MTL_ITEM_CATEGORIES
	ADD CONSTRAINT MTL_ITEM_CAT_CATEGORY_ID_FK FOREIGN KEY
	(
	  CATEGORY_ID
	)
	REFERENCES MTL_CATEGORIES
	(
	  CATEGORY_ID
	)
	ENABLE;    	

   	ALTER TABLE MTL_ITEM_CATEGORIES
	ADD CONSTRAINT MTL_ITEM_CAT_INV_ORG_ID_FK FOREIGN KEY
	(
	  INVENTORY_ORGANIZATION_ID
	)
	REFERENCES INV_INVENTORY_ORGANIZATIONS
	(
	  INVENTORY_ORGANIZATION_ID
	)
	ENABLE; 
		