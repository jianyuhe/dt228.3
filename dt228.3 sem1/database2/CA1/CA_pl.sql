--studnet number: D17124591
--studnent name: Jianyu He
--group members: D17125347 Minhui Chen and d16123951 Yuwei Chen
-----pl/sql

--pl/sql for insert data into company
DECLARE
  V_sid dt2283group_f.Company.staffId%TYPE:='&staffId'; 
  V_sname dt2283group_f.Company.staffName%TYPE:='&staffName'; 
  V_dep dt2283group_f.Company.departments%TYPE:='&departments'; 
  V_dut dt2283group_f.Company.duties%TYPE:='&duties';
BEGIN
if (V_dep = 'sales representative') or (V_dep = 'backroom sales') or (V_dep = 'billing') then
  insert into dt2283group_f.Company(staffId, staffName, departments, duties) values (V_sid, V_sname, V_dep, V_dut);
commit;
DBMS_OUTPUT.PUT_LINE('insert staff id: '||V_sid||', staff name: '||V_sname||', department: ' ||V_dep||' and duties: '||V_dut||' into Company');
else
DBMS_OUTPUT.PUT_LINE('Please insert correct department');
END if;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;


--pl/sql for delete data from company
DECLARE
  V_sid dt2283group_f.Company.staffId%TYPE:='&staffId'; 
  V_sname dt2283group_f.Company.staffName%TYPE:='&staffName'; 
BEGIN
  delete from dt2283group_f.Company where staffId = V_sid or staffName = V_sname;
  
commit;
DBMS_OUTPUT.PUT_LINE('delete staff ' || V_sname);
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;

--update data for company
DECLARE
  V_sid dt2283group_f.Company.staffId%TYPE:='&staffId';
  V_sname dt2283group_f.Company.staffName%TYPE:='&staffName'; 
  V_dep dt2283group_f.Company.departments%TYPE:='&departments';
  V_dut dt2283group_f.Company.duties%TYPE:='&duties';
BEGIN
if (V_dep = 'sales representative') or (V_dep = 'backroom sales') or (V_dep = 'billing') then
  update dt2283group_f.Company set staffName = V_sname, departments = V_dep, duties = V_dut where staffId = V_sid;
commit;
DBMS_OUTPUT.PUT_LINE('update staff id: '||V_sid||'to staff name: '||V_sname||', department: ' ||V_dep||' and duties: '||V_dut||' into Company');
else
DBMS_OUTPUT.PUT_LINE('Please insert correct department');
END if;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;

select * from dt2283group_f.Company;


