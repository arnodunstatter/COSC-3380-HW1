/* 
Q15: 
  show passenger name, flight_id,scheduled departure date/time
     , departing airport,arrival airport
  for delayed flights arriving in Moscow departing from any airport
Write your query and store the result.
*/

DROP TABLE q15_delayed_moscow;
CREATE TABLE q15_delayed_moscow(
    passenger_name character varying(20),
    flight_id int,
    scheduled_departure timestamptz,
    departure_airport character(3),
    arrival_airport character(3) 
    
); 


INSERT INTO q15_delayed_moscow

--first let's get flight_ids and flight_nos, and scheduled_departure for delayed flights into moscow
-- SELECT flight_id, scheduled_departure, departure_airport, arrival_airport
--   FROM airline.flight
--   WHERE flight.status ILIKE '%Delayed%' AND arrival_airport IN
--   (
--     SELECT airport_code 
--     FROM airline.airport
--     WHERE city ILIKE '%Moscow%'
--   );

--join the above with ticket_flight on flight_id to get the following:
--ticket_flight.ticket_no, x.flight_id, x.scheduled_departure, x.departure_airport, x.arrival_airport
-- SELECT ticket_flight.ticket_no, x.flight_id, x.scheduled_departure, x.departure_airport, x.arrival_airport
--   FROM(
--     SELECT flight_id, scheduled_departure, departure_airport, arrival_airport
--       FROM airline.flight
--       WHERE flight.status ILIKE '%Delayed%' AND arrival_airport IN
--       (
--         SELECT airport_code 
--         FROM airline.airport
--         WHERE city ILIKE '%Moscow%'
--       )
--   ) AS x
--   JOIN airline.ticket_flight
--   ON x.flight_id = ticket_flight.flight_id;

--Name: Arno Dunstatter
--PSID: 1926976

SELECT DISTINCT ticket.passenger_name, y.flight_id, y.scheduled_departure, y.departure_airport, y.arrival_airport
FROM(
  SELECT ticket_flight.ticket_no, x.flight_id, x.scheduled_departure, x.departure_airport, x.arrival_airport
    FROM(
      SELECT flight_id, scheduled_departure, departure_airport, arrival_airport
        FROM airline.flight
        WHERE flight.status ILIKE '%Delayed%' AND arrival_airport IN
        (
          SELECT airport_code 
          FROM airline.airport
          WHERE city ILIKE '%Moscow%'
        )
    ) AS x
    JOIN airline.ticket_flight
      ON x.flight_id = ticket_flight.flight_id
) AS y
JOIN airline.ticket
  ON y.ticket_no = ticket.ticket_no;

SELECT * FROM q15_delayed_moscow;