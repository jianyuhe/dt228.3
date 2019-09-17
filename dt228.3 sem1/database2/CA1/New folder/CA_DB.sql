--studnet number: D17125347
--studnent name: Minhui Chen
--drop table
DROP TABLE RETURNSTORE;
DROP TABLE USAGE;
DROP TABLE ChargeType;
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
CREATE TABLE ChargeType
(	
	chargeTypeId		NUMBER(7) NOT NULL primary key,
	chargeTypeDesc		VARCHAR2(50)
);
CREATE TABLE Usage
(	
	usageId 	NUMBER(8) PRIMARY KEY,
	customerNo	NUMBER(7) NOT NULL,
	serialNo 	VARCHAR2(10) NOT NULL,
	chargeTypeId	NUMBER(7) NOT NULL,
	PhoneAccess		NUMBER (10),
	provider 	VARCHAR2 (50),
	callType	VARCHAR2 (20),
	costPerUnit	DECIMAL(4,2),
	duration	INTEGER default 1,
	usageDate 		DATE,
	FOREIGN KEY(customerNo)	REFERENCES Customer(customerNo),
	FOREIGN KEY(serialNo)	REFERENCES Phone(serialNo),
	FOREIGN KEY(chargeTypeId)	REFERENCES ChargeType(chargeTypeId)
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
insert into Company(staffId, staffName, departments, duties) values (004, 'Gee', 'sales representative', 'sale');
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
-- insert usage table data
insert into chargeType(chargeTypeId,chargeTypeDesc)values(1,'Phone');
insert into chargeType(chargeTypeId,chargeTypeDesc)values(2,'Message');
insert into chargeType(chargeTypeId,chargeTypeDesc)values(3,'Application');
--inser usage table data
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (84531234, 1234666, 'N12543584N', 1, 0892525252, 'landline', 'voice',0.13, 4, '11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (84531235, 1234666, 'N12543584N', 2, 0893337777, 'myphone', 'text', 0.1, 1, '11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (84531236, 1234666, 'N12543584N', 2, 0872224444, 'vodaphone', 'text', 0.4, 1, '12-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (84531237, 1234666, 'N12543584N', 3, NULL, 'Netfilx', NULL, 10, 1, '13-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (35254184, 1234567, 'M52425455M', 2, 0842152541, 'myphone', 'text', 0.1, 1, '10-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (35254186, 1234567, 'N62624512N', 2, 0842152851, 'myphone', 'voice', 0.5, 1, '11-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (35254177, 1234567, 'M52425455M', 1, 0842152541, 'landline', 'voice', 0.13, 20, '12-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (35258888, 7654321, 'S15254541G', 1, 0842525255, 'vodaphone', 'voice', 0.5, 20, '08-Nov-2018');
insert into Usage(usageId, customerNo, serialNo, chargeTypeId, PhoneAccess, provider,callType, costPerUnit, duration,usageDate) 
values (35258999, 7654321, 'S15254541G', 1, 0842525255, 'vodaphone', 'voice', 0.5, 8, '11-Nov-2018');
--insert returnstore data
insert into ReturnStore(storeNo, storeAddress, storePhone, serialNo) values (7777777, '01 Main Street, city center', 0836664444, 'M52425555M');

--grant all privileges on company to hejianyu;
grant select,insert,delete on Company to mchen;;
grant select on Customer to mchen;
grant select on Contract to mchen;
grant select on Usage to mchen;
grant select on ChargeType to mchen;
grant select on Phone to mchen;
alter session set current_schema = mchen;
--alter session set current_schema = dt2283group_f;






