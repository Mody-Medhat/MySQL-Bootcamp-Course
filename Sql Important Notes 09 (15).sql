-- ------------------------------------------------------------------------------------ --
								    -- PART 15 --
-- ------------------------------------------------------------------------------------ --
	USE tv_show;
-- -------------------------------------- CREATE A VIEW -------------------------------------- --

	CREATE VIEW full_reviews AS
    SELECT 
        title, released_year, genre, rating, first_name, last_name
    FROM
        reviews
            JOIN
        series ON series.id = reviews.series_id
            JOIN
        reviewers ON reviewers.id = reviews.reviewer_id;
        
    SELECT * FROM FULL_REVIEWS; 
    
    -- Can not delete from join view 'tv_show.full_reviews'
		DELETE FROM full_reviews WHERE RELEASED_YEAR >2012;
        
    -- CREATE VIEW    
        CREATE VIEW ordered_series AS
		SELECT * FROM series ORDER BY released_year;
        
	-- REPLACE VIEW	 
		CREATE OR REPLACE VIEW ordered_series AS
		SELECT * FROM series ORDER BY released_year DESC;
        
	-- ALTER VIEW 	 
		ALTER VIEW ordered_series AS
		SELECT * FROM series ORDER BY released_year;
        
	-- DROP VIEW	 
		DROP VIEW ordered_series;
        
        
        
-- -------------------------------------- HAVING -------------------------------------- --
        
	SELECT 
		title, 
		AVG(rating),
		COUNT(rating) AS review_count
	FROM full_reviews 
	GROUP BY title HAVING COUNT(rating) > 1;
			
-- -------------------------------------- WITH ROLLUP -------------------------------------- --
-- First Level RollUP
	SELECT 
		title, AVG(rating)
	FROM
		full_reviews
	GROUP BY title WITH ROLLUP;
    
	-- SECOND Level RollUP 
	SELECT 
		released_year, genre, AVG(rating)
	FROM
		full_reviews
	GROUP BY genre, released_year   WITH ROLLUP;			
	 
	SELECT 
		title, COUNT(rating)
	FROM
		full_reviews
	GROUP BY title WITH ROLLUP;
	 
	 
	SELECT 
		first_name, released_year, genre, AVG(rating)
	FROM
		full_reviews
	GROUP BY released_year , genre , first_name WITH ROLLUP;			
				
		
			
-- -------------------------------------- View Modes -------------------------------------- --            
            
	-- To View Modes:
		SELECT @@GLOBAL.sql_mode;
		SELECT @@SESSION.sql_mode;
	 
	-- To Set Them:
		SET GLOBAL sql_mode = 'modes';
		SET SESSION sql_mode = 'modes';        
        
        
        