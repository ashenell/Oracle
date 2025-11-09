select y.eesnimi, y.perenimi, ROUND(AVG(k.punktid), 2) 
from lepikult.yliopilased Y
LEFT JOIN lepikult.koduylesanded k
on k.yliopilane = y.id
group by y.perenimi, y.eesnimi;
--tulemused

"EESNIMI"	"PERENIMI"	"ROUND(AVG(K.PUNKTID),2)"
"Virgo"	    "Pihlakas"	6.5
"Tarmo"	    "Kuusk"	    7.33
"Liina"	    "Vaher"	
"Sirje"	    "Sarapuu"	4.33
"Katrin"	  "Kask"	    6.88





SELECT K.YLIOPILANE, Y.PERENIMI, COUNT(K.TOO_NR) as toid from YLIOPILASED Y, KODUYLESANDED K
WHERE Y.ID = K.YLIOPILANE AND K.OPPEAINE = 'ICA0016'
group by Y.PERENIMI, K.YLIOPILANE;


--tulemused

YLIOPILANE	PERENIMI	TOID
50509308102	Pihlakas	1
50512200906	Kuusk	    2
60206301174	Sarapuu	    3
60410020314	Kask	    4

SELECT
    TO_CHAR(TO_DATE(SUBSTR(TRIM(ID),2,6),'rrmmdd'),'yyyy') AS SYNNI
    , ROUND(AVG(VOORKEEL), 2) as kesk from LEPIKULT.KANDIDAADID
    where  SUBSTR(ID, 1, 1) IN('3','5')
group by TO_CHAR(TO_DATE(SUBSTR(TRIM(ID),2,6),'rrmmdd'),'yyyy') 
order by kesk ASC 
FETCH FIRST 1 ROW ONLY;
--tulemused

SYNNI	KESK
1999	69.8


SELECT
    Y.PERENIMI || ', ' || Y.EESNIMI as ULIOPILANE,
    O.NIMETUS as OPPEAINE,
    ROUND(AVG(A), 1) as KESKPUNKT
FROM
    ( SELECT K.YLIOPILANE, K.OPPEAINE, AVG(K.PUNKTID) as A
        FROM LEPIKULT.KODUYLESANDED K
        GROUP BY K.YLIOPILANE, K.OPPEAINE
) A,
  ( SELECT T.YLIOPILANE, MAX(T.PUNKTKESK) AS MAKSIMAALNE
    FROM (
      SELECT K.YLIOPILANE, K.OPPEAINE, AVG(K.PUNKTID) AS PUNKTKESK
      FROM LEPIKULT.KODUYLESANDED K
      GROUP BY K.YLIOPILANE, K.OPPEAINE
    ) T
    GROUP BY T.YLIOPILANE
  ) M,
  LEPIKULT.YLIOPILASED Y,
  LEPIKULT.OPPEAINED O
WHERE A.YLIOPILANE = M.YLIOPILANE
AND A.A = M.MAKSIMAALNE
AND Y.ID = A.YLIOPILANE
AND O.KOOD = A.OPPEAINE
group by Y.EESNIMI, Y.PERENIMI, O.NIMETUS

--tulemused
ULIOPILANE	    OPPEAINE	                        KESKPUNKT
Kask, Katrin	Riistvaral„hedane programmeerimine	10
Kuusk, Tarmo	Oracle: SQL ja PL/SQL	            9
Sarapuu, Sirje	Oracle: SQL ja PL/SQL	            4.3
Pihlakas, Virgo	Digitaalkommunikatsioon	            8
