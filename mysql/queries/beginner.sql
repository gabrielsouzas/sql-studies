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