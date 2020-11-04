SELECT * 
FROM promotion;

SELECT b.title, b.retail, p.gift
FROM books b JOIN promotion p
                ON b.retail BETWEEN p.minretail AND p.maxretail;
SELECT customer# 
FROM customers;             
                
SELECT r.firstname, r.lastname, c.lastname "Referred customer"
FROM customers c, customers r
WHERE c.referred = r.customer#;

SELECT r.firstname, r.lastname, c.lastname "Referred customer"
FROM customers c JOIN customers r
                ON c.referred = r.customer#;

SELECT c.customer#, c.lastname, o.order#
FROM customers c LEFT JOIN orders o
                ON c.customer# = o.customer#
ORDER BY c.customer#;

SELECT count(*) FROM customers;

SELECT ba.authorid
FROM books b JOIN bookauthor ba
            USING (isbn)
WHERE category = 'FAMILY LIFE'
MINUS
SELECT ba.authorid
FROM books b JOIN bookauthor ba
                USING (isbn)
WHERE category = 'CHILDREN'
ORDER BY authorid;                
                
SELECT pubid, name "Publisher Name"
FROM publisher 
UNION
SELECT id, name "PUB Name"
FROM publisher3
ORDER BY "Publisher Name";


SELECT *
FROM customers;


SELECT firstname, lastname
FROM customers
WHERE lastname = UPPER('&Customer_lastname');

SELECT firstname, lastname
FROM customers
WHERE lastname = INITCAP('nelson');
--> Nelson

SELECT INITCAP(FIRSTNAME) "First Name", INITCAP (LASTNAME) "Last name"
FROM customers
WHERE lastname='NELSON';


DESC customers;

SELECT zip, SUBSTR(zip, 1, 3), SUBSTR(zip, -3, 2)
FROM customers;
--WHERE SUBSTR(zip, -3, 2) < 30;

DESC contacts;

SELECT name, 
        SUBSTR(name, 1, INSTR(name, ',')-1) "Last name",
        SUBSTR(name, INSTR(name, ',')+1, INSTR(name, ',', 1, 2) - INSTR(name, ',') -1) "First name"
FROM contacts;

SELECT DISTINCT LENGTH(address) Add_length
FROM customers
ORDER BY Add_length DESC;

SELECT MAX(LENGTH(address)) MAx_length
FROM customers;

SELECT firstname, LPAD(firstname, 12, '*')
FROM customers;

SELECT address, LTRIM(address, 'P.O. BOX')
FROM customers
WHERE state = 'FL';



SELECT address, REPLACE(address, 'P.O.', 'POST OFFICE')
FROM customers
WHERE state = 'FL';

SELECT title, TRUNC(MONTHS_BETWEEN(orderdate, pubdate), 0) MTHS
FROM books JOIN orderitems USING(isbn)
            JOIN orders USING(order#)
WHERE order# = 1004;


SELECT title, pubdate, ADD_MONTHS('10-DEC-09', 18) Renegotiation_date, 
        ADD_MONTHS(pubdate, 84) Drop_date
FROM books;

SELECT *
FROM orders
WHERE orderdate = TO_DATE('MAR 31, 2009', 'Mon DD, YYYY');

SELECT *
FROM orders
WHERE orderdate = 'MAR 31, 2009';  -- you should get an error


SELECT title, pubdate, TO_CHAR(pubdate, 'MON DD, YYYY') pub_date,
                TO_CHAR(retail, '$999.99') retail_price
FROM books;   

SELECT sysdate, TO_CHAR(sysdate, 'Month DD, YYYY, HH:MM:SS')
FROM dual;

SELECT SUM((paideach - cost) * quantity) Total_profit
FROM orderitems JOIN books USING(isbn)
WHERE order# = 1007;

SELECT TO_CHAR(AVG(retail-cost), '$999.99')
FROM books;

SELECT COUNT(DISTINCT category)
FROM books;

SELECT DISTINCT COUNT(category)
FROM books;

SELECT category, AVG(retail-cost) avg_profit
FROM books
GROUP BY category;

SELECT category, AVG(retail)
FROM books
WHERE category='CHILDREN' 
AND category='COMPUTER'
GROUP BY category
HAVING AVG(retail)>50;


SELECT category, AVG(retail-cost) avg_profit
FROM books
GROUP BY category
HAVING AVG(retail-cost) > 15;

SELECT customer#, c.lastname, c.firstname, o.order#
FROM customers c LEFT JOIN orders o
                USING(customer#)
ORDER BY customer#;                

SELECT c.customer#, c.lastname, o.order#
FROM customers c FULL JOIN orders o
                ON c.customer# = o.customer#
ORDER BY c.customer#;

SELECT 235/16, MOD(235, 16)
FROM dual;









                
