/* 
Q13: 
 show the city with lowest ticket sales amount in Economy class
Write your query and store the result.
*/
--for every city sum all economy class tickets departing therefrom and return the minimum
--1)for every flight_id, sum all economy tickets -> flight_id_sum
--2)for every city sum all flight_id_sums which originate in that city -> city_sum
--3)return minimum city and city_sum


DROP TABLE dbs031.q13_ticket_sales;
CREATE TABLE dbs031.q13_ticket_sales(
    city character varying(20),
    amount numeric(6,2)
); 

--sales amount and fare_condition is in ticket_flight
--flight has city
--join on flight_id
--

--INSERT INTO dbs031.q13_ticket_sales

SELECT a.city, b.amount
    FROM(
            SELECT airport.city, min(y.amount) AS amount
                FROM(
                    SELECT x.flight_id, x.amount, departure_airport
                        FROM(
                            SELECT flight_id, min(amount) AS amount
                                FROM airline.ticket_flight
                                WHERE ticket_flight.fare_conditions LIKE '%Economy%'
                                GROUP BY ticket_flight.flight_id
                                ORDER BY ticket_flight.flight_id
                        ) AS x
                        JOIN airline.flight
                        ON x.flight_id = flight.flight_id
                    ) AS y
                JOIN airline.airport
                ON y.departure_airport = airport.airport_code
                GROUP BY airport.city
        ) AS a
    JOIN (
        SELECT MIN(amount) AS amount
            FROM(
                SELECT airport.city, min(y.amount) AS amount
                    FROM(
                        SELECT x.flight_id, x.amount, departure_airport
                            FROM(
                                SELECT flight_id, min(amount) AS amount
                                    FROM airline.ticket_flight
                                    WHERE ticket_flight.fare_conditions LIKE '%Economy%'
                                    GROUP BY ticket_flight.flight_id
                            ) AS x
                            JOIN airline.flight
                            ON x.flight_id = flight.flight_id
                        ) AS y
                    JOIN airline.airport
                    ON y.departure_airport = airport.airport_code
                    GROUP BY airport.city
            ) AS z
    ) AS b
    ON a.amount = b.amount;

    -- SELECT MIN(amount)
    -- FROM(
    --     SELECT airport.city, min(y.amount) AS amount
    --         FROM(
    --             SELECT x.flight_id, x.amount, departure_airport
    --                 FROM(
    --                     SELECT flight_id, min(amount) AS amount
    --                         FROM airline.ticket_flight
    --                         WHERE ticket_flight.fare_conditions LIKE '%Economy%'
    --                         GROUP BY ticket_flight.flight_id
    --                 ) AS x
    --                 JOIN airline.flight
    --                 ON x.flight_id = flight.flight_id
    --             ) AS y
    --         JOIN airline.airport
    --         ON y.departure_airport = airport.airport_code
    --         GROUP BY airport.city
    -- ) AS z;
