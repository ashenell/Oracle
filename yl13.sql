create table isikud(
eesnimi VARCHAR2(30) NOT NULL,
perenimi VARCHAR2(30) NOT NULL,
email VARCHAR2(50)
)


insert into isikud (eesnimi, perenimi) values 
('Kalle',  'Muri');
insert into isikud (eesnimi, perenimi) values 
('Mari',  'Muri');
insert into isikud (eesnimi, perenimi) values 
('Kuri',  'Muri');
insert into isikud (eesnimi, perenimi) values 
('Maja',  'Lill');
insert into isikud (eesnimi, perenimi) values 
('Mari',  'Maasikas');
insert into isikud (eesnimi, perenimi) values 
('Ramon',  'Sikk');
insert into isikud (eesnimi, perenimi) values 
('Malle',  'Manna');
insert into isikud (eesnimi, perenimi) values 
('Kaupo',  'Notsas');
insert into isikud (eesnimi, perenimi) values 
('Tanel',  'Sarv');
insert into isikud (eesnimi, perenimi) values 
('Mai',  'Tea');

select * from isikud;

"EESNIMI"	"PERENIMI"	"EMAIL"
"Kalle"	    "Muri"	    ""
"Mari"	    "Muri"	    ""
"Kuri"	    "Muri"	    ""
"Maja"	    "Lill"	    ""
"Mari"  	"Maasikas"	""
"Ramon"	    "Sikk"	    ""
"Malle"	    "Manna"	    ""
"Kaupo"	    "Notsas"	""
"Tanel"	    "Sarv"	    ""
"Mai"	    "Tea"	    ""

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE loo_email IS
kasutaja VARCHAR2(50);
FUNCTION asenda_tahed(p IN VARCHAR2) RETURN VARCHAR2 IS
v VARCHAR2(100) := LOWER(p);
BEGIN
v := REPLACE(v, 'ä', 'a');
v := REPLACE(v, 'ö', 'o');
v := REPLACE(v, 'ü', 'u');
v := REPLACE(v, 'õ', 'o');
v := REPLACE(v, 'š', 's');
v := REPLACE(v, 'ž', 'z');
RETURN v;
END asenda_tahed;

FUNCTION loo_kasutaja(
p_eesnimi IN VARCHAR2,
p_perenimi IN VARCHAR2,
p_letters  IN PLS_INTEGER
) RETURN VARCHAR2 IS
v_ees VARCHAR2(100);
v_pere  VARCHAR2(100);
BEGIN
v_ees := asenda_tahed(SUBSTR(p_eesnimi, 1, p_letters));
v_pere  := asenda_tahed(p_perenimi);
RETURN SUBSTR(v_ees || v_pere, 1, 8);
END loo_kasutaja;


FUNCTION email_eksisteerib(kasutajanimi IN VARCHAR2) RETURN BOOLEAN IS
cnt NUMBER;
BEGIN
SELECT COUNT(*)
INTO cnt
FROM isikud
WHERE LOWER(email) = LOWER(kasutajanimi || '@itcollege.ee');
RETURN cnt > 0;
END email_eksisteerib;

BEGIN
FOR r IN (
SELECT ROWID rid, eesnimi, perenimi
FROM isikud
WHERE email IS NULL
) LOOP


kasutaja := loo_kasutaja(r.eesnimi, r.perenimi, 1);

IF email_eksisteerib(kasutaja) THEN
    kasutaja := loo_kasutaja(r.eesnimi, r.perenimi, 2);

IF email_eksisteerib(kasutaja) THEN
    RAISE_APPLICATION_ERROR(
    -20001,
    'Ei suutnud moodustada unikaalset meiliaadressi: ' || r.eesnimi || ' ' || r.perenimi);
    END IF;
END IF;

UPDATE isikud
SET email = kasutaja || '@itcollege.ee'
WHERE ROWID = r.rid;

END LOOP;
END loo_email;
/

BEGIN
loo_email;
END;
/

SELECT *
FROM isikud;

"EESNIMI"	"PERENIMI"	"EMAIL"
"Kalle"	    "Muri"	    "kmuri@itcollege.ee"
"Mari"	    "Muri"	    "mmuri@itcollege.ee"
"Kuri"	    "Muri"	    "kumuri@itcollege.ee"
"Maja"	    "Lill"	    "mlill@itcollege.ee"
"Mari"	    "Maasikas"	"mmaasika@itcollege.ee"
"Ramon"	    "Sikk"	    "rsikk@itcollege.ee"
"Malle"	    "Manna" 	"mmanna@itcollege.ee"
"Kaupo"	    "Notsas"	"knotsas@itcollege.ee"
"Tanel"	    "Sarv"	    "tsarv@itcollege.ee"
"Mai"	    "Tea"	    "mtea@itcollege.ee"
"Ärtu"	    "Ööbikuöö"	"aoobikuo@itcollege.ee"
