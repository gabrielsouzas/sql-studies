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