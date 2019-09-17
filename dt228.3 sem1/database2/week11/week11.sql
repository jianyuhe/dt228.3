SET SERVEROUTPUT ON
DECLARE

  CURSOR love IS
    select L_ID from musiclover
join downloaded d using(L_ID)
group by L_ID
having count(T_ID) <> (select count(T_ID) from MUSICTRACK);


  vl musiclover.L_ID%type;
  vt     musictrack.T_ID%type;
  BEGIN
  SELECT T_ID INTO vt FROM musictrack;

  OPEN love;
  LOOP
  FETCH love INTO vl;
  EXIT WHEN love%notfound;
  INSERT INTO downloaded VALUES(vt, vl, SYSDATE);
  END LOOP;
  CLOSE love;
  commit;
  EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('This viewer does not exist.');
  ROLLBACK WORK;
WHEN DUP_VAL_ON_INDEX THEN
  DBMS_OUTPUT.PUT_LINE('A viewer was found that already watches crime - the operation has failed.');
  ROLLBACK WORK;
WHEN  OTHERS THEN
  DBMS_OUTPUT.PUT_LINE ('The error '||SQLCODE||' has occurred.'||' meaning '||SQLERRM||'.');
  ROLLBACK WORK;
END;
  

