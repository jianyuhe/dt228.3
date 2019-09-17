DROP TABLE Corder CASCADE CONSTRAINTS PURGE;
DROP TABLE CorderLine CASCADE CONSTRAINTS PURGE;
DROP TABLE Stock CASCADE CONSTRAINTS PURGE;
DROP TABLE Sorder CASCADE CONSTRAINTS PURGE;
DROP TABLE SorderLine CASCADE CONSTRAINTS PURGE;
DROP TABLE Supplier CASCADE CONSTRAINTS PURGE;
DROP TABLE Staff CASCADE CONSTRAINTS PURGE;
DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

create table Corder
{
  corderNo number(7);
  corderDate date;
  customerId number(7);
  staffId number(7);
  staffIssued number(7);
};

create table CorderLine
{
  quantityRequired number(8);
  corderNo number(7);
  stockCode char is byte;
};


select stockCode, descriptions
from Stock
where unitPrice < unitCostPrice;

select stockCode, descriptions
from Stock
where reorderLevel > 0;

select customerName
from Customer
join Corder using (customerId)
group by customerName   
having Customer.customerId <> Corder.customerId;
