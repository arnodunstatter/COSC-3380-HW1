/*
Q19:
detective question
we do not know first name
show departure city of flights for passengers whose last name is FROLOV
*/
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q19_frolov;
CREATE TABLE q19_frolov(
   city character(20)
);

INSERT INTO q19_frolov
SELECT DISTINCT airport.city
   FROM(
      SELECT DISTINCT departure_airport
      FROM airline.ticket_flight
      JOIN airline.flight 
         ON ticket_flight.flight_id = flight.flight_id
      WHERE ticket_no IN(
         SELECT ticket_no
            FROM airline.ticket
            WHERE passenger_name ILIKE '%FROLOV'
      )
   ) AS x
   JOIN airline.airport
      ON x.departure_airport = airport.airport_code;


SELECT * FROM q19_frolov;