-- ------------------------------------------------------------------------------------ --
								    -- PART 13 --
-- ------------------------------------------------------------------------------------ --
	-- create database
		CREATE DATABASE shop;
    -- use database   
		USE shop;
	SELECT DATABASE();
    
	CREATE TABLE customers (
		id INT AUTO_INCREMENT,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
        email VARCHAR(100),
		CONSTRAINT customers_PK PRIMARY KEY (id)
	);
    
	 -- DROP TABLE customers; 

     -- ALTER TABLE CUSTOMERS RENAME COLUMN frist_name TO first_name;
    
		INSERT INTO customers (first_name, last_name, email) 
		VALUES ('Boy', 'George', 'george@gmail.com'),
			   ('George', 'Michael', 'gm@gmail.com'),
			   ('David', 'Bowie', 'david@gmail.com'),
			   ('Blue', 'Steele', 'blue@gmail.com'),
			   ('Bette', 'Davis', 'bette@aol.com');
    
    
	   CREATE TABLE orders (
		id INT AUTO_INCREMENT,
		order_date TIMESTAMP, -- ON UPDATE CURRENT_TIMESTAMP,
		amount DECIMAL(8 , 2),
		customer_id INT,
		CONSTRAINT orders_PK PRIMARY KEY (id),
		CONSTRAINT orders_customers_FK FOREIGN KEY (customer_id)
			REFERENCES customers (id)
			ON DELETE CASCADE
	);
    
		INSERT INTO orders (order_date, amount, customer_id)
		VALUES ('2016-02-10', 99.99, 1),
			   ('2017-11-11', 35.50, 1),
			   ('2014-12-12', 800.67, 2),
			   ('2015-01-03', 12.50, 2),
			   ('1999-04-11', 450.25, 5);
    
    
    
    
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;
 
 
SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');
    
    
-- -------------------------------------- CROOS JOIN -------------------------------------- --
    SELECT * FROM CUSTOMERS, ORDERS;
    
-- -------------------------------------- INNER JOIN -------------------------------------- --
	SELECT * FROM CUSTOMERS C JOIN ORDERS O WHERE C.id = O.customer_id ;
    
    
    -- USING WHERE
	SELECT 
		CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'Full Name', CONCAT(SUM(AMOUNT), ' EGP') AS Total
	FROM
		CUSTOMERS C
			JOIN
		ORDERS O
	WHERE
		C.id = O.customer_id
	GROUP BY 1
    ORDER BY Total DESC;
    
    
    -- USING ON
	SELECT 
		CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'Full Name', CONCAT(SUM(AMOUNT), ' EGP') AS Total
	FROM
		CUSTOMERS C
			JOIN
		ORDERS O
	ON
		C.id = O.customer_id
	GROUP BY 1
    ORDER BY Total DESC;
    
-- -------------------------------------- LEFT JOIN -------------------------------------- --

    SELECT 
		FIRST_NAME, LAST_NAME, AMOUNT AS Total
	FROM
		CUSTOMERS C
			LEFT JOIN
		ORDERS O
	ON
		C.id = O.customer_id;
    
-- -------------------------------------- RIGHT JOIN -------------------------------------- --

    SELECT 
		FIRST_NAME, LAST_NAME, AMOUNT AS Total
	FROM
		CUSTOMERS C
			RIGHT JOIN
		ORDERS O
	ON
		C.id = O.customer_id;
    
    SELECT 
		first_name, last_name, order_date, amount
	FROM
		customers
			LEFT JOIN
		orders ON orders.customer_id = customers.id;
    
-- -------------------------------------- EXERCISE -------------------------------------- --

	CREATE TABLE students(
		id INT AUTO_INCREMENT,
		first_name VARCHAR(50),
		CONSTRAINT sudents_PK PRIMARY KEY(id)
	);
    
	CREATE TABLE papers (
		id INT AUTO_INCREMENT,
		title VARCHAR(150),
		grade DECIMAL(5 , 2 ),
		student_id INT,
		CONSTRAINT papers_PK PRIMARY KEY (id),
		CONSTRAINT papers_sudents_FK FOREIGN KEY (student_id)
			REFERENCES students (id)
			ON DELETE CASCADE
	);
    
    
	INSERT INTO students (first_name) VALUES 
	('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
	 
	INSERT INTO papers (student_id, title, grade ) VALUES
	(1, 'My First Book Report', 60),
	(1, 'My Second Book Report', 75),
	(2, 'Russian Lit Through The Ages', 94),
	(2, 'De Montaigne and The Art of The Essay', 98),
	(4, 'Borges and Magical Realism', 89);
    
    -- INNER JOIN
		SELECT 
			FIRST_NAME, TITLE, GRADE
		FROM
			STUDENTS S
				INNER JOIN
			PAPERS P ON S.id = P.student_id;
            
    -- LEFT JOIN
		SELECT 
			FIRST_NAME, IFNULL(TITLE, 'No Title'), IFNULL(GRADE, 0)
		FROM
			STUDENTS S
				LEFT JOIN
			PAPERS P ON S.id = P.student_id;
            
    -- LEFT JOIN WITH GROUP BY        
        SELECT 
			FIRST_NAME,
			IFNULL(AVG(GRADE), 0) AS AVG,
			CASE
				WHEN IFNULL(AVG(GRADE), 0) >= 50 THEN 'Passing'
				ELSE 'Failing'
			END AS Result
		FROM
			STUDENTS S
				LEFT JOIN
			PAPERS P ON S.id = P.student_id
		GROUP BY 1
		ORDER BY 2 DESC;    


    -- RIGHT JOIN
		SELECT 
			FIRST_NAME, TITLE, GRADE
		FROM
			STUDENTS S
				RIGHT JOIN
			PAPERS P ON S.id = P.student_id;
    
    
    
    
    
    
    