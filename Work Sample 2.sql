--PART I
--A) Creating CRIMINALS table
INSERT INTO CRIMINALS (criminal_id, last, first, street, city, state, zip, phone)
VALUES (&criminal_id, '&last', '&first', '&street', '&city', '&state', '&zip', '&phone');

--B) Run the above query and added the values to CRIMINALS table (thrice)

--Checking the inserted values in the table
SELECT * FROM CRIMINALS;

--C) Adding new column Mail_flag to the CRIMINALS table
ALTER TABLE CRIMINALS
ADD Mail_flag CHAR(1);

--D) Setting the Mail_flag column to 'Y' Value to all rows in CRIMINALS table
UPDATE CRIMINALS
SET Mail_flag = 'Y' 
WHERE 1=1;

--Checking the values of Mail_flag in CRIMINALS Table
SELECT Mail_flag from CRIMINALS;

--E) Conditional adding of Mail_flag to 'N' for null street address
UPDATE CRIMINALS
SET Mail_flag = 'N' 
WHERE street is NULL;

-- Verifying above condition (E)
SELECT Street, Mail_flag from CRIMINALS where street is NULL;

--F) Changing phone number of criminal_ID = 1016
UPDATE CRIMINALS
SET phone = '7225659032' 
WHERE criminal_id = 1016;

-- Verifying above condition (F)
SELECT criminal_id,phone from CRIMINALS where criminal_id = 1016;

--G) Removal of 1017 criminal_id from DB
DELETE FROM CRIMINALS WHERE criminal_id = 1017;

--Verifying above condition (G)
SELECT * from CRIMINALS where criminal_id = 1017;

--PART II
--A) Generating the list of book titles based on cost > $10 in descending order 
SELECT title FROM BOOKS
WHERE retail-cost-NVL(discount,0) >= 10
ORDER BY retail-cost-NVL(discount,0) DESC;

--B)Finding all books where the conditions mentioned
SELECT * FROM BOOKS
WHERE category in ('COMPUTER','FAMILY LIFE') AND pubid in (1,3) AND RETAIL > 45;

--C) Joins
SELECT concat(a.fname,concat(' ',a.lname)) as Author_Name,c.lastname,c.firstname from 
Books b, orderitems oi, orders o,customers c, bookauthor ba, author a
where b.ISBN=oi.ISBN
and oi.order# = o.order#
and c.customer# = o.customer#
and b.isbn=ba.isbn
and ba.authorid = a.authorid
and c.lastname='NELSON'
and c.firstname='BECCA';