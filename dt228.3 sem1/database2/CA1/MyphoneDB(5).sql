--drop table
DROP TABLE RETURNSTORE;
DROP TABLE USAGE;
DROP TABLE CONTRACT;
DROP TABLE COMPANY;
DROP TABLE PHONE;
DROP TABLE CUSTOMER;

-- create table
CREATE TABLE Company
(	
	staffId		NUMBER(6) NOT NULL primary key,
	staffName	VARCHAR2(50) NOT NULL,
	departments 	VARCHAR2(50) NOT NULL ,
	duties		VARCHAR2(50)
);
CREATE TABLE Customer
(
	customerNo	NUMBER(7) NOT NULL PRIMARY KEY,
	CustomerName	VARCHAR2(50) NOT NULL,
	address			varchar2(50),
	email       VARCHAR2(30) NOT NULL UNIQUE,
	CHECK (email like '_%@%_' AND email like '_%.%_')
);
CREATE TABLE Phone
(
	serialNo 	VARCHAR2(10) NOT NULL PRIMARY KEY,
	phoneNo 	NUMBER(10) NOT NULL UNIQUE,
	manufacturer	VARCHAR2 (20) NOT NULL,
	model		VARCHAR2(20) NOT NULL,
	description VARCHAR2(50),
	price 		DECIMAL(6,2) NOT NULL,
	credit		DECIMAL(6,2) NOT NULL
);
CREATE TABLE Contract
(
	contractNo	NUMBER(6) NOT NULL PRIMARY KEY,
	contractName VARCHAR2(50) NOT NULL,
	initialCredit DECIMAL(6,2),
	negativeBalance DECIMAL(6,2),
	staffId		NUMBER(6) NOT NULL,
	customerNo	NUMBER(7) NOT NULL,
	serialNo 	VARCHAR2(10),
	phoneNo 	NUMBER(10) NOT NULL,
	rental		DECIMAL(6,2),
	FOREIGN KEY(staffId)	REFERENCES Company(staffId),
	FOREIGN KEY(serialNo)	REFERENCES Phone(serialNo),
    FOREIGN KEY(phoneNo)	REFERENCES Phone(phoneNo),
    FOREIGN KEY(customerNo)	REFERENCES Customer(customerNo)
);

CREATE TABLE Usage
(	
	usageId 	NUMBER(8) PRIMARY KEY,
	customerNo	NUMBER(7) NOT NULL,
	serialNo 	VARCHAR2(10) NOT NULL,
	chargeType	VARCHAR2 (50),
	PhoneAccess		NUMBER (10),
	provider 	VARCHAR2 (50),
	callType	VARCHAR2 (20),
	costPerUnit	DECIMAL(4,2),
	duration	INTEGER default 1,
	totalCost  	DECIMAL(6,2) NOT NULL,
	usageDate 		DATE,
	FOREIGN KEY(customerNo)	REFERENCES Customer(customerNo),
	FOREIGN KEY(serialNo)	REFERENCES Phone(serialNo),
	CONSTRAINT CHK_totalCost CHECK (totalCost = costPerUnit * duration)
);
CREATE TABLE ReturnStore
(
	storeNo NUMBER(7) PRIMARY KEY,
	storeAddress	varchar2(50),
	storePhone NUMBER(10),
	serialNo 	VARCHAR2(10),
	FOREIGN KEY(serialNo)	REFERENCES Phone(serialNo)
);
--insert company table data
insert into Company(staffId, staffName, departments, duties) values (001, 'Carl', 'sales representative', 'sale');
insert into Company(staffId, staffName, departments, duties) values (002, 'Lee', 'backroom sales', 'online sale');
insert into Company(staffId, staffName, departments, duties) values (003, 'Jim', 'billing', 'make a bill');
---insert customer table data
insert into Customer(customerNo, CustomerName, address, email) values (1234567, 'John', '38 Cranley Road,Fairview,Dublin', '1234567@gmail.com');
insert into Customer(customerNo, CustomerName, address, email) values (7654321, 'Chen', '14 hyde road, dalkey,Dublin', '7654321@gmail.com');
insert into Customer(customerNo, CustomerName, address, email) values (1234666, 'Peter', 'Apt 5 Clyde Road, Donnybrook, Dublin', '123466@gmail.com');
insert into Customer(customerNo, CustomerName, address, email) values (1333566, 'Joe', '15 Main St, City centre', '1333566@gmail.com');
--inerst phone table data
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('K46686542N', 0898834455, 'Nokia', 4499, 'red, 20GB, text and phone', 100, 5);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('K46686447N', 0898834674, 'Nokia', 4499, 'red, 20GB, text and phone', 100, 5);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('S15154541G', 0898425585, 'Samsung', 5211, 'gold, 120GB, text,video and phone', 800, 40);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('S15155255G', 0898424848, 'Samsung', 5211, 'gold, 120GB, text,video and phone', 800, 40);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('N12543584N', 0894125233, 'Sony', 3232, 'white, 80GB, text,video and phone', 600, 30);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('M52425555M', 0891234567, 'Motorola', 7859, 'black, 30GB, text and phone', 460, 23);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('K45287542N', 0871231234, 'Nokia', 6262, 'black, 60GB, text and phone', 400, 20);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('S15254541G', 0891112223, 'Samsung', 3521, 'blue, 120GB, text and phone', 880, 44);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('N62624512N', 0891113456, 'Sony', 1015, 'grey, 20GB, text and phone', 180, 9);
insert into Phone(serialNo, phoneNo, manufacturer, model, description, price, credit) values ('M52425455M', 0894414444, 'Motorola', 7859, 'white, 30GB, text and phone', 500, 25);
--inerst contract table data
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (584658, 'Buy Phone', 30, 30, 001, 1234666,'N12543584N', 0894125233, 30);
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (123456, 'Buy Phone', 40, 40, 001, 1333566,'S15154541G', 0898425585, 50);
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (651421, 'Buy Phone', 44, 44, 002, 7654321,'S15254541G', 0891112223, 55);
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (651471, 'Buy Phone', 40, 40, 002, 7654321,'S15155255G', 0898424848, 40);
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (352158, 'Buy Phone', 23, 23, 002, 1234567,'M52425455M', 0894414444, 20);
insert into Contract(contractNo, contractName, initialCredit, negativeBalance, staffId, customerNo,serialNo, phoneNo, rental) values (352188, 'Buy Phone', 9, 9, 001, 1234567,'N62624512N', 0891113456, 5);

--inser usage table data
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (84531234, 1234666, 'N12543584N', 'phone', 0892525252, 'landline', 'voice',0.13, 4, 0.52, '11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (84531235, 1234666, 'N12543584N', 'Message', 0893337777, 'myphone', 'text', 0.1, 1, 0.1,'11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (84531236, 1234666, 'N12543584N', 'Message', 0872224444, 'vodaphone', 'text', 0.4, 1, 0.4,'12-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (84531237, 1234666, 'N12543584N', 'Application', NULL, 'Netfilx', NULL, 10, 1, 10, '13-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (35254184, 1234567, 'M52425455M', 'Message', 0842152541, 'myphone', 'text', 0.1, 1, 0.1, '10-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (35254186, 1234567, 'N62624512N', 'Message', 0842152851, 'myphone', 'voice', 0.5, 1, 0.5, '11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (35254177, 1234567, 'M52425455M', 'phone', 0842152541, 'landline', 'voice', 0.13, 20, 2.6, '12-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (35258888, 7654321, 'S15254541G', 'phone', 0842525255, 'vodaphone', 'voice', 0.5, 20, 10, '08-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeType, PhoneAccess, provider,callType, costPerUnit, duration,totalCost,usageDate) 
values (35258999, 7654321, 'S15254541G', 'phone', 0842525255, 'vodaphone', 'voice', 0.5, 8, 4, '11-Nov-2018');

--insert returnstore data
insert into ReturnStore(storeNo, storeAddress, storePhone, serialNo) values (7777777, '01 Main Street, city center', 0836664444, 'M52425555M');

--alter session set current_schema = dt2283group_f;
--alter session set current_schema = mchen;
--grant all privileges on company to hejianyu;


-----pl/sql
SET SERVEROUTPUT ON
DECLARE
    V_SID Company.staffId%TYPE:='&Staff_Id';
    V_SName Company.staffname%TYPE:='&Staff_Name';
    V_SDep Company.departments%TYPE:='&Staff_Department';
    V_SDuties Company.duties%TYPE:='&Staff_Duties';
    V_Scapacity INTEGER := 6;
    V_SNo INTEGER := 0;
BEGIN
    SELECT count(staffid)INTO v_SNo FROM Company;
    If V_SNo < V_Scapacity THEN
    INSERT INTO Company(staffId, staffname, departments, duties)
    VALUES (V_SID,V_SName,V_SDep,V_SDuties);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('new staff id is '||V_SID||' and name is '||V_SName||'.');
    ELSE
    DBMS_OUTPUT.PUT_LINE('We have enough employees.');
    END IF;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;
---SQL