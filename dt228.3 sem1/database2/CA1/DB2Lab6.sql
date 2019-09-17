SELECT * FROM client;
SELECT * FROM hasaccount;
--
DECLARE
  V_CFN Client.cfname%TYPE:='&Client_firstname'; -- accept client firstname
  V_CLN Client.clname%TYPE:='&Client_lastname'; -- accept client lastname
  V_ACN HasAccount.accno%TYPE:='&Account_no'; -- accept Account number
  V_CID Client.clientid%TYPE;
  V_CountAcc  INTEGER := 0;
BEGIN
 --SELECT clientid INTO V_CID FROM Client WHERE clname = V_CLN;
 --DBMS_OUTPUT.PUT_LINE('The Client Lastname is '||V_CLN||' and Client id is '||V_CID||'.');
 --4
 --V_CID := clientseq.nextVal;
 --INSERT INTO Client (clientid, cfname, clname)VALUES(V_CID, V_CFN, V_CLN);
 --COMMIT;
 --DBMS_OUTPUT.PUT_LINE('The new Client id is '||V_CID||' and Client firstname is '||V_CFN||' lastname is'||V_CLN||'.');
----
    SELECT Count(*) INTO V_CountAcc FROM HasAccount
    Join Client USING(Clientid)
    WHERE clientid = (SELECT clientid FROM Client WHERE V_CFN =cfname AND V_CLN = clname)
    AND V_ACN = accno;
    SELECT clientid INTO V_CID FROM Client
    WHERE V_CFN =cfname AND V_CLN = clname;
    if V_CountAcc = 0 THEN
    INSERT INTO ACCOUNT(accno)VALUES(V_ACN);
    INSERT INTO HasAccount (clientid, accno)VALUES(V_CID, V_ACN);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('The client id '||V_CID||' and account no is '||V_ACN||'.');
    ELSE
    DBMS_OUTPUT.PUT_LINE('The client already joined');
    END IF;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
  ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;
