-- ------------------------------------------------------------------------------------ --
								    -- PART 16 --
								-- WINDOW FUNCTION--
-- ------------------------------------------------------------------------------------ --
	USE book_store;

	Select database();

	CREATE TABLE employees (
		emp_no INT AUTO_INCREMENT,
		department VARCHAR(20),
		salary INT,
        CONSTRAINT employees_PK PRIMARY KEY(emp_no)
	);
	 
	INSERT INTO employees (department, salary) VALUES
	('engineering', 80000),
	('engineering', 69000),
	('engineering', 70000),
	('engineering', 103000),
	('engineering', 67000),
	('engineering', 89000),
	('engineering', 91000),
	('sales', 59000),
	('sales', 70000),
	('sales', 159000),
	('sales', 72000),
	('sales', 60000),
	('sales', 61000),
	('sales', 61000),
	('customer service', 38000),
	('customer service', 45000),
	('customer service', 61000),
	('customer service', 40000),
	('customer service', 31000),
	('customer service', 56000),
	('customer service', 55000);
    
    
-- -------------------------------------- OVER -------------------------------------- --

	SELECT AVG(SALARY) OVER() FROM employees;
    
	SELECT DEPARTMENT, SALARY, AVG(SALARY) OVER() FROM employees;
    
	SELECT DEPARTMENT, SALARY, MIN(SALARY) OVER() AS MIN, MAX(SALARY) OVER() AS MAX, AVG(SALARY) OVER() AS AVG FROM employees;

-- -------------------------------------- OVER( PARTITION BY ) -------------------------------------- --

	SELECT DEPARTMENT, SALARY, AVG(SALARY) OVER(PARTITION BY DEPARTMENT) AS DEPT_PAYROLL FROM employees;
    
    SELECT 
		emp_no, 
		department, 
		salary, 
		COUNT(*) OVER(PARTITION BY department) as dept_count
	FROM employees;
 -- GROUP BY 
	  SELECT 
			DEPARTMENT, COUNT(DEPARTMENT)
		FROM
			EMPLOYEES
		GROUP BY DEPARTMENT;
    
	SELECT 
		emp_no, 
		department, 
		salary, 
		SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
		SUM(salary) OVER() AS total_payroll
	FROM employees;
    
    
-- -------------------------------------- ORDER BY -------------------------------------- --

	SELECT 
		DEPARTMENT,
		SALARY, 
		AVG(SALARY) OVER(PARTITION BY DEPARTMENT) AS AVG_SALARY, 
		AVG(SALARY) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS ROLLING_AVG_SALARY 
    FROM EMPLOYEES;
    
	   SELECT 
		emp_no, 
		department, 
		salary, 
		MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
	FROM employees;


-- -------------------------------------- RANK() -------------------------------------- --
	-- RANK ROW BUT THER IS A GAP
	SELECT 
		DEPARTMENT, 
		SALARY, 
		RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) 
    FROM EMPLOYEES;
    
    	SELECT 
		DEPARTMENT, 
		SALARY, 
		RANK() OVER(ORDER BY SALARY) 
    FROM EMPLOYEES;
    
    SELECT 
		DEPARTMENT, 
		SALARY, 
		RANK() OVER(ORDER BY SALARY) AS OVERALL_SALARY_RANK,
        RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY)
    FROM EMPLOYEES;
    
    
	SELECT 
		DEPARTMENT, 
		SALARY, 
		ROW_NUMBER() OVER(ORDER BY SALARY) AS OVERALL_SALARY_ROW_NUMBER,
        RANK() OVER(ORDER BY SALARY) AS OVERALL_SALARY_RANK,
        ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_ROW_NUMBER,
        RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_RANK
    FROM EMPLOYEES;
    
-- -------------------------------------- DENC_RANK() -------------------------------------- --
	-- RANK ROW BUT WITHOU A GAP
	SELECT 
		DEPARTMENT, 
		SALARY, 
		RANK() OVER(ORDER BY SALARY) AS OVERALL_SALARY_RANK,
		DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_DENSE_RANK,
		RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_RANK
	FROM EMPLOYEES ;

-- -------------------------------------- ROW_NUMBER() -------------------------------------- --
	-- OUTPUT THE INDEX OF EACH ROW IN THE COLUMN
	SELECT 
			DEPARTMENT, 
			SALARY, 
			ROW_NUMBER() OVER(ORDER BY SALARY) AS OVERALL_SALARY_ROW_NUMBER,
			RANK() OVER(ORDER BY SALARY) AS OVERALL_SALARY_RANK,
			ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_ROW_NUMBER,
			RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_SALARY_RANK
		FROM EMPLOYEES;

-- -------------------------------------- NTILE() -------------------------------------- --

	SELECT 
		DEPARTMENT, 
		SALARY, 
		NTILE(4) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS DEPT_DATA,
		NTILE(4) OVER(ORDER BY SALARY) AS OVER_ALL_DATA
	FROM EMPLOYEES ORDER BY DEPARTMENT;
    
    
-- -------------------------------------- FIRST_VALUE() -------------------------------------- --

	-- RETURN THE FIRST ORDER VALUE FROM COLUMN BASED ON THE COLUMN ORDER 
	SELECT 
		EMP_NO, 
		DEPARTMENT, 
		SALARY, 
		FIRST_VALUE(EMP_NO) OVER(ORDER BY SALARY DESC) AS FRIST_TOP_SALARY
    FROM EMPLOYEES;
    
	SELECT 
		EMP_NO, 
		DEPARTMENT, 
		SALARY
    FROM EMPLOYEES WHERE EMP_NO = (SELECT  FIRST_VALUE(EMP_NO) OVER(ORDER BY SALARY DESC)  FROM EMPLOYEES LIMIT 1);
    
    
	SELECT 
		EMP_NO, 
		DEPARTMENT, 
		SALARY
    FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 1;
    
-- -------------------------------------- LAG() - LEAD() -------------------------------------- --
-- LAG()
	SELECT 
		EMP_NO,
		DEPARTMENT,
		SALARY, 
		LAG(SALARY) OVER (ORDER BY SALARY) AS PREVIOUS_SALARY
    FROM EMPLOYEES;

	SELECT 
		EMP_NO,
		DEPARTMENT,
		SALARY, 
		SALARY - LAG(SALARY) OVER (ORDER BY SALARY) AS PREVIOUS_SALARY
    FROM EMPLOYEES;
-- LEAD()
	SELECT 
		EMP_NO,
		DEPARTMENT,
		SALARY, 
		LEAD(SALARY) OVER (ORDER BY SALARY) AS NEXT_SALARY
    FROM EMPLOYEES;

	SELECT 
		EMP_NO,
		DEPARTMENT,
		SALARY, 
		SALARY - LEAD(SALARY) OVER (ORDER BY SALARY) AS SUB_NEXT_SALARY
    FROM EMPLOYEES;











