SELECT 1+1;

SELECT 9*9;

-- TO SHOW ALL THE SORED DATABASES 
	SHOW databases;

-- TO CREATE A DATABASES
	CREATE DATABASE FristData;

-- TO DELETE ENTIRE A DATABASES
	DROP DATABASE FristData;

-- TO USE A DATABASES || DATABASE NAME NOT CASE SENSITIVE 
	USE sakila;
    USE SAKILA;

-- TO KNOW WHAT DATABASE IN USE
	SELECT DATABASE();

select * from address;


CREATE DATABASE OnlineStore;
USE OnlineStore;
SELECT DATABASE();

--  TO CREATE TABLE
		 CREATE TABLE Customers(
			name    VARCHAR(100),
			age     INT,
			address VARCHAR(150)
		 );
         -- Exersie 1
			 CREATE TABLE pastries(
				name 	 VARCHAR(50),
				quantity INT
			 );
             
             -- Exersie 2
             CREATE TABLE pepole(
				frist_name VARCHAR(20),
                LAST_name  VARCHAR(20),
                age INT
             );
             DESC pepole;
             
		-- Exersie 3 NULL || NOT-NULL
             CREATE TABLE students(
				name VARCHAR(20),
                age INT NOT NULL DEFAULT 20,
                level INT NOT NULL
             );
             DESC students;
             
       	-- Exersie 4 DEFAULTS VALUES && NULL || NOT-NULL
             CREATE TABLE orders(
				order_number INT NOT NULL,
				order_type VARCHAR(20)  DEFAULT 'Un-Named'
             );
             
             -- Exersie 5 DEFAULTS VALUES 
				 CREATE TABLE cats4  (    
					name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
					age INT  DEFAULT 99 
					);
				 -- THUS WILL INSERT NULL VALUE INSTED OF DEFAULT 
						INSERT INTO cats4(age) VALUES(NULL) ;
				 -- THIS WILL OUTPUT AN ERROR 
						INSERT INTO cats4(name, age) VALUES(NULL);
				  SELECT * FROM cats4;
                  
             -- Exersie 6 PRIMARY KEY
				  CREATE TABLE unique_students(
					  ID INT NOT NULL PRIMARY KEY,
					  name VARCHAR(20) DEFAULT 'Un-Named'
				  );    
				  DESC unique_students;    
                  
                  CREATE TABLE unique_students01(
					  ID INT NOT NULL,
					  name VARCHAR(20) DEFAULT 'Un-Named',
                      PRIMARY KEY(ID)
				  );    
				  DESC unique_students01; 
                  
             -- Exersie 7 AUTO_INCREMENT
				  CREATE TABLE unique_students02(
					  ID INT NOT NULL AUTO_INCREMENT,
					  name VARCHAR(20) DEFAULT 'Un-Named',
                      PRIMARY KEY (ID)
				  );    
				  DESC unique_students02;  
                  
             -- Exersie 8 AUTO_INCREMENT
				 CREATE TABLE Employees(
					 ID INT AUTO_INCREMENT,
					 frist_name VARCHAR(50) NOT NULL,
					 last_name VARCHAR(50) NOT NULL,
					 middel_name VARCHAR(50),
					 age INT  NOT NULL,
					 current_status VARCHAR(50) DEFAULT 'Employed',
                     PRIMARY KEY(ID)
				 );
                 INSERT INTO employees(first_name, last_name, age) VALUES ('Dora', 'Smith', 58);
                 DESC Employees;
                 
-- TO SHOW THE EXISTENET TABLES IN THE DATABASE
		SHOW TABLES;
 
  -- TO SHOW ALL THE COLUMNS IN THE TABLES
		SHOW COLUMNS FROM Customers;
		-- OR USE
			DESC Customers;
            
-- DROP TABLE
		DROP TABLE Customers;
        
 -- INSERT DATA INTO TABLE           
		INSERT INTO Customers (name, address, age) VALUES('Mody', 'assuit', 23);
        -- ORDER IS IMORTANT 
			INSERT INTO Customers (address, name, age) VALUES('Cairo', 'Maged', 26);
		SELECT * FROM Customers;
        
 -- MULTI-INSERT DATA INTO TABLE           
       INSERT INTO pastries (name, quantity)
					 VALUES ('Mody', 10),
							('Maged', 15);
       SELECT * FROM pastries; 
 
-- ---------------------------------------------------------------------------
								-- PART 5--
-- ---------------------------------------------------------------------------
SHOW TABLES;
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

	-- To get all the columns:
		SELECT * FROM cats;
	-- To only get the age column:
		SELECT age FROM cats;
	-- To select multiple specific columns:
		SELECT name, breed FROM cats;

-- WHERE CONDITION IS INSENSITIVE 
	SELECT name ,age FROM cats WHERE name='eGG';
    
-- we use = to cheek if the values in both sides are the same 
	SELECT * FROM cats WHERE cat_id=age;
    
-- ALIASES لاسماء المستعاره 
	SELECT name AS CatName FROM cats;
    
-- USE TO DISABLE SAVE MODE 
    SET SQL_SAFE_UPDATES=0;

-- UPDATA QUERY
    UPDATE cats SET name= 'kitty' WHERE age=4;
    UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
    
	-- Exersie -- TABLE NAME && COLUMNS NAMES NOT CASE SENSITIVE 
		UPDATE cats SET NAME='JACK' WHERE NAME='Jackson';
        UPDATE CATS SET BREED='Persian' WHERE NAME='SHOERTHAIR';
        
-- Delete all cats with name of 'Egg':
	DELETE FROM cats WHERE name='Egg';
    
    -- Exersie
		DELETE FROM CATS WHERE CAT_ID = AGE;
        

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    