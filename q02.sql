--Q02: show passenger name, number of distinct booking ref #, number of tickets  for passengers whose first name is BORIS.  
--Clarification: we want to count number of purchased tickets per passenger, but only when their first name is BORIS 
--(notice this DB does not really have first and last name as separate columns as many modern DBs)

--we are assuming that each passenger is uniquely identified by their passenger_name (there are no two individuals with the same name)

-- DROP TABLE dbs031.q02_boris;
-- CREATE TABLE dbs031.q02_boris(
--     passenger_name text, 
--     number_of_booking int,
--     number_of_tickets int
-- ); 

-- INSERT INTO dbs031.q02_boris
-- SELECT passenger_name, count(book_ref), count(ticket_no)
--     FROM airline.ticket
--     WHERE passenger_name LIKE 'BORIS%'
--     GROUP BY passenger_name;

-- SELECT * FROM dbs031.q02_boris;

--For Grading:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q02_boris;
CREATE TABLE q02_boris(
    passenger_name text, 
    number_of_booking int,
    number_of_tickets int
); 

INSERT INTO q02_boris
SELECT passenger_name, count(book_ref), count(ticket_no)
    FROM airline.ticket
    WHERE passenger_name LIKE 'BORIS%'
    GROUP BY passenger_name;

