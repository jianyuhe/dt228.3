
DROP TABLE CCLUB;
DROP TABLE p_student;
CREATE TABLE p_student (
  prog_code CHAR(9) primary key,
  stage_code varchar2(50),
 studentname CHAR(10),
 studentaddress CHAr(20),
 studentno varchar2(6));
CREATE TABLE CCLUB (
  CLUBID CHAR(8) PRIMARY KEY,
  CNAME VARCHAR2(40),
  CLUBTYPE VARCHAR2(15) CHECK (CLUBTYPE IN ('SPORT','SCIENCE','ARTS','OTHER')),
  CAMPUS VARCHAR2(20) CHECK (CAMPUS IN ('Kevin Street','Aungier Street','Bolton Street','Rathmines')));
  
