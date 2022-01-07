-- Create an employee database
CREATE SCHEMA `employee` ;

-- Create a hobby table 
CREATE TABLE`hobby` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
 
-- Create an employee table 
CREATE TABLE `employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `mobile_number` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

-- Create an employee_salary table
CREATE TABLE `employee_salary` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_employee_id` INT NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `employee_id_idx` (`fk_employee_id` ASC) VISIBLE,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`fk_employee_id`)
    REFERENCES `employee`.`employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Create an employee_hobby table
CREATE TABLE `employee_hobby` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_employee_id` INT NOT NULL,
  `fk_hobby_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `employeetable_id_idx` (`fk_employee_id` ASC) VISIBLE,
  INDEX `hobby_id_idx` (`fk_hobby_id` ASC) VISIBLE,
  CONSTRAINT `employeetable_id`
    FOREIGN KEY (`fk_employee_id`)
    REFERENCES `employee`.`employee` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hobby_id`
    FOREIGN KEY (`fk_hobby_id`)
    REFERENCES `employee`.`hobby` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Insert data into hobby table	
INSERT INTO hobby VALUES(01, 'Sports');
INSERT INTO hobby VALUES(02, 'Gaming');
INSERT INTO hobby VALUES(03, 'Readig');
INSERT INTO hobby VALUES(04, 'Dancing');
INSERT INTO hobby VALUES(05, 'Travelling'); 


SELECT * FROM hobby;

-- Insert data into employee table
INSERT INTO employee VALUES(01, 'Jaivik', 'Patel', 21, 7575864897, 'Pratik Society');
INSERT INTO employee VALUES(02, 'Jeet', 'Mandanka', 21, 7047130820, 'Dharmajogi App.');
INSERT INTO employee VALUES(03, 'Deep', 'Hadvani', 19, 9512629090 , 'Manharnagar-2 soc.');
INSERT INTO employee VALUES(04, 'Sahil', 'Lakhani', 20, 9624741440, 'Panchratna soc');
INSERT INTO employee VALUES(05, 'Anil', 'Patel', 23, 9325167595, 'Sundarvan soc');

SELECT * FROM employee;

-- Insert data into employee_salary table
INSERT INTO employee_salary VALUES(01, 01 , 10000); 
INSERT INTO employee_salary VALUES(02, 02 , 15000); 
INSERT INTO employee_salary VALUES(03, 03 , 20000); 
INSERT INTO employee_salary VALUES(04, 04 , 25000); 
INSERT INTO employee_salary VALUES(05, 05 , 30000); 

SELECT * FROM employee_salary;

--Insert data into employee_hobby table
INSERT INTO employee_hobby VALUES(01, 01, 01);
INSERT INTO employee_hobby VALUES(02, 02, 02);
INSERT INTO employee_hobby VALUES(03, 03, 03);
INSERT INTO employee_hobby VALUES(04, 04, 05);
INSERT INTO employee_hobby VALUES(05, 05, 05); 

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
SET employee_id = 4
WHERE id = 3;

-- Delete 2 records of all tables
DELETE FROM hobby 
WHERE id IN (4,5)

DELETE FROM employee 
WHERE id IN (4,5)

DELETE FROM employee_salary 
WHERE id IN (1,2)

DELETE FROM employee_hobby 
WHERE id IN (1,2)

-- Truncate all tables
TRUNCATE table employee_hobby;
SELECT * FROM employee_hobby;

TRUNCATE table employee_salary;
SELECT * FROM employee_salary;

-- Drop foreign key and truncate table
ALTER TABLE employee_salary DROP FOREIGN KEY employee_id;
ALTER TABLE employee_salary DROP INDEX fk_employee_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE employee_hobby DROP FOREIGN KEY employeetable_id;
ALTER TABLE employee_hobby DROP INDEX employee_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM employee;

-- Drop foreign key and truncate table
ALTER TABLE employee_hobby DROP FOREIGN KEY hobby_id;
ALTER TABLE employee_hobby DROP INDEX hobby_id_idx;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE hobby;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM hobby;

-- Add constraint 
ALTER TABLE `employee`.`employee_salary` 
ADD INDEX `emplyee_id_idx` (`fk_employee_id` ASC) VISIBLE;
ALTER TABLE `employee`.`employee_salary` 
ADD CONSTRAINT `emplyee_id`
  FOREIGN KEY (`fk_employee_id`)
  REFERENCES `employee`.`employee` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Add constraint   
ALTER TABLE `employee`.`employee_hobby` 
ADD INDEX `employeetable_id_idx` (`fk_employee_id` ASC) VISIBLE,
ADD INDEX `hobby_id_idx` (`fk_hobby_id` ASC) VISIBLE;
ALTER TABLE `employee`.`employee_hobby` 
ADD CONSTRAINT `employeetable_id`
  FOREIGN KEY (`fk_employee_id`)
  REFERENCES `employee`.`employee` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `hobby_id`
  FOREIGN KEY (`fk_hobby_id`)
  REFERENCES `employee`.`hobby` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Insert values  
INSERT INTO hobby VALUES(01, 'Sports');
INSERT INTO hobby VALUES(02, 'Gaming');
INSERT INTO hobby VALUES(03, 'Readig');
INSERT INTO hobby VALUES(04, 'Dancing');
INSERT INTO hobby VALUES(05, 'Travelling');

INSERT INTO employee VALUES(01, 'Jaivik', 'Patel', 21, 7575864897, 'Pratik Society');
INSERT INTO employee VALUES(02, 'Jeet', 'Mandanka', 21, 7047130820, 'Dharmajogi App.');
INSERT INTO employee VALUES(03, 'Deep', 'Hadvani', 19, 9512629090 , 'Manharnagar-2 soc.');
INSERT INTO employee VALUES(04, 'Sahil', 'Lakhani', 20, 9624741440, 'Panchratna soc');
INSERT INTO employee VALUES(05, 'Anil', 'Patel', 23, 9325167595, 'Sundarvan soc');

INSERT INTO employee_salary VALUES(01, 01 , 10000); 
INSERT INTO employee_salary VALUES(02, 02 , 15000); 
INSERT INTO employee_salary VALUES(03, 03 , 20000); 
INSERT INTO employee_salary VALUES(04, 04 , 25000); 
INSERT INTO employee_salary VALUES(05, 05 , 30000); 

INSERT INTO employee_hobby VALUES(01, 01, 01);
INSERT INTO employee_hobby VALUES(02, 02, 02);
INSERT INTO employee_hobby VALUES(03, 03, 03);
INSERT INTO employee_hobby VALUES(04, 04, 05);
INSERT INTO employee_hobby VALUES(05, 05, 05); 

-- Create a select single query to get all employee name, hobby_name in single column
SELECT name FROM hobby
UNION
SELECT first_name FROM employee;

-- Create a select query to get  employee name, his/her employee_salary

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, es.salary 
FROM employee e
INNER JOIN employee_salary es
ON e.id = es.fk_employee_id;