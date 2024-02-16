-- ---------------------------------------------------------------------------
								-- PART 6--
-- ---------------------------------------------------------------------------
CREATE DATABASE shirts_db;

USE shirts_db;

SELECT database();

-- CREATE TABLE shirts 
		CREATE TABLE shirts(
			shirt_id INT AUTO_INCREMENT,
			artical VARCHAR(50),
			color VARCHAR(20),
			shirt_size VARCHAR(3),
			last_worn INT,
			PRIMARY KEY(shirt_id)
		);
        DESC shirts;
		INSERT INTO shirts  (artical , color, shirt_size, last_worn ) 
					VALUES  ('t-shirt', 'white', 'S', 10),
							('t-shirt', 'green', 'S', 200),
							('polo shirt', 'black', 'M', 10),
							('tank top', 'blue', 'S', 50),
							('t-shirt', 'pink', 'S', 0),
							('polo shirt', 'red', 'M', 5),
							('tank top', 'white', 'S', 200),
							('tank top', 'blue', 'M', 15),
                            ('polo shirt', 'Purple', 'M', 50);
	SELECT * FROM SHIRTS;
    -- SELECT all shirts But Only Print Out Article and Color
			SELECT ARTICAL, COLOR FROM SHIRTS;
        
	-- SELECT all medium shirts Print Out Everything But shirt_id
			SELECT artical , color, shirt_size, last_worn FROM shirts;
    
    -- Update all polo shirts Change their size to L
			UPDATE shirts SET shirt_size='L' WHERE artical='polo shirt';
        
	-- Update the shirt last worn 15 days ago Change last_worn to 0
			UPDATE shirts SET last_worn=0 WHERE last_worn<=15;

	-- Update all white shirts Change size to 'XS' and color to 'off white'
			UPDATE shirts SET SHIRT_SIZE = 'XS', COLOR = 'white' where COLOR = 'off white' ;
			DESC SHIRTS;

	-- Delete all old shirts Last worn 200 days ago
			SELECT * FROM shirts WHERE last_worn <= 200;
			DELETE FROM shirts WHERE last_worn <= 200;
            
	-- Delete article='tank top'
			SELECT * FROM shirts WHERE article='tank top';
			DELETE FROM shirts WHERE article='tank top';


-- ---------------------------------------------------------------------------
								-- PART 7--
-- ---------------------------------------------------------------------------
CREATE DATABASE book_store;

USE book_store;

SELECT DATABASE();

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books   (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES				('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
					('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
					('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
					('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
					('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
					('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
					('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
					('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
					('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
					('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
					('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
					("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
					('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
					('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
					('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
					('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
                    
 SELECT * FROM books;
 
-- -------------------------------------- CONCAT -------------------------------------- --
	 SELECT CONCAT ('H', 'E', 'L', 'L','O');
	 
	 SELECT CONCAT (author_fname ,' ' , author_lname) FROM books;


-- -------------------------------------- CONCAT_WS -------------------------------------- --
	-- CONCAT WITH SEPRATOR
		SELECT concat_ws('_' , author_fname, author_lname, title) from books;

-- -------------------------------------- SUBSTRING -------------------------------------- --
	SELECT SUBSTRING('Hello World', 1, 4);
    
	SELECT SUBSTR('Hello World', 7);
    
	SELECT SUBSTRING('Hello World', -3);
    
	SELECT 
		SUBSTRING(title, 1, 10) AS 'short title'
	FROM books;
    
	SELECT 
		SUBSTR(title, 1, 10) AS 'short title'
	FROM books;
    
		-- Combining String Functions
			-- SELECT SUBSTR(title, 1 , 10) as short_title, CONCAT(short_title, '...') FROM books;
			-- CREATE VIEW short_title SELECT SUBSTR(title, 1 , 10) as short_title,
			SELECT CONCAT
				(
				SUBSTR(title, 1 , 10) ,
				'...'
				) AS short_title
			FROM books;

-- -------------------------------------- REPLACE -------------------------------------- --
		-- CASE SENSITIVE 
		-- REPLACE(str, from_str, to_str)
			SELECT REPLACE('Mody Medhat', 'Mody', 'Maged');
			SELECT REPLACE (title, ' ', '-') FROM books;
    
-- -------------------------------------- REVERCE -------------------------------------- --
		SELECT REVERSE('Mody Medhat');
		SELECT CONCAT( author_fname, REVERSE(author_fname)) FROM books;


-- -------------------------------------- CHAR_LENGTH -------------------------------------- --
	-- measured in CHARACTER
		SELECT CHAR_LENGTH (title) FROM BOOKS;
        SELECT CHAR_LENGTH(TITLE) AS Title_Length , author_Lname FROM BOOKS;
		SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
-- --------------------------------------LENGTH -------------------------------------- --
	-- measured in bytes
		SELECT LENGTH (title) FROM BOOKS;
		SELECT LENGTH(TITLE) AS Title_Length , author_Lname FROM BOOKS;
		SELECT CONCAT(author_lname, ' is ', LENGTH(author_lname), ' characters long') FROM books;
		-- COMBARE BETWEEN LENGTH AND CHAR_LENGTH
			-- CHAR_LENGTH
				SELECT CHAR_LENGTH ('艾弗');		-- 2																													
			-- LENGTH
				SELECT LENGTH ('艾弗');          -- 6
 
-- --------------------------------------UPPER - LOWER -------------------------------------- --
	SELECT CONCAT('I LOVE The' ,LCASE(TITLE), '!!!') FROM books;

	SELECT CONCAT('I LOVE The' ,UCASE(TITLE), '!!!') FROM books;


-- -------------------------------------- INSERT -------------------------------------- --
	SELECT INSERT ('Hello World', 1 , 5 , 'olleh');        
   
-- -------------------------------------- LEFT || RIGHT -------------------------------------- --
	-- LEFT
		SELECT LEFT('Happy day',2);
    -- RIGHT
		SELECT RIGHT('Happy day',2);
	
-- -------------------------------------- REPEAT -------------------------------------- --
   SELECT REPEAT('MODY', 4);
 
 -- -------------------------------------- TRIM -------------------------------------- --
	-- REMOVE WIGHT SPACES FROM THE BEGINING AND THE END OF THE STRING 
		SELECT TRIM('  barbar');
        -- LEADING
			SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
		-- BOTH    
			SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
		-- TRAILING    
			SELECT TRIM(TRAILING 'xyz' FROM 'xxyzbarxxyz');

-- Exercise

	SELECT REVERSE(UCASE('Why does my cat look at me with such hatred?')); 
    
    SELECT REPLACE(TITLE, ' ' , '->') FROM BOOKS;
    
    SELECT AUTHOR_FNAME AS Forward , REVERSE(AUTHOR_FNAME) as Backward FROM BOOKS;
    
    SELECT CONCAT(UCASE(AUTHOR_FNAME), ' ', UCASE(AUTHOR_LNAME)) AS FULL_NAME FROM BOOKS;
    
    
-- ---------------------------------------------------------------------------
								-- PART 8 --
-- ---------------------------------------------------------------------------    
  INSERT INTO books 
				(title, author_fname, author_lname, released_year, stock_quantity, pages)
  VALUES
				('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
				('fake_book', 'Freida', 'Harris', 2001, 287, 428),
				('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
  
 -- -------------------------------------- DISTINCT -------------------------------------- --
		SELECT DISTINCT AUTHOR_LNAME FROM BOOKS;
        
		SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
 
		SELECT DISTINCT author_fname, author_lname FROM books;
        
        
 -- -------------------------------------- ORDER BY -------------------------------------- --
    SELECT AUTHOR_FNAME, AUTHOR_LNAME FROM BOOKS ORDER BY AUTHOR_LNAME;
    
	SELECT AUTHOR_FNAME, AUTHOR_LNAME FROM BOOKS ORDER BY AUTHOR_LNAME DESC;

	SELECT AUTHOR_FNAME, AUTHOR_LNAME FROM BOOKS ORDER BY AUTHOR_LNAME ASC ;

 -- -------------------------------------- LIMIT -------------------------------------- --
		DESC BOOKS;
		
		SELECT TITLE , PAGES FROM BOOKS LIMIT 3;
		
		SELECT 
			title, released_year
		FROM
			books
		ORDER BY released_year ASC
		LIMIT 5;
		
		SELECT title FROM books LIMIT 5, 123219476457;

    
 -- -------------------------------------- LIKE -------------------------------------- --
		SELECT title, author_fname, author_lname, pages 
		FROM books
		WHERE author_fname LIKE '%da%';
		 
		SELECT title, author_fname, author_lname, pages 
		FROM books
		WHERE title LIKE '%:%';
		 
		SELECT * FROM books
		WHERE author_fname LIKE '____';
		 
		SELECT * FROM books
		WHERE author_fname LIKE '_a_';   
    
    -- To select books with '%' in their title:
		SELECT * FROM books
		WHERE title LIKE '%\%%';
		 
	-- To select books with an underscore '_' in title:
		SELECT * FROM books
		WHERE title LIKE '%\_%';
			
 -- -------------------------------------- EXERSICE -------------------------------------- --

		DESC BOOKS;
        
		SELECT CONCAT(TITLE ,'-' , RELEASED_YEAR) AS SUMMARY FROM BOOKS LIMIT 3;
			
		SELECT TITLE, AUTHOR_FNAME FROM BOOKS WHERE AUTHOR_FNAME LIKE '%" "%';
        
        -- Find the full name of the author who wrote the longest book
				SELECT 
					CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS FULLNAME, PAGES
				FROM
					BOOKS
				ORDER BY PAGES DESC
				LIMIT 1;
    
		-- Select All Story Collections Titles  That contain 'stories'
				SELECT TITLE FROM BOOKS WHERE TITLE LIKE '%stories%';
                
		-- Find The Longest Book Print Out the Title and Page Count
			SELECT 
				TITLE, PAGES
			FROM
				BOOKS
			ORDER BY PAGES DESC
			LIMIT 1;
		-- Print a summary containing the title and year, for the 3 most recent books
				SELECT 
					CONCAT(TITLE, ' WAS RELEASED IN ', RELEASED_YEAR) AS SUMMERY
				FROM
					BOOKS
				ORDER BY RELEASED_YEAR DESC
				LIMIT 3;
			
    -- Find all books with an author_lname that contains a space(" ")
			SELECT TITLE, AUTHOR_LNAME FROM BOOKS WHERE AUTHOR_LNAME LIKE '%" "%';
            
    -- Find The 3 Books With The Lowest Stock Select title, year, and stock
			SELECT TITLE, RELEASED_YEAR, STOCK_QUANTITY FROM BOOKS ORDER BY STOCK_QUANTITY LIMIT 3;
    
	-- Print title and author_lname, sorted first by author_lname and then by title
			SELECT TITLE, AUTHOR_LNAME FROM BOOKS ORDER BY 2,1;
    
    -- Sorted Alphabetically By Last Name
		SELECT 
			CONCAT
					(
				    'MY FAVORITE AUTHOR IS ',
					UCASE(AUTHOR_FNAME),
					' ',
					UCASE(AUTHOR_LNAME)
                    ) AS YELL
		FROM
			BOOKS
		ORDER BY AUTHOR_LNAME;  
        
        

    