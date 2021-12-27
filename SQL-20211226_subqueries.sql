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
#SHOWING FULL TABLE
SELECT *
FROM albums;

#THIS WILL BE THE QUERY THAT WILL BE NESTED IN THE SELECT STATEMENT, IT RETURNS THE TOTAL COUNT OF ALL ROWS IN THE TABLE 
SELECT COUNT(*)
FROM albums;

#THIS WILL BE THE NUMERATOR IN THE RATIO FRACTION AND THE SECOND COLUMN OF THE FINAL QUERY
SELECT genre, COUNT(*)
FROM albums
GROUP BY genre;

/*FINAL QUERY--> RETURNS A LIST OF EACH GENRE (OR GENRE MIX/COMBO), 
	ALONG WITH A COUNT OF EACH'S OCCURENCE, 
	AND USES THE NESTED QUERY TO COMPUTE THE RATIO OF THAT GENRE TO THE TOTAL USING THE NESTED QUERY*/
SELECT genre, 
	COUNT(*) AS genre_count, #COUNTS EACH OCCURENCE OF THE GENRE/GENRE MIX
	COUNT(*) #NUMERATOR, COUNT OF EACH GENRE/GENRE MIX
				/	 
				(
				SELECT COUNT(*) FROM albums
					) AS count_ratio #NESTED QUERY THAT RETURNS THE DENOMINATOR OF THE RATIO - THE TOTAL COUNT
FROM albums
GROUP BY genre #GROUPING BY GENRE
ORDER BY count_ratio DESC;

#SUBQUERIES WITH THE WHERE STATEMENT
#-------------------------------------------------------------------------------------
#SHOWING FULL TABLE
SELECT *
FROM albums;