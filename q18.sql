/* 
Q18: 
show full airplane model name and city for flights 
departing from Europe
exclude duplicate rows
Write your query and store the result.
*/

DROP TABLE q18_departing_europe;
CREATE TABLE q18_departing_europe(
    model character(25),
    city character(20)
); 

INSERT INTO q18_departing_europe

-- for flights leaving europe, get
-- aircraft_code | departure_airport 
-- SELECT flight.aircraft_code, flight.departure_airport
--     FROM airline.flight
--     WHERE flight.departure_airport IN(
--         SELECT airport_code
--             FROM airline.airport
--             WHERE timezone ILIKE '%Europe%'
--     );

--replace departure_airport with departure_city by joining with airport, result:
--         aircraft_code | city   
-- SELECT a.aircraft_code, airport.city
--     FROM(
--         SELECT flight.aircraft_code, flight.departure_airport
--             FROM airline.flight
--             WHERE flight.departure_airport IN(
--                 SELECT airport_code
--                     FROM airline.airport
--                     WHERE timezone ILIKE '%Europe%'
--                 )
--     )  AS a
--     JOIN airline.airport
--     ON a.departure_airport = airport.airport_code;

--replace aircraft_code with model by joining with aircraft, result:

--Name: Arno Dunstatter
--PSID: 1926976

SELECT DISTINCT aircraft.model, b.city
    FROM(
        SELECT a.aircraft_code, airport.city
            FROM(
                SELECT flight.aircraft_code, flight.departure_airport
                    FROM airline.flight
                    WHERE flight.departure_airport IN(
                        SELECT airport_code
                            FROM airline.airport
                            WHERE timezone ILIKE '%Europe%'
                        )
            )  AS a
            JOIN airline.airport
                ON a.departure_airport = airport.airport_code
    ) AS b
    JOIN airline.aircraft
        ON b.aircraft_code = aircraft.aircraft_code
    ORDER BY city;

SELECT * FROM q18_departing_europe;