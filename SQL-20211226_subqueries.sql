/*
'SQL SUBQUERIES' BY RANDY MACARAEG
(https://towardsdatascience.com/sql-subqueries-85770fd52eb1) 
*/

#SUBQUERIES WITH THE FROM STATEMENT
#-------------------------------------------------------------------------------------
#THE WHOLE ALBUMS TABLE
SELECT *
FROM albums;

#QUERYING THE ALBUMS TABLE TO SHOW ALBUMS WITH 'B' IN THE NAME
SELECT *
FROM albums
WHERE name LIKE '%B%';

#INCLUDING A SUBQUERY TO SHOW ALBUMS WITH 'B' IN THE NAME THAT WERE RELEASED IN THE 80'S 
SELECT bnames.*
FROM (
	SELECT *
	FROM albums
	WHERE name LIKE '%B%'
	) AS bnames
WHERE bnames.release_date LIKE '198%';

#SUBQUERIES WITH THE SELECT STATEMENT
#-------------------------------------------------------------------------------------
