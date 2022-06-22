/* Q11: * # of invalid tickets: tickets without a booking
Write your query and store the result..
*/

-- DROP TABLE dbs031.q11_invalid_tickets;
-- CREATE TABLE dbs031.q11_invalid_tickets(
--     num_invalid int
-- ); 


-- INSERT INTO dbs031.q11_invalid_tickets
-- SELECT COUNT(*) 
--     FROM (
--         SELECT ticket_no, airline.ticket.book_ref, book_date
--             FROM airline.ticket
--             LEFT JOIN airline.booking
--                 ON airline.ticket.book_ref = airline.booking.book_ref
--     ) AS x
--     WHERE book_date IS NULL;

-- SELECT * FROM dbs031.q11_invalid_tickets;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q11_invalid_tickets;
CREATE TABLE q11_invalid_tickets(
    num_invalid int
); 


INSERT INTO q11_invalid_tickets
SELECT COUNT(*) 
    FROM (
        SELECT ticket_no, airline.ticket.book_ref, book_date
            FROM airline.ticket
            LEFT JOIN airline.booking
                ON airline.ticket.book_ref = airline.booking.book_ref
    ) AS x
    WHERE book_date IS NULL;

