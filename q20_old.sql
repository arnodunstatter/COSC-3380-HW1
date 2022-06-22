/*
Q20
show #tickets,total $ spent, and # of tickets bought for each different month
for passenger SERGEY RODIONOV
*/

DROP TABLE q20_sergey;
CREATE TABLE q20_sergey(
   tickets int,
   spent numeric(9,2)
);

-- SELECT COUNT(*), SUM(a.amount)
--    FROM(
--       SELECT ticket_flight.flight_id, ticket_flight.amount
--          FROM airline.ticket
--          JOIN airline.ticket_flight
--          ON ticket.ticket_no = ticket_flight.ticket_no
--          WHERE passenger_name ILIKE 'SERGEY RODIONOV'
--       ) AS a
--    JOIN airline.flight
--    ON a.flight_id = flight.flight_id
--    GROUP BY EXTRACT(flight.dep)
--       ;

-- SELECT COUNT(*), SUM(booking.total_amount), EXTRACT(MONTH FROM booking.book_date)
--    FROM airline.ticket
--    JOIN airline.booking
--       ON ticket.book_ref = booking.book_ref
--    WHERE ticket.passenger_name ILIKE 'SERGEY RODIONOV'
--    GROUP BY EXTRACT(MONTH FROM booking.book_date);

--Name: Arno Dunstatter
--PSID: 1926976
INSERT INTO q20_sergey
SELECT COUNT(*), sum(amount)
   FROM(
      SELECT ticket_flight.amount, ticket.book_ref
         FROM airline.ticket_flight
         JOIN airline.ticket
            ON ticket_flight.ticket_no = ticket.ticket_no
         WHERE ticket.passenger_name ILIKE 'SERGEY RODIONOV'
   ) AS a
   JOIN airline.booking
      ON a.book_ref = booking.book_ref
   GROUP BY EXTRACT(MONTH FROM booking.book_date);

   SELECT * FROM q20_sergey;