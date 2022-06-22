/* Q16: 
list full airplane model name and city for flights 
where an Airbus airplane departs from or arrives to 
Write your query and store the result.
*/

DROP TABLE q16_airbus_city;
CREATE TABLE q16_airbus_city(
    model character(25),
    city character(20)
); 

INSERT INTO q16_airbus_city

--The code block below gets the aircraft_code and airport_code for Airbus flights coming or going from that airport
--result is aircraft_code|airport_code
-- SELECT aircraft_code, departure_airport AS airport FROM airline.flight
--     WHERE aircraft_code IN (
--         SELECT aircraft_code FROM airline.aircraft
--         WHERE model ILIKE '%Airbus%'
--     )
-- UNION 
-- SELECT aircraft_code, arrival_airport AS airport FROM airline.flight
--     WHERE aircraft_code IN (
--         SELECT aircraft_code FROM airline.aircraft
--         WHERE model ILIKE '%Airbus%'
--     );

--now we want to substitute the airport for the city with a join
--result is aircraft_code | city
-- SELECT DISTINCT x.aircraft_code, airport.city
--     FROM(
--         SELECT aircraft_code, departure_airport AS airport FROM airline.flight
--             WHERE aircraft_code IN (
--                 SELECT aircraft_code FROM airline.aircraft
--                 WHERE model ILIKE '%Airbus%'
--             )
--         UNION 
--         SELECT aircraft_code, arrival_airport AS airport FROM airline.flight
--             WHERE aircraft_code IN (
--                 SELECT aircraft_code FROM airline.aircraft
--                 WHERE model ILIKE '%Airbus%'
--             )
--     ) AS x
--     JOIN airline.airport
--     ON x.airport = airport.airport_code;
 
--now we want to substitute model names for aircraft_codes

--Name: Arno Dunstatter
--PSID: 1926976
SELECT aircraft.model, y.city
    FROM(
        SELECT DISTINCT x.aircraft_code, airport.city
            FROM(
                SELECT aircraft_code, departure_airport AS airport FROM airline.flight
                    WHERE aircraft_code IN (
                        SELECT aircraft_code FROM airline.aircraft
                        WHERE model ILIKE '%Airbus%'
                    )
                UNION 
                SELECT aircraft_code, arrival_airport AS airport FROM airline.flight
                    WHERE aircraft_code IN (
                        SELECT aircraft_code FROM airline.aircraft
                        WHERE model ILIKE '%Airbus%'
                    )
            ) AS x
            JOIN airline.airport
                ON x.airport = airport.airport_code
    ) AS y
    JOIN airline.aircraft
        ON y.aircraft_code = aircraft.aircraft_code
    ORDER BY city, model;

SELECT * FROM q16_airbus_city;