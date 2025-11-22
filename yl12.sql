create table uus_koduylesanded as SELECT * FROM lepikult.koduylesanded;

SET SERVEROUTPUT ON;

DECLARE CURSOR ylesanded IS
SELECT id FROM uus_koduylesanded k where k.punktid < (
select MAX(u.punktid) from uus_koduylesanded u
where u.yliopilane = k.yliopilane and
u.oppeaine = k.oppeaine and
u.too_nr = k.too_nr);
begin
FOR row in ylesanded LOOP
DELETE FROM uus_koduylesanded where id = row.id;
END LOOP;
END;
/

--tulemus

"ID"	"YLIOPILANE"	"OPPEAINE"	"TOO_NR"	"PUNKTID"	"FAILINIMI"	    "KUUPAEV"
2	    "60410020314"	"ICA0016"	1	        7	        "fail2.txt"	    11-SEP-25
3	    "60410020314"	"ICA0016"	2	        7	        "fail3.txt"	    12-SEP-25
4	    "60410020314"	"ICA0016"	3	        6	        "fail4.txt"	    13-SEP-25
5	    "60410020314"	"ICA0092"	1	        6	        "fail5.txt"	    02-SEP-25
6	    "60410020314"	"ICA0092"	2	        7	        "fail7.txt"	    03-SEP-25
7	    "60410020314"	"ICA0080"	2	        7	        "fail8.txt"	    07-SEP-25
8	    "60410020314"	"ICA0077"	1	        10	        "fail9.txt"	    07-SEP-25
9	    "50512200906"	"ICA0016"	1	        10	        "fail10.txt"	06-SEP-25
10	    "50512200906"	"ICA0016"	2       	8	        "fail11.txt"	08-SEP-25
11	    "50512200906"	"ICA0092"	1       	4	        "fail13.txt"	07-SEP-25
12	    "60206301174"	"ICA0016"	1	        4	        "fail14.txt"	09-SEP-25
14	    "60206301174"	"ICA0016"	2	        6	        "fail16.txt"	17-SEP-25
15	    "50509308102"	"ICA0016"	1	        6	        "fail17.txt"	01-SEP-25
16	    "50509308102"	"ICA0092"	1	        8	        "fail18.txt"	02-SEP-25
17	    "50509308102"	"ICA0080"	1	        5	        "fail19.txt"	03-SEP-25
18	    "50509308102"	"ICA0077"	2	        7	        "fail20.txt"	06-SEP-25

SET SERVEROUTPUT ON;

DECLARE
CURSOR kursused IS
SELECT y.id, y.eesnimi, y.perenimi, o.kood, o.nimetus, COUNT(*) AS toode_arv
FROM lepikult.koduylesanded k
JOIN lepikult.yliopilased y
ON y.id = k.yliopilane
JOIN lepikult.oppeained o
ON o.kood = k.oppeaine
GROUP BY
y.id, y.eesnimi, y.perenimi,
o.kood, o.nimetus
HAVING COUNT(*) >= 2
ORDER BY y.perenimi, y.eesnimi, o.nimetus;
BEGIN
FOR row IN kursused LOOP
DBMS_OUTPUT.PUT_LINE(
row.perenimi || ', ' || row.eesnimi ||
' – ' || row.nimetus ||
' (töid: ' || row.toode_arv || ')'
);
END LOOP;
END;
/

--tulemus
Kask, Katrin – Digitaalkommunikatsioon (töid: 2)
Kask, Katrin – Oracle: SQL ja PL/SQL (töid: 4)
Kuusk, Tarmo – Oracle: SQL ja PL/SQL (töid: 2)
Sarapuu, Sirje – Oracle: SQL ja PL/SQL (töid: 3)
