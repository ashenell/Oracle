CREATE TABLE uued_oppeained AS (SELECT * FROM lepikult.uued_oppeained);

CREATE TABLE minu_oppeained AS (SELECT * FROM lepikult.minu_oppeained);


INSERT INTO minu_oppeained (kood, oppejoud, nimetus)
VALUES ('ICM0008','Paul Leis','Tarkvaratehnika');

INSERT INTO minu_oppeained (kood, oppejoud, nimetus)
VALUES ('ICA0092','Sander Lodjapuu','Sissejuhatus erialasse');

SELECT * FROM minu_oppeained;

--tulemus
"KOOD"	    "OPPEJOUD"	        "NIMETUS"
"ICA0016"	"Toomas Lepikult"	"Oracle: SQL ja PL/SQL"
"ICA0092"	"Heldur Haak"	    "Digitaalkommunikatsioon"
"ICA0080"	"Peeter Marvet"	    "Digitaalne heli- ja pildit””tlus"
"ICA0077"	"Toomas Kont"	    "Riistvaral„hedane programmeerimine"
"ICM0008"	"Paul Leis"	        "Tarkvaratehnika"
"ICA0092"	"Sander Lodjapuu"	"Sissejuhatus erialasse"

-- Selleks, et rollback tuleks siia seisu tagasi
SAVEPOINT before_merge;


MERGE INTO minu_oppeained t
USING uued_oppeained s
ON (t.KOOD = s.KOOD)
WHEN MATCHED THEN
UPDATE SET 
t.OPPEJOUD = s.OPPEJOUD,
t.NIMETUS  = s.NIMETUS
WHEN NOT MATCHED THEN
INSERT (KOOD, OPPEJOUD, NIMETUS)
VALUES (s.KOOD, s.OPPEJOUD, s.NIMETUS);

SELECT * FROM minu_oppeained;

--tulemus

"KOOD"	    "OPPEJOUD"	        "NIMETUS"
"ICA0016"	"Toomas Lepikult"	"Oracle: SQL ja PL/SQL"
"ICA0092"	"Sander Lodjapuu"	"Sissejuhatus erialasse"
"ICA0080"	"Peeter Marvet"	    "Digitaalne heli- ja pildit””tlus"
"ICA0077"	"Toomas Kont"	    "Riistvaral„hedane programmeerimine"
"ICM0008"	"Paul Leis"	        "Tarkvaratehnika"
"ICA0092"	"Sander Lodjapuu"	"Sissejuhatus erialasse"
"ICY0019"	"Lembit Viilup"	    "Majandusäpetus"

rollback to before_merge;

--tulemus
"KOOD"	    "OPPEJOUD"	        "NIMETUS"
"ICA0016"	"Toomas Lepikult"	"Oracle: SQL ja PL/SQL"
"ICA0092"	"Heldur Haak"	    "Digitaalkommunikatsioon"
"ICA0080"	"Peeter Marvet"	    "Digitaalne heli- ja pildit””tlus"
"ICA0077"	"Toomas Kont"	    "Riistvaral„hedane programmeerimine"
"ICM0008"	"Paul Leis"	        "Tarkvaratehnika"
"ICA0092"	"Sander Lodjapuu"	"Sissejuhatus erialasse"
