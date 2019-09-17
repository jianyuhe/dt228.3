--studnet number: D17124591
--studnent name: Jianyu He
--group members: D17125347 Minhui Chen and d16123951 Yuwei Chen


--find a customer hwo have no buy a phone
select customerName, address
from customer
where not exists(select * from contract);

--list all price of phone more then 600 and all sale process by carl
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where price >600
union
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where staffName = 'Carl';

--find retal is more then 50 and must is not sony
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where rental >50
minus
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where MANUFACTURER in 'Sony';

--find Samsung phone sale by Lee
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where staffName = 'Lee'
intersect
select staffName, contractName, customerName, dt2283group_f.phone.MANUFACTURER ,model, rental, price
from dt2283group_f.company c
join dt2283group_f.contract using(staffId)
join dt2283group_f.customer using(customerNo)
join dt2283group_f.phone  using(serialNo)
where MANUFACTURER = 'Samsung';

--culculate how much maney john cost to buy phone
select serialNo, phoneNo,manufacturer, sum(price), credit
from phone
group by serialNo, phoneNo,manufacturer, credit
having serialNo in (select serialNo from contract where customerNo in(
select customerNo from customer where customerName = 'John'));

--find all customer who have use usage
select customerName, usageId
from customer c
inner join usage u on c.customerNo = u.customerNo;

--find all customer and show null in usageId if someone dont have usage
select customerName, usageId
from customer c
left outer join usage u on c.customerNo = u.customerNo;

--only shows customer and usageId exist in both table like 'intersect'
select customerName, usageId
from customer c
LEFT SEMI JOIN usage using(customerNo);

--only shows customer and usageId not exist in both table
select customerName, usageId
from customer c
LEFT ANTI usage u on c.customerNo = u.customerNo;
