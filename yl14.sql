SELECT * FROM lugeja;
"ISIKUKOOD"	"EESNIMI"	"PERENIMI"	"ADDRESS"	        "TELEFON"	    "EMAIL"
39909308552	"Katrin"	"Kask"	    "Tamme 4, Narva"	"+3725000004"	"katrin.kask@example.ee"
60206301334	"Sirje"	    "Sarapuu"	"Kuuse 3, Pärnu"	"+3725000003"	"sirje.sarapuu@example.ee"
30512200326	"Tarmo"	    "Kuusk"	    "Kase 2, Tartu"	    "+3725000002"	"tarmo.kuusk@example.ee"
39210024414	"Virgo"	    "Pihlakas"	"Pargi 1, Tallinn"	"+3725000001"	"virgo.pihlakas@example.ee"

SELECT * FROM raamat;

"SHIFFER"	"AUTOR"	    "PEALKIRI"	                        "HIND"	"EKSEMPLAARE"
"TAL-001"	"Autor A"	"Oracle: SQL ja PL/SQL"	             25.5	    3
"TAL-002"	"Autor B"	"Digitaalkommunikatsioon"	         13.99	    12
"TAL-003"	"Autor C"	"Riistvaraline programmeerimine"	 59.99	    10

SELECT * FROM laenutus;

"ISIKUKOOD"	"SHIFFER"	"LAENUTAMISE_KUUPAEV"	"TAGASTAMISE_KUUPAEV"
39210024414	"TAL-001"	05-OCT-25	
39210024414	"TAL-002"	20-OCT-25	
30512200326	"TAL-003"	25-SEP-25	            15-OCT-25
60206301334	"TAL-001"	15-SEP-25	
39909308552	"TAL-002"	10-OCT-25	            20-OCT-25


CREATE OR REPLACE PACKAGE viivisepakett IS viivise_maar 
CONSTANT NUMBER := 0.007;
FUNCTION viivis(p_isikukood IN lugeja.isikukood%TYPE)
RETURN NUMBER;
END viivisepakett;
/

CREATE OR REPLACE PACKAGE BODY viivisepakett IS
FUNCTION viivis(p_isikukood IN lugeja.isikukood%TYPE)
RETURN NUMBER
IS
v_summa NUMBER;
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM lugeja
WHERE isikukood = p_isikukood;
IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(
    -20001,
    'Sellise isikukoodiga lugejat ei ole: ' || p_isikukood);
END IF;
SELECT NVL(SUM(GREATEST(TRUNC
(NVL(l.tagastamise_kuupaev, SYSDATE)) - (TRUNC(l.laenutamise_kuupaev) + 14), 0 ) * viivise_maar * r.hind), 0)
INTO v_summa
FROM laenutus l
JOIN raamat r ON r.shiffer = l.shiffer WHERE l.isikukood = p_isikukood;
RETURN v_summa;
END viivis;
END viivisepakett;
/

--kontroll

SELECT perenimi, viivisepakett.viivis(isikukood) AS viivis
FROM lugeja;

--tulemus
"PERENIMI"	"VIIVIS"
"Pihlakas"	1.071
"Kuusk"	    2.51958
"Sarapuu"	4.641
"Kask"	    0
