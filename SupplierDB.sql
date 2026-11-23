/* 1. CREATE DATABASE */

CREATE DATABASE supplier_db;

USE supplier_db;


/* 2. CREATE TABLES */

CREATE TABLE Supplier (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    city VARCHAR(30)
);

CREATE TABLE Parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(30),
    color VARCHAR(20)
);

CREATE TABLE Catalog (
    sid INT,
    pid INT,
    cost DECIMAL(10,2),
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES Supplier(sid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);


/* 3. INSERT RECORDS INTO TABLES */

/* Insert into Supplier */

INSERT INTO Supplier VALUES
(1, 'Acme Widget Suppliers', 'Bengaluru'),
(2, 'Global Suppliers', 'Mumbai'),
(3, 'Prime Suppliers', 'Delhi'),
(4, 'Metro Suppliers', 'Chennai'),
(5, 'Zenith Suppliers', 'Hyderabad');


/* Insert into Parts */

INSERT INTO Parts VALUES
(101, 'Bolt', 'Red'),
(102, 'Nut', 'Blue'),
(103, 'Screw', 'Red'),
(104, 'Washer', 'Green'),
(105, 'Gear', 'Yellow');


/* Insert into Catalog */

INSERT INTO Catalog VALUES
(1, 101, 10.00),
(1, 102, 20.00),
(1, 103, 30.00),
(1, 104, 40.00),
(1, 105, 50.00),

(2, 101, 15.00),
(2, 102, 18.00),
(2, 103, 35.00),
(2, 104, 35.00),

(3, 101, 12.00),
(3, 103, 25.00),
(3, 104, 45.00),

(4, 102, 25.00),
(4, 103, 32.00),
(4, 104, 38.00),

(5, 101, 8.00),
(5, 102, 22.00),
(5, 104, 42.00);


/* Display all tables */

SELECT * FROM Supplier;
SELECT * FROM Parts;
SELECT * FROM Catalog;


/*========================================================
  4. FIND THE PNAMES OF PARTS FOR WHICH THERE IS SOME
     SUPPLIER.
========================================================== */

SELECT DISTINCT p.pname
FROM Parts p
JOIN Catalog c ON p.pid = c.pid;


/*========================================================
  5. FIND THE SNAMES OF SUPPLIERS WHO SUPPLY EVERY PART.
========================================================== */

SELECT s.sname
FROM Supplier s
WHERE NOT EXISTS
(
    SELECT *
    FROM Parts p
    WHERE NOT EXISTS
    (
        SELECT *
        FROM Catalog c
        WHERE c.sid = s.sid
        AND c.pid = p.pid
    )
);


/*========================================================
  6. FIND THE SNAMES OF SUPPLIERS WHO SUPPLY EVERY RED PART.
========================================================== */

SELECT s.sname
FROM Supplier s
WHERE NOT EXISTS
(
    SELECT *
    FROM Parts p
    WHERE p.color = 'Red'
    AND NOT EXISTS
    (
        SELECT *
        FROM Catalog c
        WHERE c.sid = s.sid
        AND c.pid = p.pid
    )
);


/*========================================================
  7. FIND THE PNAMES OF PARTS SUPPLIED BY ACME WIDGET
     SUPPLIERS AND BY NO ONE ELSE.
========================================================== */

SELECT p.pname
FROM Parts p
JOIN Catalog c ON p.pid = c.pid
JOIN Supplier s ON c.sid = s.sid
WHERE s.sname = 'Acme Widget Suppliers'
AND NOT EXISTS
(
    SELECT *
    FROM Catalog c1
    WHERE c1.pid = p.pid
    AND c1.sid <> s.sid
);


/*========================================================
  8. FIND THE SIDS OF SUPPLIERS WHO CHARGE MORE FOR
     SOME PART THAN THE AVERAGE COST OF THAT PART.
========================================================== */

SELECT DISTINCT c.sid
FROM Catalog c
WHERE c.cost >
(
    SELECT AVG(c1.cost)
    FROM Catalog c1
    WHERE c1.pid = c.pid
);


/*========================================================
  9. FOR EACH PART, FIND THE SNAME OF THE SUPPLIER
     WHO CHARGES THE MOST FOR THAT PART.
========================================================== */

SELECT p.pname, s.sname, c.cost
FROM Catalog c
JOIN Supplier s ON c.sid = s.sid
JOIN Parts p ON c.pid = p.pid
WHERE c.cost =
(
    SELECT MAX(c1.cost)
    FROM Catalog c1
    WHERE c1.pid = c.pid
);


/*========================================================
                    END OF PROGRAM 7
========================================================== */
