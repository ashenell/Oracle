Anna kasutajale rvaher rollid tabelitele

GRANT SELECT ON lepikult.yliopilased to rvaher;
GRANT SELECT ON lepikult.koduylesanded to rvaher;
GRANT SELECT ON lepikult.oppeained to rvaher;

create table tulemused(
id NUMBER(11),
CONSTRAINT id_pk PRIMARY KEY(id),
eesnimi VARCHAR2(30) NOT NULL,
perenimi VARCHAR2(30) NOT NULL,
yl1 NUMBER(3) DEFAULT 0,
yl2 NUMBER(3) DEFAULT 0,
yl3 NUMBER(3) DEFAULT 0,
kokku GENERATED ALWAYS AS (NVL(yl1,0) + NVL(yl2,0) + NVL(yl3, 0)) VIRTUAL,
arvestus CHAR(2) DEFAULT 'MA',
CHECK (arvestus IN ('A','MA'))
)

INSERT INTO tulemused (id, eesnimi, perenimi, yl1, yl2, yl3, arvestus)
SELECT y.id, y.eesnimi, y.perenimi, NVL(a.yl1, 0) AS yl1, NVL(a.yl2, 0) AS yl2, NVL(a.yl3, 0) AS yl3,
CASE
WHEN NVL(a.yl1,0) + NVL(a.yl2,0) + NVL(a.yl3,0) >= 14 THEN 'A'
ELSE 'MA'
END AS arvestus
FROM (
SELECT
b.yliopilane,
MAX(CASE WHEN b.too_nr = 1 THEN b.punktid END) AS yl1,
MAX(CASE WHEN b.too_nr = 2 THEN b.punktid END) AS yl2,
MAX(CASE WHEN b.too_nr = 3 THEN b.punktid END) AS yl3
FROM (
SELECT
k.yliopilane,
k.too_nr,
MAX(k.punktid) AS punktid
FROM lepikult.koduylesanded k
WHERE k.oppeaine = 'ICA0016'
GROUP BY k.yliopilane, k.too_nr ) b
GROUP BY b.yliopilane
) a JOIN lepikult.yliopilased y ON y.id = a.yliopilane;


--tulemus
"ID"	    "EESNIMI"	"PERENIMI"	"YL1"	"YL2"	"YL3"	"KOKKU"	"ARVESTUS"
50509308102	"Virgo"	    "Pihlakas"	6	    0	    0	    6	    "MA"
50512200906	"Tarmo"	    "Kuusk"	    10	    8	    0	    18	    "A "
60206301174	"Sirje"	    "Sarapuu"	4	    6	    0	    10	    "MA"
60410020314	"Katrin"	"Kask"	    7	    7	    6	    20	    "A "

CREATE TABLE lugeja (
isikukood NUMBER(11),
CONSTRAINT id_isikukood PRIMARY KEY(isikukood),
eesnimi VARCHAR2(30) NOT NULL,
perenimi VARCHAR2(30) NOT NULL,
address VARCHAR2(200),
telefon VARCHAR2(20) NOT NULL,
email VARCHAR2(254) NOT NULL,
CONSTRAINT lugeja_email UNIQUE(email)
);

CREATE TABLE raamat (
shiffer VARCHAR2(30),
autor VARCHAR2(30) NOT NULL,
CONSTRAINT id_raamat PRIMARY KEY(shiffer),
pealkiri VARCHAR2(200) NOT NULL,
hind NUMBER(8,2) DEFAULT 0 NOT NULL,
eksemplaare NUMBER(4) DEFAULT 0 NOT NULL,
CONSTRAINT raamatu_hind CHECK (hind >= 0),
CONSTRAINT raamatu_eksemplaare CHECK (eksemplaare >= 0)
);



CREATE TABLE laenutus (
isikukood NUMBER(11) NOT NULL,
shiffer VARCHAR2(30) NOT NULL,
laenutamise_kuupaev DATE NOT NULL,
tagastamise_kuupaev DATE,
CONSTRAINT isikukood_fk FOREIGN KEY (isikukood) REFERENCES lugeja(isikukood),
CONSTRAINT shiffer_fk FOREIGN KEY (shiffer) REFERENCES raamat(shiffer)
);


--sisestame testmiseks andmed

INSERT INTO lugeja (isikukood, eesnimi, perenimi, address, telefon, email) VALUES
(39210024414, 'Virgo', 'Pihlakas', 'Pargi 1, Tallinn',  '+3725000001', 'virgo.pihlakas@example.ee');
INSERT INTO lugeja (isikukood, eesnimi, perenimi, address, telefon, email) VALUES
(30512200326, 'Tarmo', 'Kuusk',    'Kase 2, Tartu',      '+3725000002', 'tarmo.kuusk@example.ee');
INSERT INTO lugeja (isikukood, eesnimi, perenimi, address, telefon, email) VALUES
(60206301334, 'Sirje', 'Sarapuu',  'Kuuse 3, Pärnu',     '+3725000003', 'sirje.sarapuu@example.ee');
INSERT INTO lugeja (isikukood, eesnimi, perenimi, address, telefon, email) VALUES
(39909308552, 'Katrin','Kask',     'Tamme 4, Narva',     '+3725000004', 'katrin.kask@example.ee');

 
INSERT INTO raamat (shiffer, autor, pealkiri, hind, eksemplaare) VALUES
('TAL-001', 'Autor A', 'Oracle: SQL ja PL/SQL', 25.50, 3);
INSERT INTO raamat (shiffer, autor, pealkiri, hind, eksemplaare) VALUES
('TAL-002', 'Autor B', 'Digitaalkommunikatsioon', 13.99, 12);
INSERT INTO raamat (shiffer, autor, pealkiri, hind, eksemplaare) VALUES
('TAL-003', 'Autor C', 'Riistvaraline programmeerimine', 59.99, 10);


INSERT INTO laenutus (isikukood, shiffer, laenutamise_kuupaev)
VALUES (39210024414, 'TAL-001', SYSDATE - 20);

INSERT INTO laenutus (isikukood, shiffer, laenutamise_kuupaev)
VALUES (39210024414, 'TAL-002', SYSDATE - 5);

INSERT INTO laenutus (isikukood, shiffer, laenutamise_kuupaev, tagastamise_kuupaev)
VALUES (30512200326, 'TAL-003', SYSDATE - 30, SYSDATE - 10);

INSERT INTO laenutus (isikukood, shiffer, laenutamise_kuupaev)
VALUES (60206301334, 'TAL-001', SYSDATE - 40);

INSERT INTO laenutus (isikukood, shiffer, laenutamise_kuupaev, tagastamise_kuupaev)
VALUES (39909308552, 'TAL-002', DATE '2025-10-10', DATE '2025-10-20');

--tulemused 
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


SELECT l.eesnimi, l.perenimi, r.pealkiri, t.laenutamise_kuupaev FROM laenutus t
JOIN lugeja l ON l.isikukood = t.isikukood
JOIN raamat r ON r.shiffer = t.shiffer
WHERE t.tagastamise_kuupaev IS NULL AND
SYSDATE - t.laenutamise_kuupaev > 14;

--tulemus

"EESNIMI"	"PERENIMI"	"PEALKIRI"	                "LAENUTAMISE_KUUPAEV"
"Virgo"	    "Pihlakas"	"Oracle: SQL ja PL/SQL"	    05-OCT-25
"Sirje"	    "Sarapuu"	"Oracle: SQL ja PL/SQL"	    15-SEP-25
