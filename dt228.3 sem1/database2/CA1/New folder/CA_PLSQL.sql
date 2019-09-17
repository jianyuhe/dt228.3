--studnet number: D17125347
--studnent name: Minhui Chen
-----pl/sql
SET serveroutput ON FORMAT wrapped;
DECLARE
    V_SID dt2283group_f.Company.staffId%TYPE:='&Staff_Id';
    V_SName dt2283group_f.Company.staffname%TYPE:='&Staff_Name';
    V_SDep dt2283group_f.Company.departments%TYPE:='&Staff_Department';
    V_SDuties dt2283group_f.Company.duties%TYPE:='&Staff_Duties';
    V_Scapacity INTEGER := 6;
    V_SNo INTEGER := 0;
BEGIN
    SELECT count(staffid)INTO v_SNo FROM dt2283group_f.Company;
    If V_SNo < V_Scapacity THEN
    INSERT INTO dt2283group_f.Company(staffId, staffname, departments, duties)
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