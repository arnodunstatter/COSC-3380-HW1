/* 
Q13: 
 show the city with lowest ticket sales amount in Economy class
Write your query and store the result.
*/
--for every city sum all economy class tickets departing therefrom and return the minimum
--1)for every flight_id, sum all economy tickets -> flight_id_sum
--2)for every city sum all flight_id_sums which originate in that city -> city_sum
--3)return minimum city and city_sum


DROP TABLE q13_ticket_sales;
CREATE TABLE q13_ticket_sales(
    city character varying(20),
    amount numeric(8,2)
); 

--sales amount and fare_condition is in ticket_flight
--flight has city
--join on flight_id
--

INSERT INTO q13_ticket_sales

--1)
-- SELECT flight_id, sum(amount) as flight_id_sum
-- FROM airline.ticket_flight
-- WHERE fare_conditions LIKE '%Economy%'
-- GROUP BY flight_id
-- ORDER BY flight_id_sum;


--2] departure_airport_code | departure_airport_sum
-- SELECT departure_airport, sum(flight_id_sum) AS departure_airport_sum
--     FROM(
--         SELECT flight.departure_airport, sum(ticket_flight.amount) AS flight_id_sum
--             FROM airline.ticket_flight
--             JOIN airline.flight
--             ON ticket_flight.flight_id = flight.flight_id
--             WHERE fare_conditions ILIKE '%Economy'
--             GROUP BY ticket_flight.flight_id, departure_airport
--             ORDER BY departure_airport
--     ) AS x
--     GROUP BY departure_airport
--     ORDER BY departure_airport;

--3] swap airport_code for city, sum flight_id_sum and group by city
-- SELECT airport.city, sum(x.flight_id_sum) AS departure_airport_sum
--     FROM(
--         SELECT flight.departure_airport, sum(ticket_flight.amount) AS flight_id_sum
--             FROM airline.ticket_flight
--             JOIN airline.flight
--             ON ticket_flight.flight_id = flight.flight_id
--             WHERE fare_conditions ILIKE '%Economy'
--             GROUP BY ticket_flight.flight_id, departure_airport
--             ORDER BY departure_airport
--     ) AS x
--     JOIN airline.airport
--     ON x.departure_airport = airport.airport_code
--     GROUP BY city
--     ORDER BY departure_airport_sum;

--4] LIMIT 1 (OFFSET 0)
SELECT airport.city, sum(x.flight_id_sum) AS departure_airport_sum
    FROM(
        SELECT flight.departure_airport, sum(ticket_flight.amount) AS flight_id_sum
            FROM airline.ticket_flight
            JOIN airline.flight
                ON ticket_flight.flight_id = flight.flight_id
            WHERE fare_conditions ILIKE '%Economy'
            GROUP BY ticket_flight.flight_id, departure_airport
            ORDER BY departure_airport
    ) AS x
    JOIN airline.airport
        ON x.departure_airport = airport.airport_code
    GROUP BY city
    ORDER BY departure_airport_sum
    LIMIT 1;

--check Ulyanovsky (140073000 from q13.sql, checks out from 3] ) and Moscow (didn't check)

SELECT * FROM q13_ticket_sales;