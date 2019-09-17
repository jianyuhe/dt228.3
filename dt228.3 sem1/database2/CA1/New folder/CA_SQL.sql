--studnet number: D17125347
--studnent name: Minhui Chen
---SQL
--select customername which provider is vodaphone and myphone use UNION
SELECT customername FROM dt2283group_f.Customer
WHERE customerno IN(SELECT customerno FROM dt2283group_f.Usage WHERE provider like 'vodaphone')
UNION
SELECT customername FROM dt2283group_f.Customer
WHERE customerno IN(SELECT customerno FROM dt2283group_f.Usage WHERE provider like 'myphone');
--select customername which provider is vodaphone and not provide by myphone use MINUS
SELECT customername FROM dt2283group_f.Customer
WHERE customerno IN(SELECT customerno FROM dt2283group_f.Usage WHERE provider like 'vodaphone')
MINUS
SELECT customername FROM dt2283group_f.Customer
WHERE customerno IN(SELECT customerno FROM dt2283group_f.Usage WHERE provider like 'myphone');
--select staff to check how many phone they sale
SELECT staffname,departments,count(staffname) AS sale FROM dt2283group_f.Company
INNER JOIN dt2283group_f.Contract ON Company.staffId = Contract.staffId
WHERE contractname like 'Buy Phone'
GROUP BY staffname,departments;
--To find the customer which have all way of usage for phone
SELECT * FROM dt2283group_f.Customer C WHERE NOT EXISTS
(SELECT * FROM dt2283group_f.chargetype T WHERE NOT EXISTS
(SELECT * FROM dt2283group_f.Usage U WHERE U.customerno = C.customerno
AND U.chargetypeid = T.chargetypeid));
--make a view to store customer Peter useage and calculate the each usage total cost
CREATE OR REPLACE VIEW dt2283group_f.PeterUsage AS
SELECT customername,phoneno,chargetypedesc,phoneaccess,provider,calltype,costperunit,duration,costperunit*duration AS totalcost,usagedate 
FROM dt2283group_f.Usage U
JOIN dt2283group_f.Customer C USING(customerno) 
JOIN dt2283group_f.Phone P    USING(serialno)
JOIN dt2283group_f.ChargeType T USING(chargetypeid)
WHERE customerno = 1234666;
SELECT * FROM dt2283group_f.PeterUsage;
SELECT sum(totalcost) FROM dt2283group_f.PeterUsage;