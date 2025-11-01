
CREATE TABLE tall (
id NUMBER,
CONSTRAINT talle_pk PRIMARY KEY(id),
synniaeg DATE NOT NULL,
synnikaal NUMBER(5, 2) NOT NULL,
sugu CHAR(1) NOT NULL,
CONSTRAINT talle_sugu CHECK (sugu in ('J', 'U'))
);

CREATE SEQUENCE id_nr_jaar START WITH 1 INCREMENT BY 2 NOCYCLE; --odd
CREATE SEQUENCE id_nr_utt START WITH 2 INCREMENT BY 2 NOCYCLE; --even

DECLARE
v_sugu CHAR(1) := UPPER('&sugu');
v_id NUMBER;
BEGIN
IF 
v_sugu = 'U' THEN v_id := id_nr_utt.NEXTVAL;
ELSE
v_id := id_nr_jaar.NEXTVAL;
END IF;
INSERT INTO tall(id, synniaeg, synnikaal, sugu) VALUES (
v_id, TO_DATE('&synniaeg', 'YYYY.MM.DD'), &synnikaal, v_sugu);
END;
/

SELECT * FROM tall;

--tulemus

"ID"	"SYNNIAEG"	"SYNNIKAAL"	"SUGU"
1	    01-NOV-25	25	        "J"
2	    01-NOV-25	22.4	    "U"
4	    29-OCT-25	23.5	    "U"
6	    30-OCT-25	21.2	    "U"
3	    31-OCT-25	26.4	    "J"

CREATE VIEW puntid_view AS
SELECT y.perenimi || ', ' || y.eesnimi AS nimi,
SUM(k.punktid) AS punktid
FROM lepikult.koduylesanded k
JOIN lepikult.yliopilased y ON y.id = k.yliopilane
JOIN lepikult.oppeained o ON o.kood = k.oppeaine
WHERE o.nimetus LIKE 'Oracle%'
GROUP BY y.perenimi, y.eesnimi;

--tulemus

"NIMI"	            "PUNKTID"
"Kask, Katrin"	    25
"Kuusk, Tarmo"	    18
"Sarapuu, Sirje"	13
"Pihlakas, Virgo"	6

GRANT SELECT ON lepikult.koduylesanded to rvaher WITH GRANT OPTION;
GRANT SELECT ON lepikult.oppeained to rvaher WITH GRANT OPTION;
GRANT SELECT ON lepikult.yliopilased to rvaher WITH GRANT OPTION;

GRANT SELECT ON puntid_view to scott;

select * from rvaher.puntid_view;

--tulemus
"NIMI"	            "PUNKTID"
"Kask, Katrin"	    25
"Kuusk, Tarmo"	    18
"Sarapuu, Sirje"	13
"Pihlakas, Virgo"	6


select * from rvaher.puntid_view
order by punktid DESC 
FETCH FIRST 3 ROW ONLY;

--tulemus
"NIMI"	            "PUNKTID"
"Kask, Katrin"	    25
"Kuusk, Tarmo"	    18
"Sarapuu, Sirje"	13