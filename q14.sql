/* 
Q14: # tickets sold and sales amount per fare class, only for arrived flights,
   excluding Business class 
Write your query and store the result.
*/
--for each fare class other than business give the class, number of tickets sold, amount

DROP TABLE q14_fare_tickets;
CREATE TABLE q14_fare_tickets(
    fare_conditions character(7),
    ticket int,
    amount numeric (12,2)
    
); 

--Name: Arno Dunstatter
--PSID: 1926976

INSERT INTO q14_fare_tickets

--this code block gets the fare condition, numberOfTicketsSold, and amount sold for that fare condiiton, but for flights of all statuses (not jsut arrived)
-- SELECT fare_conditions, COUNT(*), SUM(amount) AS fare_condition_amount_sum
--     FROM airline.ticket_flight
--     WHERE fare_conditions NOT LIKE '%Business%'
--     GROUP BY fare_conditions;

--this code block gets the flight_id, fare_condition, and ammount for all flights which have arrived - use as source for the from for the above codeblock
-- SELECT ticket_flight.flight_id, fare_condition, amount
--     FROM airline.ticket_flight
--     JOIN airline.flight
--     ON ticket_flight.flight_id = flight.flight_id
--     WHERE flight.status LIKE '%Arrived%';

--combining them yields:
SELECT fare_conditions, COUNT(*), SUM(amount) AS fare_conditions_amount_sum
    FROM(
        SELECT ticket_flight.flight_id, fare_conditions, amount
            FROM airline.ticket_flight
            JOIN airline.flight
                ON ticket_flight.flight_id = flight.flight_id
            WHERE flight.status LIKE '%Arrived%'
    ) AS x
    WHERE fare_conditions NOT LIKE '%Business%'
    GROUP BY fare_conditions;

SELECT * FROM q14_fare_tickets;