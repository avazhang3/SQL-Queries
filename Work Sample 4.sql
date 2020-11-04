SELECT lastname, state
FROM customers
WHERE state = 'FL';

SELECT *
FROM books
WHERE pubdate = '21-JAN-05';

SELECT title, retail
FROM books
WHERE retail < 55.00;

SELECT title
FROM books
WHERE title > 'H';

SELECT order#, orderdate
FROM orders
WHERE orderdate <= '31-MAR-09';

SELECT title, retail-cost profit, cost*0.2
FROM books
WHERE profit < cost*0.2;

SELECT *
FROM customers
WHERE state <> 'FL';

SELECT count(*)
FROM customers;

SELECT title
FROM books
WHERE title BETWEEN 'A' AND 'D';

SELECT *
FROM orders
WHERE orderdate BETWEEN '01-APR-09' AND '03-APR-09';

SELECT *
FROM customers
WHERE state NOT IN ('CA', 'TX');

SELECT lastname
FROM customers
WHERE lastname LIKE '%P%';

SELECT lastname
FROM customers
WHERE lastname LIKE 'N%N';

DESC customers;

SELECT customer#, lastname, firstname
FROm customers
WHERE customer# LIKE '10_9';

SELECT *
FROM books
WHERE isbn LIKE '_4%0';

SELECT title, pubid, category
FROM books
WHERE pubid = 3 
OR category = 'COMPUTER';

SELECT * 
FROM books
WHERE (category  = 'FAMILY LIFE'
OR pubid = 4)
AND cost > 15;

SELECT order#, orderdate, shipdate
FROM orders
WHERE shipdate IS NOT NULL;

SELECT *
FROM testing
ORDER BY tvalue;

SELECt pubid, name "Publisher Name", phone
FROM publisher
ORDER BY "Publisher Name";

SELECT lastname, state, referred
FROM customers
WHERE state = 'CA'
ORDER BY referred NULLS FIRST;

SELECT lastname, state, city
FROM customers
ORDER by 2 DESC, 3;

SELECT title, name
FROM books, publisher;

SELECt isbn, title, location, '    ' count
FROM books CROSS JOIN warehouses
ORDER BY location, title;

SELECt isbn, title, location, '    ' count
FROM books, warehouses
ORDER BY location, title;

SELECT title, name, books.pubid
FROM books, publisher
WHERE books.pubid = publisher.pubid
AND publisher.pubid = 4;

SELECT count(*) FROM books;

SELECT b.title, b.pubid, p.name, b.cost
FROM books b, publisher p
WHERE b.pubid = p.pubid
AND (b.cost < 15 OR p.pubid = 1)
ORDER BY b.title;


SELECT b.title, pubid, p.name
FROM publisher p JOIN books b
    USING (pubid);
    
SELECT b.title, b.pubid, p.name
FROM publisher p JOIN books b
    ON p.pubid = b.pubid;

SELECT title,pubid,name
FROM publisher NATURAL JOIN books;







