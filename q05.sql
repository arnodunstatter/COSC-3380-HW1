/* Q05: 
is there any aircraft model without any flight, 
i.e. an airplane that is not used at all on any flight; 
answer must be t (true) or f (false)
*/

-- DROP TABLE dbs031.q05_no_flight;
-- CREATE TABLE dbs031.q05_no_flight(
--     noflight boolean
-- ); 

-- INSERT INTO dbs031.q05_no_flight
-- SELECT EXISTS (
--     SELECT x.aircraft_code, y.count 
--         FROM airline.aircraft AS x
--         FULL OUTER JOIN (
--             SELECT count(*) AS count, aircraft_code 
--                 FROM airline.flight
--                 GROUP BY aircraft_code
--         ) AS y
--             ON x.aircraft_code = y.aircraft_code
--         WHERE count IS NULL
-- );

-- SELECT * FROM dbs031.q05_no_flight;

--FOR GRADING:--Name: Arno Dunstatter
--PSID: 1926976

DROP TABLE q05_no_flight;
CREATE TABLE q05_no_flight(
    noflight boolean
); 

INSERT INTO q05_no_flight
SELECT EXISTS (
    SELECT x.aircraft_code, y.count 
        FROM airline.aircraft AS x
        FULL OUTER JOIN (
            SELECT count(*) AS count, aircraft_code 
                FROM airline.flight
                GROUP BY aircraft_code
        ) AS y
            ON x.aircraft_code = y.aircraft_code
        WHERE count IS NULL
);



