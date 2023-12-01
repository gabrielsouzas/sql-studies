# Find Root, Leaf and Inner in a Binary Tree

CREATE TABLE
    bst (
        n INTEGER PRIMARY KEY,
        p INTEGER NOT NULL
    )

INSERT INTO bst (n, p) VALUES(1, 2);

INSERT INTO bst (n, p) VALUES(3, 2);

INSERT INTO bst (n, p) VALUES(5, 6);

INSERT INTO bst (n, p) VALUES(7, 6);

INSERT INTO bst (n, p) VALUES(2, 4);

INSERT INTO bst (n, p) VALUES(6, 4);

INSERT INTO bst (n, p) VALUES(4, 15);

INSERT INTO bst (n, p) VALUES(8, 9);

INSERT INTO bst (n, p) VALUES(10, 9);

INSERT INTO bst (n, p) VALUES(12, 13);

INSERT INTO bst (n, p) VALUES(14, 13);

INSERT INTO bst (n, p) VALUES(9, 11);

INSERT INTO bst (n, p) VALUES(13, 11);

INSERT INTO bst (n, p) VALUES(11, 15);

INSERT INTO bst (n, p) VALUES(15, NULL);

SELECT
    CASE
        WHEN p IS NULL THEN CONCAT(n, ' Root')
        WHEN n IN (
            SELECT DISTINCT p
            FROM
                bst
        ) THEN CONCAT(n, ' Inner')
        ELSE CONCAT(n, ' Leaf')
    END
FROM bst
ORDER BY n;

# Query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers

CREATE TABLE
    employee (
        employee_id INT NOT NULL AUTO INCREMENT,
        name VARCHAR(60),
        months INT,
        salary INT,
        PRIMARY KEY (employee_id)
    );

SELECT
    MAX(months * salary),
    COUNT(
        CASE
            WHEN (months * salary) = (
                SELECT MAX(months * salary)
                FROM
                    employee
            ) THEN 1
            ELSE NULL
        END
    ) AS contagem_maximo
FROM employee;