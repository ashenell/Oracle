--Query sugu ja * lisamine
SELECT
  EESNIMI, PERENIMI, MATEMAATIKA,
  CASE
      WHEN SUBSTR(ID, 1, 1) IN('3','5') THEN 'M'
    ELSE 'N'
    END
    AS SUGU,
    RPAD('*', ROUND(MATEMAATIKA/10), '*')  as DIAGRAMM
FROM KANDIDAADID;

--tulemused

+-----------+-----------+-----------+----+----------+
|EESNIMI    |PERENIMI   |MATEMAATIKA|SUGU|DIAGRAMM  |
+-----------+-----------+-----------+----+----------+
|JAANO      |PAAP       |97         |M   |**********|
|HEIMAR     |KALLAK     |97         |M   |**********|
|JAAN       |LEIN       |98         |M   |**********|
|AIMAR      |HALLIKMA   |99         |M   |**********|
|ILMAR      |BAUMAN     |92         |M   |********* |
|ALAR       |EMAJåE     |91         |M   |********* |
|TANEL      |AADLI      |85         |M   |********* |
|MIKK       |PRIKS      |89         |M   |********* |
|EERO       |METS       |82         |M   |********  |
|MEELIS     |SOIKKA     |95         |M   |**********|
|JANIKA     |ASSOR      |80         |N   |********  |
|ARTJOM     |KILK       |68         |M   |*******   |
|TAAVI      |AASAV      |74         |M   |*******   |
|ALEKSEI    |PIIRSALU   |70         |M   |*******   |
|HARRI      |ADER       |82         |M   |********  |
|MARTIN     |TOMINGAS   |48         |M   |*****     |
|TIMO       |PIHL       |95         |M   |**********|
|ANDREI     |JAKSON     |96         |M   |**********|
|MART       |LELUMEES   |95         |M   |**********|
|NEEME      |LEIBAK     |89         |M   |********* |
|MARTIN     |EENSAAR    |93         |M   |********* |
|ELMO       |EENSAAR    |77         |M   |********  |
|URMAS      |ANDRE      |95         |M   |**********|
|MIHKEL     |MALSROOS   |76         |M   |********  |
|VIRGO      |JŽRVEOJA   |90         |M   |********* |
|SILVER     |PALLO      |85         |M   |********* |
|TAUNO      |KARU       |83         |M   |********  |
|KARIINA    |šMARIK     |81         |N   |********  |
|MARKO      |NIRK       |85         |M   |********* |
|TARMO      |LEHEMAA    |80         |M   |********  |
|RAUL       |PALLAS     |94         |M   |********* |
|ALVAR      |VEILBERG   |98         |M   |**********|
|MIHKEL     |NEIMAR     |78         |M   |********  |
|JAANUS     |SAAR       |89         |M   |********* |
|SIIM       |NåOMAA     |85         |M   |********* |
|MŽRTEN     |RåIGAS     |91         |M   |********* |
|ALLAN      |RššTELMAA  |89         |M   |********* |
|REEMET     |PETROV     |84         |M   |********  |
|JšRI       |GROSSMANN  |79         |M   |********  |
|ALEKSANDR  |KOOP       |87         |M   |********* |
|REINO      |LAAST      |77         |M   |********  |
|LAURI      |ERVALD     |82         |M   |********  |
|MAKSIM     |OTTAS      |89         |M   |********* |
|ILLE       |VEILBERG   |93         |N   |********* |
|MARJU      |HILLEP     |78         |N   |********  |
|NATALIA    |RAUDSEPP   |91         |N   |********* |
|MADIS      |ROSEN      |80         |M   |********  |
|RENNO      |LAUR       |76         |M   |********  |
|ALLAN      |NURMITS    |76         |M   |********  |
|URMO       |PEETS      |82         |M   |********  |
|TIIT       |HIRV       |76         |M   |********  |
|PRIIT      |LIGI       |71         |M   |*******   |
|RAUNO      |METSAOTS   |80         |M   |********  |
|TANEL      |KROON      |72         |M   |*******   |
|MAREK      |KIRSIPUU   |72         |M   |*******   |
|KIRILL     |SåMER      |75         |M   |********  |
|MIHKEL     |KALDVEE    |57         |M   |******    |
|SIIM       |KåIV       |68         |M   |*******   |
|KAAREL     |KALJUR     |68         |M   |*******   |
|KASPAR     |SOKK       |84         |M   |********  |
|TRIIN      |PEENSALU   |83         |N   |********  |
|KRISTJAN   |PALUTAJA   |68         |M   |*******   |
|PRIIDIK    |BAMBERG    |83         |M   |********  |
|PRIIT      |MŽTLIK     |59         |M   |******    |
|TOOMAS     |MIHELSON   |74         |M   |*******   |
|DENISS     |ANDRESSON  |62         |M   |******    |
|MŽRT       |KALLASTE   |79         |M   |********  |
|RAGNAR     |JAAKSOO    |72         |M   |*******   |
|IVO        |NILK       |79         |M   |********  |
|HANNES     |JŽRVI      |76         |M   |********  |
|MIKK       |SARAPU     |75         |M   |********  |
|TOOM       |TIIDEMANN  |64         |M   |******    |
|VERONIKA   |VŽLI       |93         |N   |********* |
|AHTI       |KAIGAS     |71         |M   |*******   |
|MARKUS     |KUZNETSOV  |69         |M   |*******   |
|JAANUS     |VILLEMS    |83         |M   |********  |
|MART       |VESIAID    |80         |M   |********  |
|ROLAND     |LUMBERG    |81         |M   |********  |
|JAANUS     |JAASKA     |87         |M   |********* |
|ANDRE      |LEINVALD   |75         |M   |********  |
|LAAS       |FOMAT¾KIN  |83         |M   |********  |
|ARVO       |VILLEMS    |73         |M   |*******   |
|ERASMUS    |BONDARVE   |70         |M   |*******   |
|PAMELA     |BESSONOV   |70         |N   |*******   |
|ALEKSEI    |JALASTO    |85         |M   |********* |
|KAAREL     |TåRTO¾NåI  |80         |M   |********  |
|TAAVO      |LEINO      |72         |M   |*******   |
|LAURI      |SELGE      |70         |M   |*******   |
|MEELIS     |MEDAR      |67         |M   |*******   |
|RAIDO      |HåBE       |64         |M   |******    |
|VERON      |MŽE        |76         |M   |********  |
|ANNELY     |MESILA     |73         |N   |*******   |
|EGON       |LEHTER     |65         |M   |*******   |
|SVEN       |KOSHELEV   |66         |M   |*******   |
|VAIKO      |TATTER     |66         |M   |*******   |
|ALEKSANDR  |RUUS       |81         |M   |********  |
|MARTI      |ROOTS      |78         |M   |********  |
|KEIO-MARGUS|RIKKEN     |67         |M   |*******   |
|JOHAN      |SEPP       |64         |M   |******    |
|KRISTO     |MARTINSON  |49         |M   |*****     |
|ARNE       |VALDAS     |44         |M   |****      |
|ALEKSANDR  |LILLAK     |60         |M   |******    |
|EIRIK      |PALLOTEDDER|57         |M   |******    |
|KAIMO      |MŽE        |57         |M   |******    |
|LEHOR      |LAMP       |66         |M   |*******   |
|IVARI      |RANDMA     |65         |M   |*******   |
|SILVER     |LIIVAK     |54         |M   |*****     |
|ANTTI      |LŽŽNE      |70         |M   |*******   |
|MARVIN     |åUNAPUU    |56         |M   |******    |
|ERKKI      |SåLG       |59         |M   |******    |
|PRIIT      |PIIRSALU   |56         |M   |******    |
|JANEK      |TASANE     |71         |M   |*******   |
|CAROLYN    |ALEKSEJEV  |70         |N   |*******   |
|NELE       |MARNAUSSOV |71         |N   |*******   |
|OLGA       |PRIKS      |59         |N   |******    |
|TORMI      |MåNJAM     |70         |M   |*******   |
|KATI       |TAMM       |62         |N   |******    |
|PEEP       |PRIKS      |55         |M   |******    |
|KALEV      |SEEBA      |46         |M   |*****     |
|ALARI      |MOISAR     |69         |M   |*******   |
|SIIM       |EERME      |53         |M   |*****     |
|KALLE      |VARES      |73         |M   |*******   |
|MART       |MAIMISTON  |72         |M   |*******   |
|VILJO      |LEIN       |75         |M   |********  |
|REILI      |SAGAJA     |59         |N   |******    |
|LAURI      |POLL       |53         |M   |*****     |
|MART       |NIMMERFELDT|47         |M   |*****     |
|MIHKEL     |HINTSOV    |59         |M   |******    |
|KRISTO     |VOOGLA     |58         |M   |******    |
|ERKKI      |KOOKLA     |57         |M   |******    |
|KRISTJAN   |KAMBEK     |68         |M   |*******   |
|VEIKO      |EDING      |42         |M   |****      |
|PRIIT      |RAMMUL     |37         |M   |****      |
|AHTO       |EMAJåE     |67         |M   |*******   |
|RAIT       |DAUB       |59         |M   |******    |
|MARTIN     |AUN        |63         |M   |******    |
|MIHKEL     |AAVIK      |56         |M   |******    |
|TIIT       |RANDNA     |51         |M   |*****     |
|MAREK      |KORB       |53         |M   |*****     |
|ROMAN      |JAAKSON    |68         |M   |*******   |
|GERT       |KåIV       |53         |M   |*****     |
|SANDER     |MŽNNASSON  |73         |M   |*******   |
|ALEKSANDRA |SILLAMAA   |53         |N   |*****     |
|KAUR       |PåLDMAA    |52         |M   |*****     |
|KADRI      |KAIS       |71         |N   |*******   |
|MARTIN     |ONOHHOV    |48         |M   |*****     |
|INDREK     |LEIST      |53         |M   |*****     |
|VALTER     |KIIS       |75         |M   |********  |
|VELLO      |TELVAR     |73         |M   |*******   |
|OTT        |KILP       |60         |M   |******    |
|ANDRES     |TAUR       |63         |M   |******    |
|KERT       |ERDMANN    |53         |M   |*****     |
|MAREK      |PIKKAR     |55         |M   |******    |
|RAVEL      |EVERT      |62         |M   |******    |
|RENNAT     |VEERBAUM   |49         |M   |*****     |
|MARITE     |JEGONJAN   |56         |N   |******    |
|LEONID     |OTSALAINEN |49         |M   |*****     |
|JOOSEP     |VEERSALU   |45         |M   |*****     |
|TAURI      |JšRGENSON  |57         |M   |******    |
|KERDO      |PŽRNASTE   |51         |M   |*****     |
|MARTIN     |VASSUS     |50         |M   |*****     |
|IGOR       |LABE       |42         |M   |****      |
|ILJA       |PIKK       |52         |M   |*****     |
|PRIIT      |SAAR       |33         |M   |***       |
|SIIM       |LAURIMAA   |49         |M   |*****     |
|HENDRIK    |VALLER     |51         |M   |*****     |
|ERIK       |ERVIN      |45         |M   |*****     |
|KASPAR     |PIKANI     |43         |M   |****      |
|KRISTJAN   |MULD       |56         |M   |******    |
|TARVO      |TELLING    |44         |M   |****      |
|MATTIAS    |PILV       |39         |M   |****      |
|RANNER     |LIGI       |28         |M   |***       |
|TARMO      |VILT       |44         |M   |****      |
|SIIM       |MOORAST    |52         |M   |*****     |
|MAIT       |LEIGER     |53         |M   |*****     |
|REIMO      |KLASEN     |49         |M   |*****     |
|MARIO      |REBANE     |27         |M   |***       |
|PRIIT      |åIGLANE    |47         |M   |*****     |
|SVEN       |MUTLI      |42         |M   |****      |
|MARTIN     |ENNUS      |44         |M   |****      |
|MART       |JåGEVA     |35         |M   |****      |
|KUUNO      |HEIN       |32         |M   |***       |
|REIGO      |VASSUS     |34         |M   |***       |
|KRISTJAN   |MAAPALU    |41         |M   |****      |
|GERD       |SIIMON     |48         |M   |*****     |
|TANEL      |VIHMANN    |45         |M   |*****     |
|MAURI      |TOMP       |42         |M   |****      |
|DENIS      |SEPP       |31         |M   |***       |
|KRISTJAN   |BREMANN    |38         |M   |****      |
|OLEG       |ISRAEL     |39         |M   |****      |
|OLIVER     |DANILAS    |42         |M   |****      |
|VELLO      |KOHARI     |21         |M   |**        |
|KAIRE      |PILDER     |39         |N   |****      |
|MAIK       |TEDER      |35         |M   |****      |
|INDREK     |ZAHKNA     |27         |M   |***       |
|EVELIN     |ELJANDI    |31         |N   |***       |
|MAREK      |TREI       |28         |M   |***       |
+-----------+-----------+-----------+----+----------+



--Isikute vanused täisarvuna ning, millal isik sai/saab 25

SELECT
  EESNIMI, PERENIMI,
  TO_DATE(SUBSTR(TO_CHAR(ID), 2, 6), 'rrmmdd') AS SYNNIAEG,
  TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE(SUBSTR(TO_CHAR(ID),2,6),'rrmmdd')) / 12) AS VANUS,
  ADD_MONTHS(TO_DATE(SUBSTR(TO_CHAR(ID), 2, 6), 'rrmmdd'), 25*12) AS SAAB_SAI_25
FROM KANDIDAADID

--tulemused

+-----------+-----------+----------+-----+-----------+
|EESNIMI    |PERENIMI   |SYNNIAEG  |VANUS|SAAB_SAI_25|
+-----------+-----------+----------+-----+-----------+
|JAANO      |PAAP       |2003-05-07|22   |2028-05-07 |
|HEIMAR     |KALLAK     |2002-09-20|23   |2027-09-20 |
|JAAN       |LEIN       |2002-06-07|23   |2027-06-07 |
|AIMAR      |HALLIKMA   |2002-08-18|23   |2027-08-18 |
|ILMAR      |BAUMAN     |2002-03-16|23   |2027-03-16 |
|ALAR       |EMAJåE     |2002-04-19|23   |2027-04-19 |
|TANEL      |AADLI      |2002-06-05|23   |2027-06-05 |
|MIKK       |PRIKS      |2002-10-25|22   |2027-10-25 |
|EERO       |METS       |2002-05-08|23   |2027-05-08 |
|MEELIS     |SOIKKA     |2002-03-24|23   |2027-03-24 |
|JANIKA     |ASSOR      |2002-01-31|23   |2027-01-31 |
|ARTJOM     |KILK       |1997-07-18|28   |2022-07-18 |
|TAAVI      |AASAV      |2002-05-11|23   |2027-05-11 |
|ALEKSEI    |PIIRSALU   |2002-06-07|23   |2027-06-07 |
|HARRI      |ADER       |2000-07-17|25   |2025-07-17 |
|MARTIN     |TOMINGAS   |1995-05-25|30   |2020-05-25 |
|TIMO       |PIHL       |2003-04-03|22   |2028-04-03 |
|ANDREI     |JAKSON     |2002-09-24|23   |2027-09-24 |
|MART       |LELUMEES   |2002-03-08|23   |2027-03-08 |
|NEEME      |LEIBAK     |2001-06-14|24   |2026-06-14 |
|MARTIN     |EENSAAR    |2002-06-11|23   |2027-06-11 |
|ELMO       |EENSAAR    |2002-08-04|23   |2027-08-04 |
|URMAS      |ANDRE      |2001-03-23|24   |2026-03-23 |
|MIHKEL     |MALSROOS   |2002-03-24|23   |2027-03-24 |
|VIRGO      |JŽRVEOJA   |2002-12-03|22   |2027-12-03 |
|SILVER     |PALLO      |2002-06-17|23   |2027-06-17 |
|TAUNO      |KARU       |2002-08-13|23   |2027-08-13 |
|KARIINA    |šMARIK     |1996-06-25|29   |2021-06-25 |
|MARKO      |NIRK       |2001-04-01|24   |2026-04-01 |
|TARMO      |LEHEMAA    |2002-06-04|23   |2027-06-04 |
|RAUL       |PALLAS     |2003-03-18|22   |2028-03-18 |
|ALVAR      |VEILBERG   |2002-08-22|23   |2027-08-22 |
|MIHKEL     |NEIMAR     |2002-04-25|23   |2027-04-25 |
|JAANUS     |SAAR       |2002-05-02|23   |2027-05-02 |
|SIIM       |NåOMAA     |1996-02-22|29   |2021-02-22 |
|MŽRTEN     |RåIGAS     |2002-06-13|23   |2027-06-13 |
|ALLAN      |RššTELMAA  |2002-07-26|23   |2027-07-26 |
|REEMET     |PETROV     |2002-10-28|22   |2027-10-28 |
|JšRI       |GROSSMANN  |2003-02-11|22   |2028-02-11 |
|ALEKSANDR  |KOOP       |2002-12-28|22   |2027-12-28 |
|REINO      |LAAST      |2002-06-05|23   |2027-06-05 |
|LAURI      |ERVALD     |2003-06-13|22   |2028-06-13 |
|MAKSIM     |OTTAS      |2002-12-24|22   |2027-12-24 |
|ILLE       |VEILBERG   |2002-09-21|23   |2027-09-21 |
|MARJU      |HILLEP     |2002-10-13|22   |2027-10-13 |
|NATALIA    |RAUDSEPP   |1992-01-02|33   |2017-01-02 |
|MADIS      |ROSEN      |2001-12-14|23   |2026-12-14 |
|RENNO      |LAUR       |2002-07-31|23   |2027-07-31 |
|ALLAN      |NURMITS    |2002-09-29|23   |2027-09-29 |
|URMO       |PEETS      |2000-11-18|24   |2025-11-18 |
|TIIT       |HIRV       |2002-03-26|23   |2027-03-26 |
|PRIIT      |LIGI       |2003-03-24|22   |2028-03-24 |
|RAUNO      |METSAOTS   |2002-08-28|23   |2027-08-28 |
|TANEL      |KROON      |2002-07-15|23   |2027-07-15 |
|MAREK      |KIRSIPUU   |2002-04-02|23   |2027-04-02 |
|KIRILL     |SåMER      |2002-06-06|23   |2027-06-06 |
|MIHKEL     |KALDVEE    |2001-09-01|24   |2026-09-01 |
|SIIM       |KåIV       |2002-04-26|23   |2027-04-26 |
|KAAREL     |KALJUR     |2002-03-26|23   |2027-03-26 |
|KASPAR     |SOKK       |2001-11-06|23   |2026-11-06 |
|TRIIN      |PEENSALU   |2001-01-08|24   |2026-01-08 |
|KRISTJAN   |PALUTAJA   |2001-11-23|23   |2026-11-23 |
|PRIIDIK    |BAMBERG    |2002-04-28|23   |2027-04-28 |
|PRIIT      |MŽTLIK     |2002-01-08|23   |2027-01-08 |
|TOOMAS     |MIHELSON   |2001-07-31|24   |2026-07-31 |
|DENISS     |ANDRESSON  |2002-11-09|22   |2027-11-09 |
|MŽRT       |KALLASTE   |2002-08-17|23   |2027-08-17 |
|RAGNAR     |JAAKSOO    |2002-01-08|23   |2027-01-08 |
|IVO        |NILK       |2001-12-18|23   |2026-12-18 |
|HANNES     |JŽRVI      |1996-10-27|28   |2021-10-27 |
|MIKK       |SARAPU     |2002-09-09|23   |2027-09-09 |
|TOOM       |TIIDEMANN  |2001-06-03|24   |2026-06-03 |
|VERONIKA   |VŽLI       |2001-10-07|24   |2026-10-07 |
|AHTI       |KAIGAS     |2002-05-26|23   |2027-05-26 |
|MARKUS     |KUZNETSOV  |1998-09-12|27   |2023-09-12 |
|JAANUS     |VILLEMS    |2001-06-07|24   |2026-06-07 |
|MART       |VESIAID    |2002-09-08|23   |2027-09-08 |
|ROLAND     |LUMBERG    |2002-05-30|23   |2027-05-30 |
|JAANUS     |JAASKA     |2002-10-16|22   |2027-10-16 |
|ANDRE      |LEINVALD   |2002-08-24|23   |2027-08-24 |
|LAAS       |FOMAT¾KIN  |2002-09-16|23   |2027-09-16 |
|ARVO       |VILLEMS    |2001-06-07|24   |2026-06-07 |
|ERASMUS    |BONDARVE   |1999-12-04|25   |2024-12-04 |
|PAMELA     |BESSONOV   |2000-04-24|25   |2025-04-24 |
|ALEKSEI    |JALASTO    |2002-08-09|23   |2027-08-09 |
|KAAREL     |TåRTO¾NåI  |2002-01-13|23   |2027-01-13 |
|TAAVO      |LEINO      |2002-02-19|23   |2027-02-19 |
|LAURI      |SELGE      |2001-08-28|24   |2026-08-28 |
|MEELIS     |MEDAR      |2002-09-05|23   |2027-09-05 |
|RAIDO      |HåBE       |2001-08-21|24   |2026-08-21 |
|VERON      |MŽE        |2000-12-29|24   |2025-12-29 |
|ANNELY     |MESILA     |2001-05-06|24   |2026-05-06 |
|EGON       |LEHTER     |2003-01-01|22   |2028-01-01 |
|SVEN       |KOSHELEV   |1999-09-18|26   |2024-09-18 |
|VAIKO      |TATTER     |2002-11-07|22   |2027-11-07 |
|ALEKSANDR  |RUUS       |2003-01-24|22   |2028-01-24 |
|MARTI      |ROOTS      |2001-04-07|24   |2026-04-07 |
|KEIO-MARGUS|RIKKEN     |2002-04-09|23   |2027-04-09 |
|JOHAN      |SEPP       |2002-02-28|23   |2027-02-28 |
|KRISTO     |MARTINSON  |2001-12-12|23   |2026-12-12 |
|ARNE       |VALDAS     |1996-04-26|29   |2021-04-26 |
|ALEKSANDR  |LILLAK     |2002-06-02|23   |2027-06-02 |
|EIRIK      |PALLOTEDDER|2001-11-19|23   |2026-11-19 |
|KAIMO      |MŽE        |1997-01-09|28   |2022-01-09 |
|LEHOR      |LAMP       |2002-08-11|23   |2027-08-11 |
|IVARI      |RANDMA     |2002-01-16|23   |2027-01-16 |
|SILVER     |LIIVAK     |2003-02-27|22   |2028-02-27 |
|ANTTI      |LŽŽNE      |1999-11-26|25   |2024-11-26 |
|MARVIN     |åUNAPUU    |2002-09-05|23   |2027-09-05 |
|ERKKI      |SåLG       |2002-08-16|23   |2027-08-16 |
|PRIIT      |PIIRSALU   |2001-12-05|23   |2026-12-05 |
|JANEK      |TASANE     |2002-07-17|23   |2027-07-17 |
|CAROLYN    |ALEKSEJEV  |2002-08-30|23   |2027-08-30 |
|NELE       |MARNAUSSOV |1999-01-19|26   |2024-01-19 |
|OLGA       |PRIKS      |2002-03-20|23   |2027-03-20 |
|TORMI      |MåNJAM     |2002-07-11|23   |2027-07-11 |
|KATI       |TAMM       |2001-08-30|24   |2026-08-30 |
|PEEP       |PRIKS      |2003-06-28|22   |2028-06-28 |
|KALEV      |SEEBA      |2002-06-26|23   |2027-06-26 |
|ALARI      |MOISAR     |2000-02-23|25   |2025-02-23 |
|SIIM       |EERME      |2002-07-15|23   |2027-07-15 |
|KALLE      |VARES      |2002-06-01|23   |2027-06-01 |
|MART       |MAIMISTON  |2001-01-27|24   |2026-01-27 |
|VILJO      |LEIN       |2002-02-23|23   |2027-02-23 |
|REILI      |SAGAJA     |2002-09-21|23   |2027-09-21 |
|LAURI      |POLL       |2000-04-15|25   |2025-04-15 |
|MART       |NIMMERFELDT|2001-11-12|23   |2026-11-12 |
|MIHKEL     |HINTSOV    |2002-04-23|23   |2027-04-23 |
|KRISTO     |VOOGLA     |1997-05-14|28   |2022-05-14 |
|ERKKI      |KOOKLA     |2000-12-07|24   |2025-12-07 |
|KRISTJAN   |KAMBEK     |2001-07-27|24   |2026-07-27 |
|VEIKO      |EDING      |2002-01-14|23   |2027-01-14 |
|PRIIT      |RAMMUL     |2001-09-13|24   |2026-09-13 |
|AHTO       |EMAJåE     |2002-07-25|23   |2027-07-25 |
|RAIT       |DAUB       |2000-12-15|24   |2025-12-15 |
|MARTIN     |AUN        |2002-06-07|23   |2027-06-07 |
|MIHKEL     |AAVIK      |2001-06-12|24   |2026-06-12 |
|TIIT       |RANDNA     |2002-05-25|23   |2027-05-25 |
|MAREK      |KORB       |2002-10-03|23   |2027-10-03 |
|ROMAN      |JAAKSON    |2002-12-01|22   |2027-12-01 |
|GERT       |KåIV       |2002-08-27|23   |2027-08-27 |
|SANDER     |MŽNNASSON  |2002-04-04|23   |2027-04-04 |
|ALEKSANDRA |SILLAMAA   |2002-06-21|23   |2027-06-21 |
|KAUR       |PåLDMAA    |2000-02-05|25   |2025-02-05 |
|KADRI      |KAIS       |2001-06-14|24   |2026-06-14 |
|MARTIN     |ONOHHOV    |2002-09-18|23   |2027-09-18 |
|INDREK     |LEIST      |2001-12-22|23   |2026-12-22 |
|VALTER     |KIIS       |2002-05-04|23   |2027-05-04 |
|VELLO      |TELVAR     |2002-07-21|23   |2027-07-21 |
|OTT        |KILP       |2001-12-14|23   |2026-12-14 |
|ANDRES     |TAUR       |2002-07-17|23   |2027-07-17 |
|KERT       |ERDMANN    |2003-02-19|22   |2028-02-19 |
|MAREK      |PIKKAR     |2002-06-12|23   |2027-06-12 |
|RAVEL      |EVERT      |2002-09-04|23   |2027-09-04 |
|RENNAT     |VEERBAUM   |2002-01-22|23   |2027-01-22 |
|MARITE     |JEGONJAN   |2002-01-08|23   |2027-01-08 |
|LEONID     |OTSALAINEN |2002-01-26|23   |2027-01-26 |
|JOOSEP     |VEERSALU   |2003-10-29|21   |2028-10-29 |
|TAURI      |JšRGENSON  |2001-12-14|23   |2026-12-14 |
|KERDO      |PŽRNASTE   |2002-11-14|22   |2027-11-14 |
|MARTIN     |VASSUS     |2002-08-13|23   |2027-08-13 |
|IGOR       |LABE       |2002-12-15|22   |2027-12-15 |
|ILJA       |PIKK       |2001-09-17|24   |2026-09-17 |
|PRIIT      |SAAR       |2000-08-02|25   |2025-08-02 |
|SIIM       |LAURIMAA   |2002-08-24|23   |2027-08-24 |
|HENDRIK    |VALLER     |2002-05-05|23   |2027-05-05 |
|ERIK       |ERVIN      |2002-05-05|23   |2027-05-05 |
|KASPAR     |PIKANI     |1999-02-06|26   |2024-02-06 |
|KRISTJAN   |MULD       |2002-11-07|22   |2027-11-07 |
|TARVO      |TELLING    |2002-04-14|23   |2027-04-14 |
|MATTIAS    |PILV       |2002-11-17|22   |2027-11-17 |
|RANNER     |LIGI       |2002-12-03|22   |2027-12-03 |
|TARMO      |VILT       |2001-12-05|23   |2026-12-05 |
|SIIM       |MOORAST    |2003-02-20|22   |2028-02-20 |
|MAIT       |LEIGER     |2001-06-18|24   |2026-06-18 |
|REIMO      |KLASEN     |2001-06-01|24   |2026-06-01 |
|MARIO      |REBANE     |2002-03-15|23   |2027-03-15 |
|PRIIT      |åIGLANE    |2001-06-16|24   |2026-06-16 |
|SVEN       |MUTLI      |2002-08-06|23   |2027-08-06 |
|MARTIN     |ENNUS      |2002-11-25|22   |2027-11-25 |
|MART       |JåGEVA     |2001-06-22|24   |2026-06-22 |
|KUUNO      |HEIN       |2002-03-14|23   |2027-03-14 |
|REIGO      |VASSUS     |2001-12-26|23   |2026-12-26 |
|KRISTJAN   |MAAPALU    |1999-08-29|26   |2024-08-29 |
|GERD       |SIIMON     |2003-04-05|22   |2028-04-05 |
|TANEL      |VIHMANN    |2002-03-27|23   |2027-03-27 |
|MAURI      |TOMP       |2001-11-15|23   |2026-11-15 |
|DENIS      |SEPP       |2001-06-16|24   |2026-06-16 |
|KRISTJAN   |BREMANN    |2000-12-18|24   |2025-12-18 |
|OLEG       |ISRAEL     |2002-09-21|23   |2027-09-21 |
|OLIVER     |DANILAS    |2001-09-20|24   |2026-09-20 |
|VELLO      |KOHARI     |2001-10-26|23   |2026-10-26 |
|KAIRE      |PILDER     |1999-06-26|26   |2024-06-26 |
|MAIK       |TEDER      |2002-09-04|23   |2027-09-04 |
|INDREK     |ZAHKNA     |2001-11-23|23   |2026-11-23 |
|EVELIN     |ELJANDI    |2002-06-19|23   |2027-06-19 |
|MAREK      |TREI       |2001-06-08|24   |2026-06-08 |
+-----------+-----------+----------+-----+-----------+
