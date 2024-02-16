-- ---------------------------------------------------------------------------
								-- PART 11 --
-- ---------------------------------------------------------------------------
SELECT * FROM BOOKS;

-- -------------------------------------- Comprison Operators -------------------------------------- --
-- = , !=
	SELECT AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE RELEASED_YEAR != 2017;
    
    
-- -------------------------------------- NOT LIKE -------------------------------------- --

	SELECT * FROM books WHERE title NOT LIKE '%e%';    
	SELECT * FROM books WHERE title NOT LIKE '%X%';    
    
    
-- -------------------------------------- GREATER THAN OR EQUAL -------------------------------------- --

	SELECT * FROM BOOKS WHERE RELEASED_YEAR > 2010;
	SELECT * FROM BOOKS WHERE RELEASED_YEAR >= 2010;

-- -------------------------------------- LESS THAN OR EQUAL -------------------------------------- --

	SELECT * FROM BOOKS WHERE RELEASED_YEAR < 2010;
	SELECT * FROM BOOKS WHERE RELEASED_YEAR <= 2010;

-- -------------------------------------- LOGICAL AND -------------------------------------- --
	SELECT *  FROM BOOKS;
	SELECT * FROM BOOKS WHERE AUTHOR_LNAME = 'Eggers' AND RELEASED_YEAR > 2012;
    
-- -------------------------------------- LOGICAL OR -------------------------------------- --

	SELECT * FROM BOOKS WHERE AUTHOR_LNAME = 'Eggers' OR RELEASED_YEAR > 2012;

-- -------------------------------------- BETWEEN -------------------------------------- --

	SELECT title, released_year FROM books
	WHERE released_year <= 2015
	AND released_year >= 2004;
 
	SELECT title, released_year FROM books
	WHERE released_year BETWEEN 2004 AND 2014;

-- -------------------------------------- NOT BETWEEN -------------------------------------- --

	SELECT title, released_year FROM books
	WHERE released_year NOT BETWEEN 2004 AND 2014;
    
-- -------------------------------------- CAST -------------------------------------- --

    SELECT * FROM PEOPLE;
	SELECT * FROM PEOPLE WHERE TIME(BIRTHDT) > CAST('09:10:22' AS TIME);
    
	SELECT * FROM people WHERE birthtime BETWEEN CAST('12:00:00' AS TIME) AND CAST('16:00:00' AS TIME);
 
	SELECT * FROM people WHERE HOUR(birthtime)  BETWEEN 12 AND 16;
    
    
-- -------------------------------------- IN , NOT IN -------------------------------------- --
	SELECT 
		title, author_lname
	FROM
		books
	WHERE
			author_lname = 'Carver'
			OR author_lname = 'Lahiri'
			OR author_lname = 'Smith';
	 
	SELECT title, author_lname FROM books
	WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
	 
	SELECT title, author_lname FROM books
	WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
	 
-- -------------------------------------- MODULO -------------------------------------- --

	SELECT title, released_year FROM books
	WHERE released_year >= 2000 
	AND released_year % 2 = 1;    
    
-- -------------------------------------- CASE STATMENT -------------------------------------- -- 
    SELECT 
		TITLE,
		RELEASED_YEAR,
		CASE
			WHEN RELEASED_YEAR < 2000 THEN 'OLD FIT'
			ELSE 'MODERN FIT'
		END AS NEW_TABLE
	FROM
		BOOKS;
        
    SELECT 
		title,
		stock_quantity,
		CASE
			WHEN stock_quantity <= 40 THEN '*'
			WHEN stock_quantity <= 70 THEN '**'
			WHEN stock_quantity <= 100 THEN '***'
			WHEN stock_quantity <= 140 THEN '****'
			ELSE '*****'
		END AS stock
	FROM
		books;
        
    SELECT 
		TITLE,
		STOCK_QUANTITY,
		CASE
			WHEN STOCK_QUANTITY BETWEEN 0 AND 50 THEN '*'
			WHEN STOCK_QUANTITY BETWEEN 51 AND 100 THEN '**'
			ELSE '***'
		END AS STOCK
	FROM
		BOOKS;    
        
-- -------------------------------------- IS NULL -------------------------------------- -- 
	SELECT * FROM BOOKS;
    SELECT * FROM BOOKS WHERE AUTHOR_LNAME IS NULL; 
    DELETE FROM BOOKS WHERE AUTHOR_LNAME IS NULL;
    
    -- DISABLE SAFE UPDATES MODE
		SET SQL_SAFE_UPDATES=0;
    
-- -------------------------------------- EXERCISE -------------------------------------- -- 
    
	SELECT 
		TITILE,
		AUTHOR_LNAME,
		CASE
			WHEN TITLE LIKE '%stories%' THEN ''
			WHEN
				TITLE LIKE '%Just Kids%'
					OR TITLE LIKE '%A Heartbreaking Work%'
			THEN
				'Memoir'
			ELSE 'Novel'
		END AS TYPE
	FROM
		BOOKS;         
       
	SELECT 
		AUTHOR_FNAME,
		AUTHOR_LNAME,
		CONCAT(COUNT(*), ' Books') AS books
	FROM
		BOOKS
	GROUP BY 1 , 2;     
    
	 SELECT 
		author_fname,
		author_lname,
		CASE
			WHEN COUNT(*) = 1 THEN '1 book'
			ELSE CONCAT(COUNT(*), ' books')
		END AS count
	FROM
		books
	WHERE
		author_lname IS NOT NULL
	GROUP BY author_fname , author_lname;
    
	SELECT 
		AUTHOR_FNAME, AUTHOR_LNAME
	FROM
		BOOKS
	WHERE
		SUBSTR(AUTHOR_LNAME, 1, 1) IN ('C' , 'B');
			
        
        
        
        
        
        