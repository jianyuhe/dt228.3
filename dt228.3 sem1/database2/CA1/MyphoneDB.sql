
-----pl/sql


---SQL
DECLARE
  V_sid Company.staffId%TYPE:='&staffId'; -- accept client firstname
  V_sname Company.staffName%TYPE:='&staffName'; -- accept client lastname
  V_dep Company.departments%TYPE:='&departments'; -- accept Account number
  V_dut Company.duties%TYPE:='&duties';
BEGIN
if (V_dep = 'sales representative') or (V_dep = 'backroom sales') or (V_dep = 'billing') then
  insert into Company(staffId, staffName, departments, duties) values (V_sid, V_sname, V_dep, V_dut);
commit;
DBMS_OUTPUT.PUT_LINE('insert staff id: '||V_sid||', staff name: '||V_sname||', department: ' ||V_dep||' and duties: '||V_dut||' into company');
else
DBMS_OUTPUT.PUT_LINE('Please insert correct department');
END if;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;

DECLARE
  V_sid Company.staffId%TYPE:='&staffId'; -- accept client firstname
  V_sname Company.staffName%TYPE:='&staffName'; -- accept client lastname
BEGIN
  delete from Company where staffId = V_sid or staffName = V_sname;
  
commit;
DBMS_OUTPUT.PUT_LINE('delete staff ' || V_sname);
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;

DECLARE
  V_sid Company.staffId%TYPE:='&staffId'; -- accept client firstname
  V_sname Company.staffName%TYPE:='&staffName'; -- accept client lastname
  V_dep Company.departments%TYPE:='&departments'; -- accept Account number
  V_dut Company.duties%TYPE:='&duties';
BEGIN
if (V_dep = 'sales representative') or (V_dep = 'backroom sales') or (V_dep = 'billing') then
  update Company set staffName = V_sname, departments = V_dep, duties = V_dut where staffId = V_sid;
commit;
DBMS_OUTPUT.PUT_LINE('update staff id: '||V_sid||'to staff name: '||V_sname||', department: ' ||V_dep||' and duties: '||V_dut||' into company');
else
DBMS_OUTPUT.PUT_LINE('Please insert correct department');
END if;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;

select * from company;

