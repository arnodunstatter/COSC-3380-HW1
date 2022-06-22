/* 
Q10: show the earliest and latest dates across all booked flights, 
   i.e. to have an idea the time span of the database.
   Show date information, without time of day 
Write your query and store the result.
*/

-- DROP TABLE dbs031.q10_span_date;
-- CREATE TABLE dbs031.q10_span_date(
--     earliest date,
--     latest date
-- ); 


-- INSERT INTO dbs031.q10_span_date
-- SELECT CAST(MIN(book_date) AS DATE), CAST(MAX(book_date) AS DATE) 
--     FROM airline.booking;

-- SELECT * FROM dbs031.q10_span_date;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q10_span_date;
CREATE TABLE q10_span_date(
    earliest date,
    latest date
); 


INSERT INTO q10_span_date
SELECT CAST(MIN(book_date) AS DATE), CAST(MAX(book_date) AS DATE) 
    FROM airline.booking;


