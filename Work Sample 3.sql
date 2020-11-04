CREATE TABLE dept2
(deptid NUMBER(2),
 dname VARCHAR2(20) NOT NULL,
 fax VARCHAR2(12),
 CONSTRAINT dept2_deptid_pk PRIMARY KEY (deptid),
 CONSTRAINT dept2_dname_uk UNIQUE (dname));
 
 CREATE TABLE etypes2
 (etypeid NUMBER(2),
  etypename VARCHAR2(30) NOT NULL,
  CONSTRAINT etypes2_etypeid_pk PRIMARY KEY (etypeid),
  CONSTRAINT etypes2_etypename_uk UNIQUE (etypename));
  
CREATE TABLE equip2
 (equipid NUMBER(3),
  edesc VARCHAR2(30),
  purchdate DATE,
  rating CHAR(1),
  deptid NUMBER(2) NOT NULL,
  etypeid NUMBER(2),
  CONSTRAINT equip2_equipid_pk PRIMARY KEY (equipid),
  CONSTRAINT equip2_deptid_fk FOREIGN KEY (deptid)
    REFERENCES dept2 (deptid),
  CONSTRAINT equip2_etypeid_fk FOREIGN KEY (etypeid)
    REFERENCES etypes2 (etypeid),
  CONSTRAINT equip2_rating_ck CHECK (rating IN ('A', 'B', 'C'))
 );
 
 ALTER TABLE equip2
 ENABLE CONSTRAINT equip2_rating_ck;
 
 ALTER TABLE equip2
 DROP CONSTRAINT equip2_rating_ck;
 
 SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'EQUIP2';
 
 ALTER TABLE dept2
 DROP PRIMARY KEY CASCADE;
 
 DESC acctmanager;
 
SELECT * FROM acctmanager;
 
INSERT INTO acctmanager
  VALUES ('T500', 'NICK', 'TAYLOR', '05-SEP-09', 42000, 3500, 'NE');

ALTER TABLE acctmanager
DROP COLUMN amearn;

INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
  VALUES ('J500', 'Sammie', 'Jones', 39500, 2000, 'NW');

SELECT column_name, data_type, data_default, default_on_null
FROM user_tab_columns
WHERE table_name = 'ACCTMANAGER';

INSERT INTO acctmanager
  VALUES ('L500', 'MANDY', 'LOPEZ', '01-OCT-2009', 47000, 1500, NULL);

DELETE FROM acctmanager
WHERE amid = 'J500';

ALTER TABLE acctmanager
MODIFY (amsal default 0);

ALTER TABLE acctmanager
MODIFY (amsal DEFAULT ON NULL 0);

INSERT INTO acctmanager
  VALUES ('J500', 'SAMMIE', 'JONES', NULL, NULL, 2000, 'NW');

INSERT INTO acctmanager
  VALUES ('M500', 'PEG', 'O''HARA', DEFAULT, 46000, 2000, 'SW');

CREATE TABLE books3
AS (SELECT *
    FROM books);

INSERT INTO acctbonus 
SELECT amid, amsal, region
FROM acctmanager;


DESC acctbonus;

UPDATE acctmanager
SET amedate = '01-AUG-09'
WHERE amid = 'J500';


UPDATE acctmanager
SET amedate = '10-OCT-09',
    region = 'S'
WHERE amid = 'L500';    

UPDATE customers1
SET region = '&REGION'
WHERE state = '&STATE';


DELETE FROM acctmanager
WHERE amid ='J500';



UPDATE acctmanager
SET region = 'E'
WHERE amid = 'M500';

COMMIT;

UPDATE acctmanager
SET region = 'E'
WHERE amid = 'T500';

UPDATE acctmanager
SET region = 'E'
WHERE amid = 'L500';

SAVEPOINT ONE;

UPDATE acctmanager
SET amcomm = 6600
WHERE amid = 'T500';

SELECT * FROM acctmanager;

ROLLBACK TO ONE;

ROLLBACK;


