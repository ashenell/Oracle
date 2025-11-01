SET ECHO OFF
SET VERIFY OFF
SET FEEDBACK OFF
SET HEADING ON
SET PAGESIZE 24
SET LINESIZE 200
SET TERMOUT OFF

ACCEPT p_osa CHAR PROMPT 'Sisestage õppeaine nimetus: '

COLUMN c_aine NEW_VALUE v_aine NOPRINT
COLUMN c_oppejoud NEW_VALUE v_lektor NOPRINT
REM

SELECT o.nimetus AS c_aine, o.oppejoud AS c_oppejoud
FROM lepikult.oppeained o
WHERE UPPER(o.nimetus) LIKE UPPER('&p_osa%');

TTITLE LEFT 'Aine: ' v_aine
BTITLE LEFT 'Õppejõud: ' v_lektor

COLUMN nimi HEADING 'Nimi' FORMAT A28
COLUMN too_nr  HEADING 'Ülesanne'
COLUMN punktid HEADING 'Punktid'
COLUMN kuupaev HEADING 'Kuupäev'

BREAK ON nimi
REM
SELECT y.perenimi || ', ' || y.eesnimi AS nimi, k.too_nr, k.punktid, TO_CHAR(k.kuupaev,'DD.MM.YYYY') AS kuupaev
FROM lepikult.yliopilased  y, lepikult.koduylesanded k, lepikult.oppeained o
WHERE  k.yliopilane = y.id
AND k.oppeaine = o.kood
AND UPPER(o.nimetus) LIKE UPPER('&p_osa%')
ORDER  BY nimi, k.too_nr;

SPOOL OFF
SET TERMOUT ON
TTITLE OFF
BTITLE OFF
CLEAR BREAKS
CLEAR COLUMNS
SET FEEDBACK ON
SET VERIFY ON




--tulemuse

Nimi                           Ülesanne    Punktid Kuupäev
---------------------------- ---------- ---------- ------------------------------
Kask, Katrin			            1 	        5 10.09.2025
                                    1 	        7 11.09.2025
				                    2 	        7 12.09.2025
				                    3 	        6 13.09.2025
Kuusk, Tarmo			            1 	       10 06.09.2025
				                    2 	        8 08.09.2025
Pihlakas, Virgo 		            1 	        6 01.09.2025
Sarapuu, Sirje			            1 	        4 09.09.2025
				                    2 	        6 17.09.2025
				                    2 	        3 11.09.2025









Õppejõud: Toomas Lepikult