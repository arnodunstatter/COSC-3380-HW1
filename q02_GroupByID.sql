--Q02: show passenger name, number of distinct booking ref #, number of tickets  for passengers whose first name is BORIS.  
--Clarification: we want to count number of purchased tickets per passenger, but only when their first name is BORIS 
--(notice this DB does not really have first and last name as separate columns as many modern DBs)

--we are assuming that each passenger is uniquely identified by their passenger_id (there different individuals who share the same name)

--ORIGINAL VERSION BELOW:
SELECT passenger_name, x.passenger_id, y.count_book_ref, y.count_ticket_no FROM ticket AS x
RIGHT JOIN (
    SELECT passenger_id, count(book_ref) AS count_book_ref, count(ticket_no) AS count_ticket_no
    FROM ticket
    WHERE passenger_name LIKE 'BORIS%'
    GROUP BY passenger_id
) AS y ON x.passenger_id = y.passenger_id
ORDER BY passenger_name;