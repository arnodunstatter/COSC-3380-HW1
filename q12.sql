/* 
Q12: show departure, arrival city, and number of flights,
 but only for delayed flights on a Boeing airplane. 
Write your query and store the result.
*/

-- DROP TABLE dbs031.q12_delayed_boeing;
-- CREATE TABLE dbs031.q12_delayed_boeing(
--     departure_airport character(3),
--     arrival_airport character(3),
--     flights int
-- ); 

-- INSERT INTO dbs031.q12_delayed_boeing
-- SELECT departure_airport, arrival_airport, count(*)
--     FROM airline.flight
--     WHERE flight.status LIKE 'Delayed%' AND aircraft_code LIKE '7%'
--     GROUP BY departure_airport, arrival_airport;

-- SELECT * FROM dbs031.q12_delayed_boeing;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q12_delayed_boeing;
CREATE TABLE q12_delayed_boeing(
    -- departure_airport character(3),
    -- arrival_airport character(3),
    -- flights int
    departure_airport character(20), --they're called "airports" but they're really cities
    arrival_airport character(20),
    flights int
); 



INSERT INTO q12_delayed_boeing
SELECT y.departure_airport AS departure_airport, airport.city AS arrival_airport, y.count as flights
    FROM(
        SELECT airport.city AS departure_airport, x.arrival_airport AS arrival_airport, x.count 
            FROM(
                SELECT departure_airport, arrival_airport, count(*) AS count
                    FROM airline.flight
                    WHERE flight.status LIKE 'Delayed%' AND aircraft_code LIKE '7%'
                    GROUP BY departure_airport, arrival_airport
            ) AS x
            JOIN airline.airport
                ON x.departure_airport = airport.airport_code
    ) AS y
    JOIN airline.airport   
        ON y.arrival_airport = airport.airport_code;

SELECT * FROM q12_delayed_boeing;