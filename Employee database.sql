-- Create a hobby table 
CREATE TABLE `hobby` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
-- Create an employee table 
CREATE TABLE `employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `mobile_number` VARCHAR(10) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

-- Create an employee_salary table
CREATE TABLE `employee_salary` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_employee_id` INT NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `employee_id_idx` (`fk_employee_id` ASC),
  CONSTRAINT `employee_id`
    FOREIGN KEY (`fk_employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Create an employee_hobby table
CREATE TABLE `employee_hobby` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_employee_id` INT NOT NULL,
  `fk_hobby_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `employeetable_id_idx` (`fk_employee_id` ASC),
  INDEX `hobby_id_idx` (`fk_hobby_id` ASC),
  CONSTRAINT `employeetable_id`
    FOREIGN KEY (`fk_employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hobby_id`
    FOREIGN KEY (`fk_hobby_id`)
    REFERENCES `hobby` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Insert data into hobby table	
INSERT INTO hobby(name) VALUES('Sports');
INSERT INTO hobby(name) VALUES('Gaming');
INSERT INTO hobby(name) VALUES('Reading');
INSERT INTO hobby(name) VALUES('Dancing');
INSERT INTO hobby(name) VALUES('Travelling'); 

-- Get all hobby record
SELECT * FROM hobby;

-- Insert data into employee table
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Jaivik', 'Patel', 21, 7575864897, 'Pratik Society');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Jeet', 'Mandanka', 21, 7047130820, 'Dharmajogi App.');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Deep', 'Hadvani', 19, 9512629090 , 'Manharnagar-2 soc.');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Sahil', 'Lakhani', 20, 9624741440, 'Panchratna soc');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Anil', 'Patel', 23, 9325167595, 'Sundarvan soc');

-- Get all employee record
SELECT * FROM employee;

-- Insert data into employee_salary table
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(01 , 10000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(02 , 15000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(03 , 20000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(04 , 25000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(05 , 30000); 

-- Get all employee_salary record
SELECT * FROM employee_salary;

-- Insert data into employee_hobby table
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(01, 01);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(02, 02);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(03, 03);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(04, 04);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(05, 05); 

-- Get all employee_hobby record
SELECT * FROM employee_hobby;

-- Update data of all tables
UPDATE hobby
SET name = 'adventure'
WHERE id = 3;

UPDATE employee
SET first_name = 'Deep',
	last_name = 'patel',
    age = 20
WHERE id = 3;

UPDATE employee_salary
SET salary = 45000
WHERE id = 3;

UPDATE employee_hobby
SET fk_employee_id = 4
WHERE id = 3;

-- Delete 2 records of all tables
DELETE FROM hobby 
WHERE id IN (4,5);

DELETE FROM employee 
WHERE id IN (4,5);

DELETE FROM employee_salary 
WHERE id IN (1,2);

DELETE FROM employee_hobby 
WHERE id IN (1,2);

-- Truncate all tables
TRUNCATE table employee_hobby;

-- Get all employee_hobby record
SELECT * FROM employee_hobby;

TRUNCATE table employee_salary;

-- Get all employee_salary record
SELECT * FROM employee_salary;

-- Drop foreign key and truncate employee_salary table
ALTER TABLE employee_salary DROP FOREIGN KEY employee_id;
ALTER TABLE employee_salary DROP INDEX employee_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE employee_hobby DROP FOREIGN KEY employeetable_id;
ALTER TABLE employee_hobby DROP INDEX employeetable_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee;
SET FOREIGN_KEY_CHECKS = 1;

-- Get all employee record
SELECT * FROM employee;

-- Drop foreign key and truncate employee_hobby table
ALTER TABLE employee_hobby DROP FOREIGN KEY hobby_id;
ALTER TABLE employee_hobby DROP INDEX hobby_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE hobby;
SET FOREIGN_KEY_CHECKS = 1;

-- Get all hobby record
SELECT * FROM hobby;

-- Add constraints in table employee_salary
ALTER TABLE `employee_salary` 
ADD INDEX `employee_id_idx` (`fk_employee_id` ASC);
ALTER TABLE `employee_salary` 
ADD CONSTRAINT `employee_id`
  FOREIGN KEY (`fk_employee_id`)
  REFERENCES `employee` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Add constraints in table employee_hobby
ALTER TABLE `employee_hobby` 
ADD INDEX `employeetable_id_idx` (`fk_employee_id` ASC);
ALTER TABLE `employee_hobby` 
ADD CONSTRAINT `employeetable_id`
  FOREIGN KEY (`fk_employee_id`)
  REFERENCES `employee` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `employee_hobby`
ADD INDEX `hobby_id_idx` (`fk_hobby_id` ASC);
ALTER TABLE `employee_hobby` 
ADD CONSTRAINT `hobby_id`
  FOREIGN KEY (`fk_hobby_id`)
  REFERENCES `hobby` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Insert values  
INSERT INTO hobby(name) VALUES('Sports');
INSERT INTO hobby(name) VALUES('Gaming');
INSERT INTO hobby(name) VALUES('Reading');
INSERT INTO hobby(name) VALUES('Dancing');
INSERT INTO hobby(name) VALUES('Travelling');

INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES ('Jaivik', 'Patel', 21, 7575864897, 'Pratik Society');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Jeet', 'Mandanka', 21, 7047130820, 'Dharmajogi App.');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Deep', 'Hadvani', 19, 9512629090 , 'Manharnagar-2 soc.');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Sahil', 'Lakhani', 20, 9624741440, 'Panchratna soc');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('Anil', 'Patel', 23, 9325167595, 'Sundarvan soc');
INSERT INTO employee(first_name, last_name, age, mobile_number, address) VALUES('vishal', 'Prajapati', 22, 9712998381, 'Sidhharth Icon');

INSERT INTO employee_salary(fk_employee_id, salary) VALUES(01 , 10000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(02 , 15000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(03 , 20000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(04 , 25000); 
INSERT INTO employee_salary(fk_employee_id, salary) VALUES(05 , 30000); 

INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(01, 03);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(02, 02);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(03, 04);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(04, 05);
INSERT INTO employee_hobby(fk_employee_id, fk_hobby_id) VALUES(05, 01); 

-- Create a select single query to get all employee name, hobby_name in single column
SELECT first_name FROM employee
UNION
SELECT name FROM hobby;

-- Create a select query to get  employee name, his/her employee_salary
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, es.salary 
FROM employee e
INNER JOIN employee_salary es
ON e.id = es.fk_employee_id;

-- Update value of id column of hobby table
UPDATE hobby
SET id = '101'
WHERE id = 1;

UPDATE hobby
SET id = '102'
WHERE id = 2;

UPDATE hobby
SET id = '103'
WHERE id = 3;

UPDATE hobby
SET id = '104'
WHERE id = 4;

UPDATE hobby
SET id = '105'
WHERE id = 5;

-- Insert into employee_salary table 
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('2', '15000');
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('3', '20000');
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('3', '25000');
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('4', '30000');  
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('4', '32000'); 
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('4', '34000'); 
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('4', '35000'); 
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('5', '37000');  
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('5', '35000');  
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('5', '36000');  
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('5', '38000');
INSERT INTO `employee_salary` (`fk_employee_id`, `salary`) VALUES ('5', '35000');

-- Insert into employee_hobby table
INSERT INTO `employee_hobby` (`id`, `fk_employee_id`, `fk_hobby_id`) VALUES ('6', '2', '103'); 
INSERT INTO `employee_hobby` (`id`, `fk_employee_id`, `fk_hobby_id`) VALUES ('7', '3', '101');
INSERT INTO `employee_hobby` (`id`, `fk_employee_id`, `fk_hobby_id`) VALUES ('8', '5', '103'); 
INSERT INTO `employee_hobby` (`id`, `fk_employee_id`, `fk_hobby_id`) VALUES ('9', '5', '102'); 
INSERT INTO `employee_hobby` (`id`, `fk_employee_id`, `fk_hobby_id`) VALUES ('10', '1', '104');

-- Create a select query to get employee name, total salary of employee, hobby name(comma-separated - use subquery for hobby name)
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, SUM(es.salary) AS total_salary,
(SELECT GROUP_CONCAT(DISTINCT h.name) 
	FROM hobby AS h
	INNER JOIN employee_hobby AS eh
		ON h.id = eh.fk_hobby_id
		AND e.id = eh.fk_employee_id) AS hobby_name
FROM employee AS e  
LEFT JOIN employee_salary AS es 
	ON e.id = es.fk_employee_id
GROUP BY e.id;

