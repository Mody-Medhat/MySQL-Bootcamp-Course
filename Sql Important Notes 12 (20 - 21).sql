-- ---------------------------------------------------------------------------
								-- PART 20 --
-- ---------------------------------------------------------------------------

CREATE DATABASE JOIN_US_APP;

USE JOIN_US_APP;

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;

DESC users;

SELECT * FROM USERS;

INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');

-- Dis-able Safe Mode 
	SET SQL_SAFE_UPDATES = 0;

 -- DELETE FROM USERS;
 
-- --------------------------------------------------------- Challenge 1 --------------------------------------------------------- --
	-- Find Earliest Date A User Joined
    
	SELECT 
		DATE_FORMAT(created_at, '%b %D %Y') AS old_user
	FROM
		users
	ORDER BY created_at ASC
	LIMIT 1;
	
    SELECT 
		DATE_FORMAT(MIN(created_at), '%b %D %Y') AS old_user
	FROM
		users;
-- --------------------------------------------------------- Challenge 2  --------------------------------------------------------- --
	-- Find Email Of The First (Earliest)Use
    
	SELECT 
		email, created_at
	FROM
		users
	WHERE
		created_at = (SELECT 
				created_at
			FROM
				users
			ORDER BY created_at ASC
			LIMIT 1);
    
    SELECT 
		*
	FROM
		users
	WHERE
		created_at = (SELECT 
				MIN(created_at)
			FROM
				users);
                
-- --------------------------------------------------------- Challenge 3 --------------------------------------------------------- --
	-- Users According To The Month They Joined
    
  SELECT 
		MONTHNAME(created_at) AS Month_Name, COUNT(*)
	FROM
		users
	GROUP BY Month_Name
	ORDER BY Month_Name;
  
-- --------------------------------------------------------- Challenge 4 --------------------------------------------------------- --
	-- Count Number of Users With Yahoo Emails
    
	SELECT 
		email, COUNT(*)
	FROM
		users
	GROUP BY email
	HAVING email LIKE '%yahoo%';
  
	SELECT 
		COUNT(*) AS yahoo_emails
	FROM
		users
	WHERE
		email LIKE '%gmail%';
    
-- --------------------------------------------------------- Challenge 5 --------------------------------------------------------- --
	-- Calculate Total Number of Users for Each Email Host
    
	SELECT 
		CASE
			WHEN email LIKE '%gmail.com%' THEN 'Gmail'
			WHEN email LIKE '%yahoo.com%' THEN 'Yahoo'
			WHEN email LIKE '%hotmail.com%' THEN 'Hotmaile'
			ELSE 'Other'
		END AS Provider,
		COUNT(*) AS total_userss
		
	FROM
		users
	GROUP BY Provider;
    
    
    