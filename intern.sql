CREATE TABLE Company (
    companyID      INT PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    industry       VARCHAR(100),
    location       VARCHAR(100)
);
CREATE TABLE User (
    userID         INT PRIMARY KEY,
    companyID      INT NOT NULL,
    name           VARCHAR(100) NOT NULL,
    role           VARCHAR(50),
    experienceYears INT,
    FOREIGN KEY (companyID) REFERENCES Company(companyID)
);
CREATE TABLE Machine (
    machineID      INT PRIMARY KEY,
    companyID      INT NOT NULL,
    model          VARCHAR(100),
    type           VARCHAR(50),
    FOREIGN KEY (companyID) REFERENCES Company(companyID)
);
CREATE TABLE AccountCategory (
    categoryID     INT PRIMARY KEY,
    name           VARCHAR(100) UNIQUE
);
CREATE TABLE InvoiceSequence (
    seqID          INT PRIMARY KEY,
    userID         INT NOT NULL,
    startNo        INT NOT NULL,
    endNo          INT NOT NULL,
    year           INT,
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Invoice (
    invoiceID      INT PRIMARY KEY,
    seqID          INT NOT NULL,
    invoiceNo      INT NOT NULL,
    invoiceDate    DATE,
    totalAmount    DECIMAL(12,2),
    FOREIGN KEY (seqID) REFERENCES InvoiceSequence(seqID)
    -- Optionally, a UNIQUE(seqID, invoiceNo) could be enforced to prevent duplicates 
);

CREATE TABLE TransactionRecord (
    transID        INT PRIMARY KEY,
    invoiceID      INT NOT NULL,
    accountCategoryID INT NOT NULL,
    userID         INT NOT NULL,
    machineID      INT,
    amount         DECIMAL(12,2),
    timestamp      DATETIME,
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID),
    FOREIGN KEY (accountCategoryID) REFERENCES AccountCategory(categoryID),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (machineID) REFERENCES Machine(machineID)
);
CREATE TABLE MachineLog (
    logID          INT PRIMARY KEY,
    machineID      INT NOT NULL,
    userID         INT NOT NULL,
    invoiceNo      INT,
    operationType  VARCHAR(20),
    timestamp      DATETIME,
    FOREIGN KEY (machineID) REFERENCES Machine(machineID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);
CREATE TABLE ErrorLog (
    errorID        INT PRIMARY KEY,
    userID         INT NOT NULL,
    invoiceID      INT,
    type           VARCHAR(50),
    description    VARCHAR(255),
    timestamp      DATETIME,
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID)
);

/* ------------------------------------------------------------------
   Sample‑data load script for the Accounting‑Behaviour database
------------------------------------------------------------------ */

SET FOREIGN_KEY_CHECKS = 0;   -- temporarily relax FK constraints
START TRANSACTION;

/* 1. Company ------------------------------------------------------ */
INSERT INTO Company (companyID, name, industry, location) VALUES
(1, 'Brightstar Manufacturing Co.', 'Manufacturing',       'USA'),
(2, 'Nimbus Tech Solutions Ltd.',   'IT Services',         'UK'),
(3, 'Greenfield Retail Corp.',      'Retail',              'China'),
(4, 'FinEdge Finance Inc.',         'Financial Services',  'USA'),
(5, 'MediHealth Partners LLC',      'Healthcare',          'Canada');

/* 2. User ---------------------------------------------------------- */
INSERT INTO User (userID, companyID, name, role, experienceYears) VALUES
(1, 1,  'Alice Chan',   'Accountant',        5),
(2, 2,  'Bob Smith',    'Accountant',        3),
(3, 3,  'Charlie Li',   'Accountant',        4),
(4, 4,  'Diana Garcia', 'Accountant',        6),
(5, 5,  'Evan Patel',   'Accounting Manager',10),
(6, 1,  'Fiona Zhang',  'Accountant',        2),
(7, 2,  'George Wong',  'Accountant',        7),
(8, 3,  'Hannah Kim',   'Accountant',        5),
(9, 4,  'Ivan Petrov',  'Accountant',        1),
(10,5,  'Jane Doe',     'Accountant',        8);

/* 3. Machine ------------------------------------------------------- */
INSERT INTO Machine (machineID, companyID, model, type) VALUES
(1,  1, 'Dell OptiPlex 7080',      'Desktop PC'),
(2,  2, 'HP ProDesk 600',          'Desktop PC'),
(3,  3, 'Lenovo ThinkCentre M720', 'Desktop PC'),
(4,  4, 'Dell XPS 15',             'Laptop'),
(5,  5, 'HP EliteBook 840',        'Laptop'),
(6,  1, 'Canon DR-C230',           'Scanner'),
(7,  2, 'Fujitsu ScanSnap iX1500', 'Scanner'),
(8,  3, 'Brother ADS-2700W',       'Scanner'),
(9,  4, 'Canon imageFORMULA R40',  'Scanner'),
(10, 5, 'Fujitsu ScanSnap S1300i', 'Scanner'),
(11, 1, 'HP ProBook 450',          'Laptop'),
(12, 2, 'Dell Latitude 7410',      'Laptop'),
(13, 3, 'HP ZBook 15',             'Laptop'),
(14, 4, 'Lenovo ThinkPad T14',     'Laptop'),
(15, 5, 'Dell Precision 3440',     'Desktop PC');

/* 4. AccountCategory ---------------------------------------------- */
INSERT INTO AccountCategory (categoryID, name) VALUES
(1,  'Office Supplies'),
(2,  'Travel'),
(3,  'Meals & Entertainment'),
(4,  'Utilities'),
(5,  'Payroll'),
(6,  'IT Equipment'),
(7,  'Training'),
(8,  'Maintenance'),
(9,  'Miscellaneous'),
(10, 'Professional Services');

/* 5. InvoiceSequence ---------------------------------------------- */
INSERT INTO InvoiceSequence (seqID, userID, startNo, endNo, year) VALUES
(1,  1,  1001,  1010, 2024),
(2,  2,  2001,  2010, 2024),
(3,  3,  3001,  3010, 2024),
(4,  4,  4001,  4010, 2024),
(5,  5,  5001,  5010, 2024),
(6,  6,  6001,  6010, 2024),
(7,  7,  7001,  7010, 2024),
(8,  8,  8001,  8010, 2024),
(9,  9,  9001,  9010, 2024),
(10, 10, 10001, 10010, 2024);

/* 6. Invoice ------------------------------------------------------- */
INSERT INTO Invoice (invoiceID, seqID, invoiceNo, invoiceDate, totalAmount) VALUES
(1,  1,  1001,  '2024-01-05',  500.00),
(2,  2,  2003,  '2024-03-10',  300.00),
(3,  2,  2003,  '2024-03-10',  300.00),   -- duplicate for demo
(4,  3,  3001,  '2024-02-01',  800.00),
(5,  4,  4001,  '2024-04-20',  600.00),
(6,  5,  5002,  '2024-05-12', 15000.00),
(7,  6,  6002,  '2025-01-15',  200.00),   -- future‑dated invoice
(8,  7,  7001,  '2024-07-01',  400.00),
(9,  8,  8001,  '2024-08-10', 1000.00),
(10, 9,  9001,  '2024-09-25',  220.00),
(11, 9,  9002,  '2024-09-25',  180.00),
(12,10, 10001, '2024-10-05',   50.00),
(13,10, 10002, '2024-10-10',  120.00);

/* 7. TransactionRecord -------------------------------------------- */
INSERT INTO TransactionRecord 
(transID, invoiceID, accountCategoryID, userID, machineID, amount, timestamp) VALUES
(1,  1,  1,  1,  1,  300.00, '2024-01-05 10:00:00'),
(2,  1,  2,  1,  1,  200.00, '2024-01-05 10:05:00'),
(3,  2,  2,  2,  2,  300.00, '2024-03-10 14:00:00'),
(4,  3,  2,  2,  2,  300.00, '2024-03-10 14:05:00'),
(5,  4,  6,  3,  3,  800.00, '2024-02-02 11:00:00'),
(6,  5,  4,  4,  4,  600.00, '2024-04-21 02:00:00'),
(7,  6, 10,  5,  5, 15000.00,'2024-05-12 15:00:00'),
(8,  7,  3,  6, 11,  200.00, '2024-12-15 16:00:00'),
(9,  8,  1,  7, 12,  400.00, '2024-08-15 10:00:00'),
(10, 9,  2,  8, 13,  700.00, '2024-08-11 10:00:00'),
(11, 9,  3,  8, 13,  200.00, '2024-08-11 10:02:00'),
(12,10,  3,  9, 14,  220.00, '2024-09-25 23:50:00'),
(13,11,  2,  9, 14,  180.00, '2024-09-26 00:10:00'),
(14,12,  9, 10, 15,   50.00, '2024-10-05 16:00:00'),
(15,13,  9, 10, 15,  120.00, '2024-10-10 16:30:00');

/* 8. MachineLog ---------------------------------------------------- */
INSERT INTO MachineLog 
(logID, machineID, userID, invoiceNo, operationType, timestamp) VALUES
(1,  6,  1,  1001,  'Scan', '2024-01-05 09:50:00'),
(2,  6,  1,  1002,  'Scan', '2024-01-06 09:00:00'),
(3,  7,  2,  2003,  'Scan', '2024-03-10 13:50:00'),
(4,  8,  3,  3002,  'Scan', '2024-02-02 09:00:00'),
(5,  9,  4,  4001,  'Scan', '2024-04-20 17:00:00'),
(6,  7,  7,  7001,  'Scan', '2024-07-05 10:00:00'),
(7,  8,  8,  8001,  'Scan', '2024-08-10 09:00:00'),
(8,  9,  9,  9001,  'Scan', '2024-09-25 21:30:00'),
(9,  9,  9,  9002,  'Scan', '2024-09-25 21:35:00'),
(10,10, 10, 10002,  'Scan', '2024-10-10 15:30:00');

/* 9. ErrorLog ------------------------------------------------------ */
INSERT INTO ErrorLog 
(errorID, userID, invoiceID, type, description, timestamp) VALUES
(1,  1,  NULL, 'MissingInvoice',
    'Invoice #1002 was missing (not recorded by Alice Chan).',
    '2024-01-31 00:00:00'),
(2,  3,  NULL, 'MissingInvoice',
    'Invoice #3002 was missing (not recorded by Charlie Li).',
    '2024-02-29 00:00:00'),
(3,  2,   2,  'DuplicateInvoice',
    'Invoice #2003 was recorded twice by Bob Smith.',
    '2024-03-31 00:00:00'),
(4,  4,   5,  'OffHours',
    'Invoice #4001 was recorded at 2:00 AM by Diana Garcia (outside business hours).',
    '2024-04-21 09:00:00'),
(5,  5,   6,  'AmountOutlier',
    'Invoice #5002 (amount $15000.00) is unusually high compared to other entries.',
    '2024-12-31 00:00:00'),
(6,  6,   7,  'FutureDate',
    'Invoice #6002 has a future date (2025-01-15) compared to its recording date.',
    '2024-12-15 16:01:00'),
(7,  7,   8,  'LateEntry',
    'Invoice #7001 was recorded 45 days after its issue date (late entry by George Wong).',
    '2024-08-31 00:00:00'),
(8,  8,   9,  'MismatchTotal',
    'Invoice #8001 total is $1000.00, but recorded entries sum to $900.00.',
    '2024-08-31 00:00:00'),
(9,  9,  NULL,'OffHoursPattern',
    'User Ivan Petrov recorded multiple invoices during off-hours in September.',
    '2024-09-30 00:00:00'),
(10, 10, NULL,'CategoryMisuse',
    'User Jane Doe categorized all her transactions as ''Miscellaneous'' (potential misclassification).',
    '2024-12-31 00:00:00');

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;   -- restore FK enforcement

CREATE VIEW ErrorLogView AS
SELECT e.errorID,
       u.name AS userName,
       COALESCE(i.invoiceNo, NULL) AS invoiceNo,
       e.type,
       e.description,
       e.timestamp
FROM ErrorLog e
LEFT JOIN Invoice i ON e.invoiceID = i.invoiceID
JOIN User u ON e.userID = u.userID;

/* choose a temporary delimiter that isn’t “;” */
DELIMITER $$

CREATE FUNCTION getErrorCount(p_userID INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE errCount INT;
    SELECT COUNT(*) INTO errCount
    FROM ErrorLog
    WHERE userID = p_userID;
    RETURN errCount;
END$$          -- use the *same* delimiter you set above

/* restore the normal semicolon delimiter */
DELIMITER ;








select * from company;
select * from accountcategory;
select * from errorlog;
select * from invoice;
select * from invoicesequence;
select * from machine;
select * from machinelog;
select * from transactionrecord;
select * from User;
select * from errorlogview;
SELECT u.userID,
       u.name,
       getErrorCount(u.userID) AS errors
FROM   User u
ORDER  BY errors DESC;
SHOW CREATE TABLE ErrorLog;
ALTER TABLE ErrorLog MODIFY errorID INT NOT NULL AUTO_INCREMENT;




DELIMITER $$
DROP PROCEDURE IF EXISTS CheckMissingInvoices$$
CREATE PROCEDURE CheckMissingInvoices()
BEGIN
  /* digits 0‑9 as an inline derived table */
  INSERT INTO ErrorLog (userID, invoiceID, type, description, timestamp)
  SELECT seq.userID,
         NULL,
         'MissingInvoice',
         CONCAT('Invoice #', seq.startNo + d.n,
                ' was missing (not recorded by userID ',
                seq.userID, ').'),
         NOW()
  FROM   InvoiceSequence AS seq
  JOIN  (          SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL
                   SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
                   SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
        ) AS d
        ON  seq.startNo + d.n <= seq.endNo         -- keep within the range
  LEFT  JOIN Invoice i
        ON  i.seqID     = seq.seqID
        AND i.invoiceNo = seq.startNo + d.n
  WHERE  i.invoiceID IS NULL;                       -- only truly missing numbers
END$$

DELIMITER ;

CALL CheckMissingInvoices();

SELECT errorID, userID, description, timestamp
FROM   ErrorLog
WHERE  type = 'MissingInvoice'
ORDER  BY errorID DESC;


SELECT u.name AS userName, i.invoiceNo, COUNT(*) AS occurrences
FROM Invoice i
JOIN InvoiceSequence s ON i.seqID = s.seqID
JOIN User u ON s.userID = u.userID
GROUP BY u.userID, i.invoiceNo
HAVING COUNT(*) > 1;

SELECT u.name AS userName, i.invoiceNo, TIME(t.timestamp) AS recordTime
FROM TransactionRecord t
JOIN Invoice i ON t.invoiceID = i.invoiceID
JOIN InvoiceSequence s ON i.seqID = s.seqID
JOIN User u ON s.userID = u.userID
WHERE TIME(t.timestamp) NOT BETWEEN '08:00:00' AND '18:00:00';

SELECT u.name AS userName, i.invoiceNo, i.totalAmount, SUM(t.amount) AS sumEntries
FROM Invoice i
JOIN InvoiceSequence s ON i.seqID = s.seqID
JOIN User u ON s.userID = u.userID
JOIN TransactionRecord t ON i.invoiceID = t.invoiceID
GROUP BY i.invoiceID, i.totalAmount
HAVING SUM(t.amount) != i.totalAmount;

SELECT u.name AS userName, c.name AS categoryName, COUNT(*) AS countUsed
FROM TransactionRecord t
JOIN User u ON t.userID = u.userID
JOIN AccountCategory c ON t.accountCategoryID = c.categoryID
GROUP BY u.userID, c.categoryID
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*) 
    FROM TransactionRecord t2
    WHERE t2.userID = u.userID
    GROUP BY t2.accountCategoryID
)
ORDER BY u.name;

SELECT u.name AS userName, l.invoiceNo, l.operationType, l.timestamp
FROM MachineLog l
JOIN User u ON l.userID = u.userID
LEFT JOIN Invoice i 
    ON i.invoiceNo = l.invoiceNo 
    AND i.seqID IN (SELECT seqID FROM InvoiceSequence WHERE userID = u.userID)
WHERE i.invoiceID IS NULL;

SELECT c.name AS categoryName, COUNT(*) AS numTransactions, SUM(t.amount) AS totalAmount
FROM TransactionRecord t
JOIN AccountCategory c ON t.accountCategoryID = c.categoryID
GROUP BY c.categoryID
ORDER BY totalAmount DESC;