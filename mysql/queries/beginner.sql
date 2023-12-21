# TABLE

CREATE TABLE
    `station` (
        `id` int NOT NULL AUTO_INCREMENT,
        `city` varchar(21) NOT NULL,
        `state` varchar(2) NOT NULL,
        `lat_n` decimal(10, 0) NOT NULL,
        `long_w` decimal(10, 0) NOT NULL,
        PRIMARY KEY (`id`)
    );

# List of city names where the first letter is a vowel, with no duplicates cities in response.

SELECT DISTINCT CITY
FROM STATION
WHERE
    FIND_IN_SET(LEFT(CITY, 1), "a,e,i,o,u")
# Last letter

SELECT DISTINCT CITY
FROM STATION
WHERE
    FIND_IN_SET(RIGHT(CITY, 1), "a,e,i,o,u")
# Both sides

SELECT DISTINCT CITY
FROM STATION
WHERE
    FIND_IN_SET(RIGHT(CITY, 1), "a,e,i,o,u")
    AND FIND_IN_SET(LEFT(CITY, 1), "a,e,i,o,u")
# Not a vowel in the first letter

SELECT DISTINCT CITY
FROM STATION
WHERE
    NOT FIND_IN_SET(LEFT(CITY, 1), "a,e,i,o,u")
# Not a vowel in the first or last letter

SELECT DISTINCT CITY
FROM STATION
WHERE
    NOT FIND_IN_SET(RIGHT(CITY, 1), "a,e,i,o,u")
    OR NOT FIND_IN_SET(LEFT(CITY, 1), "a,e,i,o,u");

# Not a vowel in the first and last letter

SELECT DISTINCT CITY
FROM STATION
WHERE
    NOT FIND_IN_SET(RIGHT(CITY, 1), "a,e,i,o,u")
    AND NOT FIND_IN_SET(LEFT(CITY, 1), "a,e,i,o,u");

# New TABLE

CREATE TABLE
    `students` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(95) NOT NULL,
        `marks` INT NOT NULL,
        PRIMARY KEY (`id`)
    );

INSERT INTO `students` (`name`, `marks`) VALUES ('Ashley', '81');

INSERT INTO `students` (`name`, `marks`) VALUES ('Samantha', '75');

INSERT INTO `students` (`name`, `marks`) VALUES ('Julia', '76');

INSERT INTO `students` (`name`, `marks`) VALUES ('Belvet', '84');

# Order by last three characters and id

SELECT name
FROM students
WHERE marks > 75
ORDER BY
    RIGHT(name, 3),
    id ASC;

# Checking if a triangle is

# Equilateral: It's a triangle with  sides of equal length.

# Isosceles: It's a triangle with  sides of equal length.

# Scalene: It's a triangle with  sides of differing lengths.

# Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
    CASE
        WHEN A + B <= C
        OR A + C <= B
        OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B
        AND B = C THEN 'Equilateral'
        WHEN A = B
        OR B = C
        OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;

# New TABLE

CREATE TABLE
    `occupation` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(90) NOT NULL,
        `occupation` VARCHAR(90) NOT NULL,
        PRIMARY KEY (`id`)
    );

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Samantha', 'Doctor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Julia', 'Actor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Maria', 'Actor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Meera', 'Singer');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Ashley', 'Professor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Kety', 'Professor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Christeen', 'Professor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Jane', 'Actor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Jenny', 'Doctor');

INSERT INTO
    `occupation` (`name`, `occupation`)
VALUES ('Priya', 'Singer');

# Alphabetically ordered list of all names in OCCUPATION

SELECT
    CONCAT(
        name,
        '(',
        LEFT(occupation, 1),
        ')'
    ) AS result
FROM occupations
ORDER BY name ASC;

# Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order:

SELECT
    CONCAT(
        'There are a total of ',
        COUNT(occupation),
        ' ',
        LOWER(occupation),
        's.'
    ) AS result
FROM occupation
GROUP BY occupation
ORDER BY
    COUNT(occupation) ASC,
    occupation ASC;

# ----

SELECT
    hackers.hacker_id AS id,
    hackers.name AS name, (
        SELECT
            COUNT(challenges.challenge_id)
        FROM challenges
        WHERE
            hackers.hacker_id = challenges.hacker_id
    ) AS challenges_count
FROM hackers
ORDER BY
    challenges_count DESC,
    id
# Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to 4 decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
        SELECT MIN(LAT_N)
        FROM STATION
        WHERE LAT_N > 38.7780
    );

# Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4  decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
        SELECT MAX(LAT_N)
        FROM STATION
        WHERE LAT_N < 137.2345
    );

# Consider POINT_ONE(A,B) and POINT_TWO(C,D) to be two points on a 2D plane.

# A is the minimum value in LAT_N;

# B is the minimum value in LONG_W;

# C is the maximum value in LAT_N;

# D is the maximum value in LONG_W;

# Query the Manhattan Distance between points  and  and round it to a scale of 4 decimal places.

SELECT
    ROUND(
        ABS( (MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W))
        ),
        4
    )
FROM STATION
# Sum population from city where continent = Asia

CREATE TABLE
    CITY (
        ID INT NOT NULL AUTO_INCREMENT,
        POPULATION NUMBER,
        COUNTRYCODE INT,
        PRIMARY KEY(ID)

)

SELECT SUM(city.population)
FROM CITY
    INNER JOIN country ON country.code = city.countrycode
WHERE
    country.continent = 'Asia';