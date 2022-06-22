--Q03: list number of seats available per aircraft code in Economy class

-- DROP TABLE dbs031.q03_seats_aircraft;
-- CREATE TABLE dbs031.q03_seats_aircraft(
--     aircraft_code character(3),
--     fare_conditions character(10), --This will just be "Economy" over and over again, and including it makes the SQL needlessly complicated
--     seats int
-- ); 

-- INSERT INTO dbs031.q03_seats_aircraft
-- SELECT aircraft_code, fare_conditions, COUNT(seat_no) FROM airline.seat
--     WHERE fare_conditions = 'Economy'
--     GROUP BY aircraft_code, fare_conditions;

-- SELECT * FROM dbs031.q03_seats_aircraft;

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE q03_seats_aircraft;
CREATE TABLE q03_seats_aircraft(
    aircraft_code character(3),
    fare_conditions character(10), --This will just be "Economy" over and over again, and including it makes the SQL needlessly complicated
    seats int
); 

INSERT INTO q03_seats_aircraft
SELECT aircraft_code, fare_conditions, COUNT(seat_no) FROM airline.seat
    WHERE fare_conditions = 'Economy'
    GROUP BY aircraft_code, fare_conditions;

