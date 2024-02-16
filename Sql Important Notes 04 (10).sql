-- ---------------------------------------------------------------------------
								-- PART 10 --
-- ---------------------------------------------------------------------------
	SELECT DATABASE();
	CREATE TABLE frinds(
		ID INT AUTO_INCREMENT,
		name_char char(2),
		name_varchar VARCHAR(10),
		PRIMARY KEY(ID)
	);
-- -------------------------------------- DATE || TIME -------------------------------------- --
    
	   CREATE TABLE people (
			name VARCHAR(100),
			birthdate DATE,
			birthtime TIME,
			birthdt DATETIME
	);
 
	INSERT INTO people (name, birthdate, birthtime, birthdt)
	VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
	 
	INSERT INTO people (name, birthdate, birthtime, birthdt)
	VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
	 
	INSERT INTO people (name, birthdate, birthtime, birthdt)
	VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
    
    SELECT * FROM people;
    
-- -------------------------------------- DATE || TIME Functions -------------------------------------- --
   -- DATE
		SELECT CURDATE(); 		-- == CURRENT_DATA()  		== CURRENT_DATA
   -- TIME
		SELECT CURTIME(); 		-- == CURRANT_TIME()  		== CURRANT_TIME
   -- DATA TIME
		SELECT NOW();			-- == CURRENT_TIMESTAMP()  	== CURRENT_TIMESTAMP
    
    SELECT NAME, DAY(BIRTHDATE), DAYOFWEEK(BIRTHDATE), DAYOFYEAR(BIRTHDATE), YEAR(BIRTHDATE), MONTHName(BIRTHDATE) FROM PEOPLE;
    
	 SELECT 
		birthtime, HOUR(birthtime), MINUTE(birthtime)
	FROM
		people;
	 
	SELECT 
		birthdt,
		MONTH(birthdt),
		DAY(birthdt),
		HOUR(birthdt),
		MINUTE(birthdt)
	FROM
		people;
        
-- -------------------------------------- DATE FORMATE -------------------------------------- --

    SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
	SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
	 
	SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;    
		
-- -------------------------------------- DATE MATH -------------------------------------- --
	-- DATEDIFF
		SELECT CURDATE() , BIRTHDT, DATEDIFF( CURDATE() , BIRTHDT) FROM PEOPLE;
        
    -- DATE_ADD
		SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR) AS DATE_ADD;
		SELECT DATE_ADD('1900-01-01 00:00:00', INTERVAL '-1 10' DAY_HOUR);
		SELECT BIRTHDT - INTERVAL 18 YEAR FROM PEOPLE;
        -- YEAR
			SELECT YEAR(BIRTHDT - INTERVAL 18 YEAR) FROM PEOPLE;
		-- MONTH
			SELECT MONTH(BIRTHDT - INTERVAL 18 YEAR) FROM PEOPLE;

    -- DATE_SUP
		SELECT DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AS DATE_SUB;     
        SELECT DATE_ADD('1900-01-01 00:00:00', INTERVAL '-1 10' DAY_HOUR);
		SELECT NOW() - INTERVAL 18 YEAR;
		SELECT DATE_SUB('2008-01-02', INTERVAL -1 DAY);  
        
-- -------------------------------------- DEFALET TIMESTAMP -------------------------------------- --
	
	CREATE TABLE caption (
		text VARCHAR(150),
		created_at DATETIME DEFAULT CURRENT_TIMESTAMP()
	);
		INSERT INTO caption(text) VALUE('155'),('xxxxdddddwwsfff');
		INSERT INTO caption(text) VALUE('xxxxddwwsfff');
		INSERT INTO caption(text) VALUE('xxxxsssccddwwsfff');
    SELECT * FROM CAPTION;
    
	   CREATE TABLE captions2 (
		text VARCHAR(150),
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	);
		
-- -------------------------------------- Data Types Exercise -------------------------------------- --
	-- What's the difference between DATETIME and TIMESTAMP?
		-- They both store datetime information, but there's a difference in the range, 
		-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
		-- TIMESTAMP is used for things like meta-data about when something is created or updated.
        
    -- DATE_FORMAT    
			SELECT DATE_FORMAT(NOW(), '%W') AS DAYNAME;
			SELECT DATE_FORMAT(NOW(), '%b') AS DAYNAME;
			SELECT DATE_FORMAT(NOW(), '%w') + 1;
			SELECT DAYNAME(NOW());
			SELECT DATE_FORMAT(NOW(), '%W');
			SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
			SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');