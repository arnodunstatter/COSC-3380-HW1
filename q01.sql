--Q01: count unique airplane models and maximum range for Boeing models
--Question wording is ambiguous. I am interpretting it as follows:
--For planes made by Boeing: Find both the count of unique airplane models and the maximum range

-- DROP TABLE IF EXISTS dbs031.q01_boeing;
-- CREATE TABLE dbs031.q01_boeing(
--     models int,
--     range int
-- ); 

-- INSERT INTO dbs031.q01_boeing
-- SELECT count(model) AS models, max(range) AS range
--     FROM airline.aircraft
--     WHERE model LIKE 'Boeing%';

-- SELECT * FROM dbs031.q01_boeing; 

--FOR GRADING:
--Name: Arno Dunstatter
--PSID: 1926976
DROP TABLE IF EXISTS q01_boeing;
CREATE TABLE q01_boeing(
    models int,
    range int
); 

INSERT INTO q01_boeing
SELECT count(model) AS models, max(range) AS range
    FROM airline.aircraft
    WHERE model LIKE 'Boeing%';

 