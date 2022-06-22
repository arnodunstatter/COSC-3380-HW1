--Q04: how many airports are located in Europe?

-- DROP TABLE dbs031.q04_airport_europe;
-- CREATE TABLE dbs031.q04_airport_europe(
--     airports int
-- ); 

-- INSERT INTO dbs031.q04_airport_europe
-- SELECT count(*)
--     FROM airline.airport
--     WHERE timezone LIKE 'Europe%';

-- SELECT * FROM dbs031.q04_airport_europe;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976

DROP TABLE q04_airport_europe;
CREATE TABLE q04_airport_europe(
    airports int
); 

INSERT INTO q04_airport_europe
SELECT count(*)
    FROM airline.airport
    WHERE timezone LIKE 'Europe%';

SELECT * FROM q04_airport_europe;