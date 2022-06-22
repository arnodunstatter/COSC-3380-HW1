/* 
Q17: 
Show departure city,arrival city,plane model and status
of flights arrived on time and delayed
departing from Belgorod
Write your query and store the result.
*/

DROP TABLE q17_belgorod;
CREATE TABLE q17_belgorod(
    d_city character(20),
    a_city character(20),
    model character(25),
    status character varying (20)
); 


INSERT INTO q17_belgorod

--for flights which are departing form Belgorod and are either arrived, on time, or delayed
--note: if we include flight_id we see that the otherwise 'duplicate' rows represent different flights
-- SELECT flight_id, departure_airport, arrival_airport, aircraft_code, flight.status
--     FROM airline.flight
--     WHERE departure_airport IN (
--         SELECT airport_code 
--             FROM airline.airport
--             WHERE city ILIKE '%Belgorod%'
--     )
--     AND flight.status IN ('Arrived', 'On Time', 'Delayed');

--result:
--departure_airport | arrival_airport | aircraft_code | status  
-- SELECT DISTINCT departure_airport, arrival_airport, aircraft_code, flight.status
--     FROM airline.flight
--     WHERE departure_airport IN (
--         SELECT airport_code 
--             FROM airline.airport
--             WHERE city ILIKE '%Belgorod%'
--     )
--     AND flight.status IN ('Arrived', 'On Time', 'Delayed');


--join on airport to replace departure_airport with d_city
--                  d_city | arrival_airport | aircraft_code | status  
-- SELECT airport.city AS d_city, a.arrival_airport, a.aircraft_code, a.status
--     FROM(
--         SELECT DISTINCT departure_airport, arrival_airport, aircraft_code, flight.status
--             FROM airline.flight
--             WHERE departure_airport IN (
--                 SELECT airport_code 
--                     FROM airline.airport
--                     WHERE city ILIKE '%Belgorod%'
--             )
--             AND flight.status IN ('Arrived', 'On Time', 'Delayed')
--     ) AS a
--     JOIN airline.airport
--     ON a.departure_airport = airport.airport_code;


--join on airport to replace arrival_airport with a_city
-- SELECT b.d_city, airport.city AS a_city, b.aircraft_code, b.status
--     FROM(
--         SELECT airport.city AS d_city, a.arrival_airport, a.aircraft_code, a.status
--             FROM(
--                 SELECT DISTINCT departure_airport, arrival_airport, aircraft_code, flight.status
--                     FROM airline.flight
--                     WHERE departure_airport IN (
--                         SELECT airport_code 
--                             FROM airline.airport
--                             WHERE city ILIKE '%Belgorod%'
--                     )
--                     AND flight.status IN ('Arrived', 'On Time', 'Delayed')
--             ) AS a
--             JOIN airline.airport
--             ON a.departure_airport = airport.airport_code
--     ) AS b
--     JOIN airline.airport
--     ON b.arrival_airport = airport.airport_code;

--join on aircraftto replace aircraft_code with model

--Name: Arno Dunstatter
--PSID: 1926976
SELECT c.d_city, c.a_city, aircraft.model, c.status
    FROM(
        SELECT b.d_city, airport.city AS a_city, b.aircraft_code, b.status
            FROM(
                SELECT airport.city AS d_city, a.arrival_airport, a.aircraft_code, a.status
                    FROM(
                        SELECT DISTINCT departure_airport, arrival_airport, aircraft_code, flight.status
                            FROM airline.flight
                            WHERE departure_airport IN (
                                SELECT airport_code 
                                    FROM airline.airport
                                    WHERE city ILIKE '%Belgorod%'
                            )
                            AND flight.status IN ( 'Arrived', 'Delayed') --Originally I had: ('Arrived', 'On Time', 'Delayed'), then ('On Time', 'Delayed')
                    ) AS a
                    JOIN airline.airport
                        ON a.departure_airport = airport.airport_code
            ) AS b
            JOIN airline.airport
                ON b.arrival_airport = airport.airport_code
    ) AS c
    JOIN airline.aircraft
        ON c.aircraft_code = aircraft.aircraft_code;

SELECT * FROM q17_belgorod;