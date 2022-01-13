-- Create a job table
CREATE TABLE job ( 
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(10) NOT NULL, 
	min_salary DECIMAL NOT NULL, 
	max_salary DECIMAL NOT NULL,
	PRIMARY KEY (id) );

-- Create a country table	
CREATE TABLE country (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL, 
	PRIMARY KEY (id) );

-- Create a department table	
CREATE TABLE department (
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(15) NOT NULL, 
	fk_country_id INT NOT NULL, 
	PRIMARY KEY (id) , 
	CONSTRAINT country_id 
		FOREIGN KEY (fk_country_id) 
		REFERENCES country(id) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE);
		
-- Create an employee table
CREATE TABLE employee ( 
	id INT NOT NULL AUTO_INCREMENT, 
	first_name VARCHAR(20) NOT NULL, 
	last_name VARCHAR(20) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	salary DECIMAL NOT NULL, 
	fk_department_id INT NOT NULL, 
	fk_job_id INT NOT NULL, 
	PRIMARY KEY (id), 
	CONSTRAINT department_id 
		FOREIGN KEY (fk_department_id) 
		REFERENCES department(id) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE, 
	CONSTRAINT job_id 
		FOREIGN KEY (fk_job_id) 
		REFERENCES job(id) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE);
		
-- Insert values into job table
INSERT INTO job (name, min_salary, max_salary) VALUES ('Peon', '5000', '15000'); 
INSERT INTO job (name, min_salary, max_salary) VALUES ('HR', '15000', '50000'); 
INSERT INTO job (name, min_salary, max_salary) VALUES ('Developer', '10000', '60000');
INSERT INTO job (name, min_salary, max_salary) VALUES ('Manager', '12000', '40000');
INSERT INTO job (name, min_salary, max_salary) VALUES ('Consultant', '13000', '30000');

-- Insert values into country table
INSERT INTO country (name) VALUES ('India'); 
INSERT INTO country (name) VALUES ('USA'); 
INSERT INTO country (name) VALUES ('UK'); 
INSERT INTO country (name) VALUES ('Australia'); 
INSERT INTO country (name) VALUES ('Canada');

-- Insert values into department table
INSERT INTO department (name, fk_country_id) VALUES ('Peon', '1'); 
INSERT INTO department (name, fk_country_id) VALUES ('HRM', '4'); 
INSERT INTO department (name, fk_country_id) VALUES ('IT', '2'); 
INSERT INTO department (name, fk_country_id) VALUES ('Account', '5'); 
INSERT INTO department (name, fk_country_id) VALUES ('Director', '3'); 

-- Insert values into employee table
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Jaivik', 'Patel', 'pateljaivik123@gmail.com', '15000', '3', '3'); 
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Deep', 'Hadvani', 'hadvanideep456@gmail.com', '12000', '2', '2'); 
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Jeet ', 'Patel', 'pateljeet789@gmail.com', '18000', '4', '5'); 
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Sahil', 'Lakhani', 'lakhanisahil235@gmail.com', '13000', '5', '4'); 
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Anil', 'Patel', 'patelanil567@gmail.com', '10000', '1', '1'); 
INSERT INTO employee (first_name, last_name, email, salary, fk_department_id, fk_job_id) VALUES ('Vishal', 'Prajapati', 'prvishal478@gmail.com', '0', '3', '3');
 
-- Get records from all tables
SELECT * FROM job;
SELECT * FROM country;
SELECT * FROM department;
SELECT * FROM employee;

-- Update into country table
UPDATE country SET id = '101' WHERE id = '1'; 
UPDATE country SET id = '102' WHERE id = '2'; 
UPDATE country SET id = '103' WHERE id = '3'; 
UPDATE country SET id = '104' WHERE id = '4'; 
UPDATE country SET id = '105' WHERE id = '5';

-- Update into department table
UPDATE department SET id = '111' WHERE id = '1'; 
UPDATE department SET id = '112' WHERE id = '2'; 
UPDATE department SET id = '113' WHERE id = '3'; 
UPDATE department SET id = '114' WHERE id = '4'; 
UPDATE department SET id = '115' WHERE id = '5';

-- Update into employee table
UPDATE employee SET id = '1001' WHERE id = '1'; 
UPDATE employee SET id = '1002' WHERE id = '2'; 
UPDATE employee SET id = '1003' WHERE id = '3'; 
UPDATE employee SET id = '1004' WHERE id = '4'; 
UPDATE employee SET id = '1005' WHERE id = '5'; 
UPDATE employee SET id = '1006' WHERE id = '6';
 
-- Create query to get name, department name, country name, job name
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.name AS department_name, j.name AS job_name, c.name AS country_name
FROM employee AS e
LEFT JOIN department AS d
	ON d.id = e.fk_department_id
LEFT JOIN job AS j
	ON j.id = e.fk_job_id
LEFT JOIN country AS c
	ON c.id = d.fk_country_id
GROUP BY e.id;

-- Create query to get 2nd highest salary of the employee
SELECT * FROM employee 
ORDER BY salary DESC LIMIT 1,1;

-- Create query to get all job name and department name in single query
SELECT name FROM job
UNION
SELECT name FROM department; 

