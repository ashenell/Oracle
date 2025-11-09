SET SERVEROUTPUT ON;

DECLARE
v_algus DATE;
v_lopp DATE;
v_kokku INTEGER;
BEGIN
FOR y IN 1999..2003 LOOP
FOR m IN 1..12 LOOP
v_algus := TO_DATE(y || LPAD(m,2,'0') || '01','YYYYMMDD');
v_lopp := LAST_DAY(v_algus);
SELECT COUNT(*)
INTO v_kokku
FROM lepikult.kandidaadid k
WHERE TO_DATE(SUBSTR(TRIM(k.id),2,6),'RRMMDD')
BETWEEN v_algus AND v_lopp;
DBMS_OUTPUT.PUT_LINE( y || '. a. ' || m || '. kuus on sündinud ' ||
v_kokku || CASE WHEN v_kokku = 1 THEN ' kandidaat.' ELSE ' kandidaati.' 
END);
END LOOP;
END LOOP;
END;
/

--tulemus

1999. a. 1. kuus on sündinud 1 kandidaat.
1999. a. 2. kuus on sündinud 1 kandidaat.
1999. a. 3. kuus on sündinud 0 kandidaati.
1999. a. 4. kuus on sündinud 0 kandidaati.
1999. a. 5. kuus on sündinud 0 kandidaati.
1999. a. 6. kuus on sündinud 1 kandidaat.
1999. a. 7. kuus on sündinud 0 kandidaati.
1999. a. 8. kuus on sündinud 1 kandidaat.
1999. a. 9. kuus on sündinud 1 kandidaat.
1999. a. 10. kuus on sündinud 0 kandidaati.
1999. a. 11. kuus on sündinud 1 kandidaat.
1999. a. 12. kuus on sündinud 1 kandidaat.
2000. a. 1. kuus on sündinud 0 kandidaati.
2000. a. 2. kuus on sündinud 2 kandidaati.
2000. a. 3. kuus on sündinud 0 kandidaati.
2000. a. 4. kuus on sündinud 2 kandidaati.
2000. a. 5. kuus on sündinud 0 kandidaati.
2000. a. 6. kuus on sündinud 0 kandidaati.
2000. a. 7. kuus on sündinud 1 kandidaat.
2000. a. 8. kuus on sündinud 1 kandidaat.
2000. a. 9. kuus on sündinud 0 kandidaati.
2000. a. 10. kuus on sündinud 0 kandidaati.
2000. a. 11. kuus on sündinud 1 kandidaat.
2000. a. 12. kuus on sündinud 4 kandidaati.
2001. a. 1. kuus on sündinud 2 kandidaati.
2001. a. 2. kuus on sündinud 0 kandidaati.
2001. a. 3. kuus on sündinud 1 kandidaat.
2001. a. 4. kuus on sündinud 2 kandidaati.
2001. a. 5. kuus on sündinud 1 kandidaat.
2001. a. 6. kuus on sündinud 12 kandidaati.
2001. a. 7. kuus on sündinud 2 kandidaati.
2001. a. 8. kuus on sündinud 3 kandidaati.
2001. a. 9. kuus on sündinud 4 kandidaati.
2001. a. 10. kuus on sündinud 2 kandidaati.
2001. a. 11. kuus on sündinud 6 kandidaati.
2001. a. 12. kuus on sündinud 9 kandidaati.
2002. a. 1. kuus on sündinud 9 kandidaati.
2002. a. 2. kuus on sündinud 3 kandidaati.
2002. a. 3. kuus on sündinud 10 kandidaati.
2002. a. 4. kuus on sündinud 9 kandidaati.
2002. a. 5. kuus on sündinud 9 kandidaati.
2002. a. 6. kuus on sündinud 16 kandidaati.
2002. a. 7. kuus on sündinud 9 kandidaati.
2002. a. 8. kuus on sündinud 15 kandidaati.
2002. a. 9. kuus on sündinud 14 kandidaati.
2002. a. 10. kuus on sündinud 5 kandidaati.
2002. a. 11. kuus on sündinud 6 kandidaati.
2002. a. 12. kuus on sündinud 6 kandidaati.
2003. a. 1. kuus on sündinud 2 kandidaati.
2003. a. 2. kuus on sündinud 4 kandidaati.
2003. a. 3. kuus on sündinud 2 kandidaati.
2003. a. 4. kuus on sündinud 2 kandidaati.
2003. a. 5. kuus on sündinud 1 kandidaat.
2003. a. 6. kuus on sündinud 2 kandidaati.
2003. a. 7. kuus on sündinud 0 kandidaati.
2003. a. 8. kuus on sündinud 0 kandidaati.
2003. a. 9. kuus on sündinud 0 kandidaati.
2003. a. 10. kuus on sündinud 1 kandidaat.
2003. a. 11. kuus on sündinud 0 kandidaati.
2003. a. 12. kuus on sündinud 0 kandidaati.

ACCEPT p_id PROMPT 'Isikukood: '
ACCEPT p_eesnimi PROMPT 'Eesnimi: '
ACCEPT p_perenimi PROMPT 'Perenimi: '
ACCEPT p_matemaatika PROMPT 'Matemaatika eksami tulemus(0-100): '
ACCEPT p_voorkeel PROMPT 'Võõrkeele eksmai tulemus (0-100): '
ACCEPT p_emakeel PROMPT 'Emakeele eksami tulemus (0-100): '

SET SERVEROUTPUT ON

DECLARE
v_id VARCHAR2(20) := TRIM('&p_id');
v_eesnimi VARCHAR2(100) := TRIM('&p_eesnimi');
v_perenimi VARCHAR2(100) := TRIM('&p_perenimi');
v_matemaatika NUMBER := &p_matemaatika;
v_voorkeel NUMBER := &p_voorkeel;
v_emakeel NUMBER := &p_emakeel;
v_kokku NUMBER;
c CHAR(1);
invalid BOOLEAN := FALSE;
BEGIN
--Kontrollime ID piikust
IF LENGTH(v_id) <> 11 THEN
DBMS_OUTPUT.PUT_LINE('VIGA: ID peab olema täpselt 11 numbrit.');
RETURN;
END IF;

--Kontrollime ID, et sisaldaks vaid numbreid. 
FOR i IN 1..LENGTH(v_id) LOOP
c := SUBSTR(v_id, i, 1);
IF c NOT IN ('0','1','2','3','4','5','6','7','8','9') THEN
DBMS_OUTPUT.PUT_LINE(i||'. sümbol '''||c||''' ei ole number');
invalid := TRUE;
END IF;
END LOOP;
IF invalid THEN
DBMS_OUTPUT.PUT_LINE('VIGA: Isikukood tohib sisaldada ainult numbreid.');
RETURN;
END IF;

--Kontrollime, et juba ei eksisteeriks
SELECT COUNT(*) INTO v_kokku
FROM kandidaadid
WHERE id = v_id;
IF v_kokku > 0 THEN
DBMS_OUTPUT.PUT_LINE('VIGA: sellise isikukoodiga kandidaat on juba olemas.');
RETURN;
END IF;

--Eksami tulemus on täisarv ja jääb vahemikku 0-100
IF v_matemaatika != TRUNC(v_matemaatika) OR v_voorkeel != TRUNC(v_voorkeel) OR v_emakeel != TRUNC(v_emakeel)
OR v_matemaatika < 0 OR v_matemaatika > 100 OR v_voorkeel < 0 OR v_voorkeel > 100 OR v_emakeel < 0 OR v_emakeel > 100 THEN
DBMS_OUTPUT.PUT_LINE('VIGA: eksamitulemused peavad olema täisarvud ja vahemikus 0-100.');
RETURN;
END IF;

INSERT INTO kandidaadid (id, eesnimi, perenimi, matemaatika, voorkeel, emakeel)
VALUES (v_id, v_eesnimi, v_perenimi, v_matemaatika, v_voorkeel, v_emakeel);
DBMS_OUTPUT.PUT_LINE('OK: kandidaat lisatud.');
END;
/


select * FROM kandidaadid WHERE id = 39928224332;
id          eesnimi     perenimi    matemaatika     voorkeel    emakeel
39928224332	Jaan	    Kuri	    93	            49	        79