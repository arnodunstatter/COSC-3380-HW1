/*
Q08: total $ amount for bookings in July with cost more than 50,000  
Write your query and store the result.
*/

-- DROP TABLE dbs031.q08_bookings_date;
-- CREATE TABLE dbs031.q08_bookings_date(
--     total_amount numeric(13,2) --changed from `total_amount numeric(11,2)` to prevent overflow
-- ); 

-- INSERT INTO dbs031.q08_bookings_date
-- SELECT SUM(total_amount)
--     FROM
--     (
--         SELECT book_ref, EXTRACT(MONTH FROM book_date) AS month, total_amount
--             FROM airline.booking
--             WHERE total_amount > 50000
--     ) AS x
--     WHERE month = 7;


-- SELECT * FROM dbs031.q08_bookings_date;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q08_bookings_date;
CREATE TABLE q08_bookings_date(
    total_amount numeric(13,2) --changed from `total_amount numeric(11,2)` to prevent overflow
); 

INSERT INTO q08_bookings_date
SELECT SUM(total_amount)
    FROM
    (
        SELECT book_ref, EXTRACT(MONTH FROM book_date) AS month, total_amount
            FROM airline.booking
            WHERE total_amount > 50000
    ) AS x
    WHERE month = 7;


