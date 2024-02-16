-- ------------------------------------------------------------------------------------ --
								    -- PART 12 --
-- ------------------------------------------------------------------------------------ --

-- -------------------------------------- UNIQUE -------------------------------------- --

	CREATE TABLE contacts (
		name VARCHAR(100) NOT NULL,
		phone VARCHAR(15) NOT NULL UNIQUE
	);
	 
	INSERT INTO contacts (name, phone)
	VALUES ('billybob', '8781213455');
	 
	-- This insert would result in an error:
		INSERT INTO contacts (name, phone)
		VALUES ('billybob', '8781213455');
    
-- -------------------------------------- CHECK Constraints -------------------------------------- --
	CREATE TABLE users (
		username VARCHAR(50) UNIQUE,
		age TINYINT CHECK (age >= 18)
	);
    
    -- Error Code: 3819. Check constraint 'users_chk_1' is violated.
		INSERT INTO USERS(USERNAME, AGE) VALUES ('MODY', 15);
        
     CREATE TABLE message(
        words VARCHAR(20) CHECK (reverse(words) = words)
     );
     
	-- Check constraint 'message_chk_1' is violated.
		INSERT INTO MESSAGE(WORDS) VALUES('MODY');

	INSERT INTO MESSAGE(WORDS) VALUES('RACCAR');
         
	SELECT * FROM MESSAGE;
     
-- -------------------------------------- Named Constraints -------------------------------------- --
     
	CREATE TABLE users2 (
		username VARCHAR(20) NOT NULL,
		age INT,
		CONSTRAINT age_not_negative CHECK (age >= 0)
	);
     
     
-- -------------------------------------- Multi Column Constraints -------------------------------------- --
	CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
	INSERT INTO companies(name, address) VALUES ('mody', 'assuit');
    
 	INSERT INTO companies(name, address) VALUES ('maged', 'assuit');
    
	INSERT INTO companies(name, address) VALUES ('mody', 'assuit');


	CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sprice_gt_pprice CHECK (sale_price >= purchase_price)
);

-- -------------------------------------- Alter Table -------------------------------------- --
	-- ADD COLUMN
		ALTER TABLE COMPANIES ADD COLUMN phone VARCHAR(15);
        
    -- DROP COLUMN
			ALTER TABLE COMPANIES DROP COLUMN phone;
            
	-- RENAME TABLE
		RENAME TABLE COMPANIES TO companie; 
		SELECT * FROM COMPANIE; 
        
    -- COLUMN NAME 
		ALTER TABLE COMPANIE RENAME COLUMN NAME TO FNAME;
        
	-- MODIFYING COLUMN
		ALTER TABLE COMPANIE MODIFY FNAME VARCHAR(125) NOT NULL;
        DESC COMPANIE; 
        
	-- MODIFYING COLUMN
		ALTER TABLE COMPANIE CHANGE FNAME name VARCHAR(125) NOT NULL;
        DESC COMPANIE; 
        
        CREATE TABLE person01 (
			id INT AUTO_INCREMENT,
            text VARCHAR(120),
			CONSTRAINT PK_1 PRIMARY KEY (ID),
            CONSTRAINT text_not_capital CHECK(substr(text ,1,1) like 'upper(substr(text ,1,1))%')
		);
		
        CREATE INDEX t1 on person01(text);
        
        INSERT INTO person01(text) VALUES ('mody');
        
        drop table person01;
        
		CREATE VIEW new_table AS SELECT * FROM BOOKS WHERE RELEASED_YEAR > 2001; 
        
        SELECT * FROM NEW_TABLE;
        
        
        DESC people;
        ALTER TABLE PEOPLE DROP COLUMN ID;
        ALTER TABLE people ADD COLUMN ID11 INT PRIMARY KEY;
        
        -- ADD CONSTRAINT
			ALTER TABLE PEOPLE ADD CONSTRAINT PK_01 PRIMARY KEY(ID);
            
        -- DROP CONSTRAINT
			ALTER TABLE PERSON01 DROP CONSTRAINT text_not_capital;
	
        