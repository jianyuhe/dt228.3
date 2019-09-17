SET SERVEROUTPUT ON
DECLARE
V_SNEE SSTUDENT.SNAME%TYPE:='&student_name';
V_SNO SSTUDENT.SNO%TYPE:='&student_number';
BEGIN
DBMS_OUTPUT.PUT.LINE('STUDENT NAME' || V_SNEE);
END;

create sequence studentseq
start with 10000
increment by 1;
