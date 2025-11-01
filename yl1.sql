
-- Kuna kasutan macis datagripi siis millegippärast ei saanud tööle käasku `describe KANDIDAADID`

describe KANDIDAADID
-- DDL struktuur
create table KANDIDAADID
(
    ID          CHAR(11),
    EESNIMI     VARCHAR2(30),
    PERENIMI    VARCHAR2(30),
    MATEMAATIKA NUMBER(3),
    VOORKEEL    NUMBER(3),
    EMAKEEL     NUMBER(3)
)

-- Enda kohta käievate andmete sisestamine INSERT lause abil

insert into KANDIDAADID
    (ID, EESNIMI, PERENIMI, MATEMAATIKA, VOORKEEL, EMAKEEL)
VALUES
    (39209174223, 'RAUNO', 'VAHER', 95, 92, 99);


select * from KANDIDAADID where ID = 39209174223;

-- ID LIKE '39209174223' AND EESNIMI LIKE 'RAUNO' AND MATEMAATIKA = 95 AND PERENIMI LIKE 'VAHER' AND VOORKEEL = 92 AND EMAKEEL = 99

-- Enda kohta käivate andmete uuendamine UPDATE lause abil

UPDATE KANDIDAADID
set MATEMAATIKA = 99
where ID = 39209174223;

select * from KANDIDAADID where ID = 39209174223;

-- ID LIKE '39209174223' AND EESNIMI LIKE 'RAUNO' AND MATEMAATIKA = 99 AND PERENIMI LIKE 'VAHER' AND VOORKEEL = 92 AND EMAKEEL = 99

-- Kustutan enda kohta käivad andmed

delete from KANDIDAADID where ID = 39209174223;

select * from KANDIDAADID where ID = 39209174223;

-- andmeid kustutatud ootuspäraselt