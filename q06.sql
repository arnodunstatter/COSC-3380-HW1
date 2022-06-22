/*
Q06: how many unique airports are there considering departures in a flight?
Write your query and store the result.
*/

-- DROP TABLE dbs031.q06_available_airports;
-- CREATE TABLE dbs031.q06_available_airports(
--     airports int
-- ); 


-- INSERT INTO dbs031.q06_available_airports
-- SELECT count(departure_airport) 
--     FROM (
--         SELECT departure_airport
--             FROM airline.flight
--             WHERE scheduled_departure IS NOT NULL
--             GROUP BY departure_airport
--     ) AS airportsWithDepartures;

-- SELECT * FROM dbs031.q06_available_airports;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q06_available_airports;
CREATE TABLE q06_available_airports(
    airports int
); 


INSERT INTO q06_available_airports
SELECT count(departure_airport) 
    FROM (
        SELECT departure_airport
            FROM airline.flight
            WHERE scheduled_departure IS NOT NULL
            GROUP BY departure_airport
    ) AS airportsWithDepartures;
