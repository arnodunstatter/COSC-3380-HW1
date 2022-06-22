/* 
Q09: list cities that have 2 or more airports 
Write your query and store the result.
*/

-- DROP TABLE dbs031.q09_city_airport;
-- CREATE TABLE dbs031.q09_city_airport(
--     city character(20)
-- ); 

-- INSERT INTO dbs031.q09_city_airport
-- SELECT city
--     FROM airline.airport
--     GROUP BY city
--     HAVING count(city) > 1;

-- SELECT * FROM dbs031.q09_city_airport;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976

DROP TABLE q09_city_airport;
CREATE TABLE q09_city_airport(
    city character(20)
); 

INSERT INTO q09_city_airport
SELECT city
    FROM airline.airport
    GROUP BY city
    HAVING count(city) > 1;






