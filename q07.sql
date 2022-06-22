/* 
Q07: list ticket reference code and corresponding number of passengers 
        with exactly 3 passengers traveling together
        and whose reference code starts with 04F 
*/

-- DROP TABLE dbs031.q07_bookings_passenger;
-- CREATE TABLE dbs031.q07_bookings_passenger(
--     book_ref character(6),
--     passengers int
-- ); 

-- INSERT INTO dbs031.q07_bookings_passenger
-- SELECT book_ref, count
--     FROM 
--     (
--         SELECT book_ref, count(book_ref)
--             FROM airline.ticket
--             WHERE book_ref LIKE '04F%'
--             GROUP BY book_ref
--     ) AS x
--     WHERE count = 3;

-- SELECT * FROM dbs031.q07_bookings_passenger;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q07_bookings_passenger;
CREATE TABLE q07_bookings_passenger(
    book_ref character(6),
    passengers int
); 

INSERT INTO q07_bookings_passenger
SELECT book_ref, count
    FROM 
    (
        SELECT book_ref, count(book_ref)
            FROM airline.ticket
            WHERE book_ref LIKE '04F%'
            GROUP BY book_ref
    ) AS x
    WHERE count = 3;


