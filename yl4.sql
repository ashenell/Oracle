--Join lause

SELECT Y.EESNIMI, Y.PERENIMI, K.KUUPAEV, K.TOO_NR, K.PUNKTID, K.FAILINIMI
FROM YLIOPILASED Y, KODUYLESANDED K, OPPEAINED O
WHERE O.KOOD = K.OPPEAINE
AND O.NIMETUS LIKE 'Oracle%' ORDER BY K.TOO_NR ASC;

--tulemused

+-------+--------+----------+------+-------+----------+
|EESNIMI|PERENIMI|KUUPAEV   |TOO_NR|PUNKTID|FAILINIMI |
+-------+--------+----------+------+-------+----------+
|Katrin |Kask    |2025-09-10|1     |5.0    |fail1.txt |
|Virgo  |Pihlakas|2025-09-01|1     |6.0    |fail17.txt|
|Liina  |Vaher   |2025-09-10|1     |5.0    |fail1.txt |
|Sirje  |Sarapuu |2025-09-10|1     |5.0    |fail1.txt |
|Virgo  |Pihlakas|2025-09-10|1     |5.0    |fail1.txt |
|Katrin |Kask    |2025-09-11|1     |7.0    |fail2.txt |
|Tarmo  |Kuusk   |2025-09-11|1     |7.0    |fail2.txt |
|Liina  |Vaher   |2025-09-11|1     |7.0    |fail2.txt |
|Sirje  |Sarapuu |2025-09-11|1     |7.0    |fail2.txt |
|Virgo  |Pihlakas|2025-09-11|1     |7.0    |fail2.txt |
|Tarmo  |Kuusk   |2025-09-10|1     |5.0    |fail1.txt |
|Sirje  |Sarapuu |2025-09-01|1     |6.0    |fail17.txt|
|Liina  |Vaher   |2025-09-01|1     |6.0    |fail17.txt|
|Tarmo  |Kuusk   |2025-09-01|1     |6.0    |fail17.txt|
|Katrin |Kask    |2025-09-01|1     |6.0    |fail17.txt|
|Virgo  |Pihlakas|2025-09-09|1     |4.0    |fail14.txt|
|Sirje  |Sarapuu |2025-09-09|1     |4.0    |fail14.txt|
|Liina  |Vaher   |2025-09-09|1     |4.0    |fail14.txt|
|Tarmo  |Kuusk   |2025-09-09|1     |4.0    |fail14.txt|
|Katrin |Kask    |2025-09-09|1     |4.0    |fail14.txt|
|Virgo  |Pihlakas|2025-09-06|1     |10.0   |fail10.txt|
|Sirje  |Sarapuu |2025-09-06|1     |10.0   |fail10.txt|
|Liina  |Vaher   |2025-09-06|1     |10.0   |fail10.txt|
|Tarmo  |Kuusk   |2025-09-06|1     |10.0   |fail10.txt|
|Katrin |Kask    |2025-09-06|1     |10.0   |fail10.txt|
|Katrin |Kask    |2025-09-08|2     |8.0    |fail11.txt|
|Katrin |Kask    |2025-09-12|2     |7.0    |fail3.txt |
|Liina  |Vaher   |2025-09-08|2     |8.0    |fail11.txt|
|Sirje  |Sarapuu |2025-09-08|2     |8.0    |fail11.txt|
|Virgo  |Pihlakas|2025-09-08|2     |8.0    |fail11.txt|
|Katrin |Kask    |2025-09-17|2     |6.0    |fail16.txt|
|Tarmo  |Kuusk   |2025-09-17|2     |6.0    |fail16.txt|
|Liina  |Vaher   |2025-09-17|2     |6.0    |fail16.txt|
|Sirje  |Sarapuu |2025-09-17|2     |6.0    |fail16.txt|
|Virgo  |Pihlakas|2025-09-17|2     |6.0    |fail16.txt|
|Virgo  |Pihlakas|2025-09-11|2     |3.0    |fail15.txt|
|Sirje  |Sarapuu |2025-09-11|2     |3.0    |fail15.txt|
|Liina  |Vaher   |2025-09-11|2     |3.0    |fail15.txt|
|Tarmo  |Kuusk   |2025-09-11|2     |3.0    |fail15.txt|
|Katrin |Kask    |2025-09-11|2     |3.0    |fail15.txt|
|Tarmo  |Kuusk   |2025-09-08|2     |8.0    |fail11.txt|
|Tarmo  |Kuusk   |2025-09-12|2     |7.0    |fail3.txt |
|Liina  |Vaher   |2025-09-12|2     |7.0    |fail3.txt |
|Sirje  |Sarapuu |2025-09-12|2     |7.0    |fail3.txt |
|Virgo  |Pihlakas|2025-09-12|2     |7.0    |fail3.txt |
|Katrin |Kask    |2025-09-13|3     |6.0    |fail4.txt |
|Tarmo  |Kuusk   |2025-09-13|3     |6.0    |fail4.txt |
|Liina  |Vaher   |2025-09-13|3     |6.0    |fail4.txt |
|Sirje  |Sarapuu |2025-09-13|3     |6.0    |fail4.txt |
|Virgo  |Pihlakas|2025-09-13|3     |6.0    |fail4.txt |
+-------+--------+----------+------+-------+----------+

--Üliõpilisased, kellel pole ainet ICA0077
SELECT Y.EESNIMI, Y.PERENIMI
FROM YLIOPILASED Y
WHERE NOT EXISTS(
    SELECT K.ID
    FROM KODUYLESANDED K, OPPEAINED O
    WHERE O.KOOD = K.OPPEAINE
    AND O.NIMETUS LIKE 'Riistvaral'
    AND K.YLIOPILANE = Y.ID
)

--tulemused
+-------+--------+
|EESNIMI|PERENIMI|
+-------+--------+
|Virgo  |Pihlakas|
|Tarmo  |Kuusk   |
|Liina  |Vaher   |
|Sirje  |Sarapuu |
|Katrin |Kask    |
+-------+--------+


--Vanavanemate otsimine 

SELECT V.NIMI  AS VANAVANEM, L.NIMI  AS LAPS, LL.NIMI AS LAPSELAPS
FROM SUGUPUU V, SUGUPUU L, SUGUPUU LL
WHERE V.NIMI = 'Pauliine'
  AND (L.EMAKOOD = V.KOOD OR L.ISAKOOD = V.KOOD)
  AND (LL.EMAKOOD = L.KOOD OR LL.ISAKOOD = L.KOOD)
ORDER BY L.NIMI, L.NIMI;

--tulemused

+---------+------+---------+
|VANAVANEM|LAPS  |LAPSELAPS|
+---------+------+---------+
|Pauliine |Karl  |Paul     |
|Pauliine |Karl  |Tarvi    |
|Pauliine |Leena |Olavi    |
|Pauliine |Leena |Siiri    |
|Pauliine |Peeter|Jaana    |
|Pauliine |Peeter|Gustav   |
+---------+------+---------+
