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