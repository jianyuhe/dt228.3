DECLARE
  V_sid mchen.Company.staffId%TYPE:='&staffId'; -- accept client firstname
  V_sname mchen.Company.staffName%TYPE:='&staffName'; -- accept client lastname
  V_dep mchen.Company.departments%TYPE:='&departments'; -- accept Account number
  V_dut mchen.Company.duties%TYPE:='&duties';
BEGIN
  insert into mchen.Company(staffId, staffName, departments, duties) values (V_sid, V_sname, V_dep, V_dut);
commit;
DBMS_OUTPUT.PUT_LINE('insert staff id '||V_sid||', staff name '||V_sname||', department' ||V_dep||' and duties '||V_dut||' into company');
END;

DECLARE
  V_sid mchen.Company.staffId%TYPE:='&staffId'; -- accept client firstname
  V_sname mchen.Company.staffName%TYPE:='&staffName'; -- accept client lastname

BEGIN
  delete from mchen.Company where staffId = V_sid or staffName = V_Sname;
commit;
END;

select * from mchen.company;

