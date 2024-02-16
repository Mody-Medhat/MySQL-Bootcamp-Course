-- ---------------------------------------------------------------------------
								-- PART 9 --
-- ---------------------------------------------------------------------------
		-- Agregation Function 

-- -------------------------------------- COUNT -------------------------------------- --

	SELECT COUNT(*) FROM BOOKS; 						-- 16
    
    SELECT COUNT(AUTHOR_FNAME) FROM BOOKS; 				-- 16
    
    SELECT COUNT( DISTINCT AUTHOR_FNAME) FROM BOOKS; 	-- 9
    
    -- How many titles contain "the"?
		SELECT COUNT(title) FROM BOOKS WHERE TITLE LIKE '%the%';
    
-- -------------------------------------- GROUB BY -------------------------------------- --
	-- 1 not in GROUP BY clause and contains nonaggregated column 
			SELECT * FROM BOOKS GROUP BY author_fname;
            
	SELECT 
		AUTHOR_LNAME, COUNT(TITLE)
	FROM
		BOOKS
	GROUP BY AUTHOR_LNAME
	ORDER BY AUTHOR_LNAME; 
    
    SELECT 
		author_lname, COUNT(*) AS books_written
	FROM
		books
	GROUP BY author_lname
	ORDER BY books_written DESC;
    
-- -------------------------------------- MAX || MIN -------------------------------------- --
	-- Max
		SELECT MAX(AUTHOR_FNAME) FROM BOOKS;
    -- MIN
		SELECT MIN(released_year) FROM BOOKS;

-- -------------------------------------- SUBQUERYES -------------------------------------- --
    -- 01
		SELECT 
			TITLE, AUTHOR_FNAME 
		FROM
			BOOKS
		WHERE
			AUTHOR_FNAME = (SELECT 
					MAX(AUTHOR_FNAME)
				FROM
					BOOKS);
    -- 02
		SELECT 
			TITLE,AUTHOR_FNAME
		FROM
			BOOKS
		WHERE
			PAGES = (SELECT 
					MIN(PAGES)
				FROM
					BOOKS);

	-- 03
		SELECT 
			title, released_year
		FROM
			books
		WHERE
			released_year = (SELECT 
					MIN(released_year)
				FROM
					books);

-- -------------------------------------- Grouping By Multiple Columns -------------------------------------- --
	SELECT 
		author_fname, author_lname, COUNT(title) AS NBOOKS
	FROM
		books
	GROUP BY author_fname , author_lname
	ORDER BY author_fname;
    

	SELECT 
		CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS FULLNAME,
		-- TITLE,
		MIN(RELEASED_YEAR)
	FROM
		BOOKS
	GROUP BY FULLNAME; 

	SELECT 
		author_lname,
		COUNT(*) AS books_written,
		MAX(released_year) AS latest_release,
		MIN(released_year) AS earliest_release,
		MAX(pages) AS longest_page_count
	FROM
		books
	GROUP BY author_lname;

-- -------------------------------------- SUM -------------------------------------- --

	SELECT SUM(PAGES)FROM BOOKS;

	SELECT CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS FULLNAME, SUM(PAGES) NUM_PAGES FROM BOOKS GROUP BY FULLNAME;

-- -------------------------------------- AVG -------------------------------------- --

	DESC BOOKS;
	SELECT RELEASED_YEAR, AVG(STOCK_QUANTITY), COUNT(*) AS NUM_BOOKS FROM BOOKS GROUP BY RELEASED_YEAR;

-- -------------------------------------- EXERSICE -------------------------------------- --
	-- Print the number of books in the database
		SELECT COUNT(*) FROM BOOKS;							

	-- Print out how many books were released in each year
		SELECT RELEASED_YEAR, COUNT(*) FROM BOOKS GROUP BY RELEASED_YEAR;
        
    -- Print out the total number of books in stock    
		SELECT SUM(STOCK_QUANTITY) FROM BOOKS;
        
    -- Find the average released_year for each author
		SELECT 
			CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS FULLNAME,
			AVG(RELEASED_YEAR) AS AVG_YEAR
		FROM
			BOOKS
		GROUP BY FULLNAME;
        
	-- Find the full name of the author who wrote the longest book
        SELECT CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS FULLNAME, PAGES FROM BOOKS WHERE PAGES = (SELECT MAX(PAGES) FROM BOOKS);

		SELECT RELEASED_YEAR, AVG(PAGES) AS 'AVGS PAGES', COUNT(*) AS BOOKS FROM BOOKS GROUP BY RELEASED_YEAR ORDER BY RELEASED_YEAR;
