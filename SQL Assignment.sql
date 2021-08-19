--This statement crates the database allowing tables to be inserted within it. 
CREATE DATABASE LincolnGardenCentre;

--The CREATE TABLE syntax creates a table which you name. I have set table attributes inside of the table giving them datatypes and selecting whether they are either UNIQUE or NOT NULL.
CREATE TABLE Customer (
	CustomerID int NOT NULL AUTO_INCREMENT, --The AUTO_INCREMENT syntax automatically creates a new id number every time a record is created witin this table. 
	FirstName varchar(100) NOT NULL, --Here i have set the FirstName to varchar and limited the number of characters to 100.  
	Surname varchar(100) NOT NULL,
	Customer_Email varchar(100) UNIQUE, --Ihave set the email coloumn as UNIQUE because everyone will have a unique email to them and them only.
	PhoneNO varchar(11) UNIQUE, --I have also set the phone number to unique as everyone has a unique phone number.
	Home_AddressLine1 varchar(255) NOT NULL,
	Home_AddressLine2 varchar(255) DEFAULT 'EMPTY', --Here i have set the addressline 2 to default as not everyone uses this addressline, some just use addressline1. If left blank it just names that column 'EMPTY'.
	Home_Postcode varchar (7) NOT NULL,
	City varchar (100) NOT NULL,
	Billing_AddressLine1 varchar(255) NOT NULL,
	Billing_AddressLine2 varchar(255) DEFAULT 'EMPTY',
	Billing_Postcode varchar (7) NOT NULL,
	Billing_City varchar (100) NOT NULL,
	
	
	PRIMARY KEY (CustomerID) --The primary Key for this table is CustomerID, it allows me to create relationships to other tables through the use of this key and a foreign key. 
);

CREATE TABLE Employee(
	EmployeeID int AUTO_INCREMENT, --An EmployeeID number is automatically generated for a new employee when one is inserted using the AUTO_INCREMENT statement.
	Employee_FirstName varchar(100) NOT NULL,
	Employee_Surname varchar(100) NOT NULL,
	Employee_Job_Role varchar(100) NOT NULL,
	Employee_Gender varchar(10) NOT NULL,
	Employee_Email varchar(100) NOT NULL,
	PhoneNO varchar(11) NOT NULL,
	Employee_DOB date NOT NULL,
	Employee_AddressLine1 varchar(255) NOT NULL,
	Employee_AddressLine2 varchar(255) DEFAULT 'EMPTY',
	Employee_Postcode varchar (7) NOT NULL,
	City varchar (100) NOT NULL,
	
	PRIMARY KEY (EmployeeID) --I have set the primary key for this table as EmployeeID
);

CREATE TABLE Supplier(
	SupplierID int AUTO_INCREMENT,
	Supplier_Name varchar(100) NOT NULL,
	Supplier_Email varchar(100) NOT NULL,
	Supplier_PhoneNO varchar(11) NOT NULL,
	Supplier_AddressLine1 varchar(255) NOT NULL,
	Supplier_AddressLine2 varchar(255) DEFAULT 'EMPTY',
	Supplier_Postcode varchar (7) NOT NULL,
	Supplier_City varchar (100) NOT NULL,
	
	PRIMARY KEY (SupplierID)--Here i have set the primary key to supplier ID. 
);
CREATE TABLE Items (
	ItemID int NOT NULL AUTO_INCREMENT, --An ItemID number is automatically generated for a new item when one is inserted using the AUTO_INCREMENT statement. 
	Plant_Name varchar(100) NOT NULL,
	Latin_Name varchar(100) NOT NULL,	
	Plant_Catergory varchar(100) NOT NULL,
	Decsription varchar(255) NOT NULL,
	Season_of_Interest varchar(100) NOT NULL,
	How_to_Grow varchar(255) NOT NULL,
	Plant_Price real NOT NULL,
	SupplierID int NOT NULL, 
	
	PRIMARY KEY (ItemID) --Here i have set the primary key to ItemID.
);

CREATE TABLE CustomerOrder(
	COrderID int AUTO_INCREMENT, --A Customer Order ID is autmatically created everytime a customer order is placed
	CustomerID int NOT NULL,
	ItemID int NOT NULL,
	COrder_Date date,
	COrder_Recieved_Date date,
	COrder_DOPayment date,
	Quantity int NOT NULL,
	COrder_Total_Cost real NOT NULL,
	COrder_Status varchar(100) NOT NULL,
	
	PRIMARY KEY (COrderID), --Here i have set the primary key to COrderID
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID), --This statement creates a foreign key and refences it to the primary key in the corresponding table. I have created a relationship between the CustomerOrder table and the Customer table. 
	FOREIGN KEY(ItemID) REFERENCES Items(ItemID) --This statement also creates a foreign key and refences it to the primary key in the corresponding table.  I have created a relationship between the CustomerOrder Table and the Items Table.
);

CREATE TABLE PurchaseOrder(
	POrderID int NOT NULL AUTO_INCREMENT, --A Purchase Order ID is autmatically created everytime a purchase order is placed.
	ItemID int NOT NULL,
	SupplierID int NOT NULL,
	POrder_Date date,
	POrder_cost real NOT NULL,
	POrder_Quantity int NOt NULL,
	POrder_Total_Cost real NOT NULL,
	POrder_DOPayment date,
	POrder_Status varchar(100) NOT NULL,
	
	PRIMARY KEY (POrderID), --In the purchase order table i have set the primary key to POrderID.
	FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID), --This statement creates a foreign key and refences it to the primary key in the corresponding table. I have created a relationship between the Purchase order and the Supplier.
	FOREIGN KEY(ItemID) REFERENCES Items(ItemID) --This statement creates a foreign key and refences it to the primary key in the corresponding table. Here i have created a relationship between the Purchase Order table and the Items table.
);

--The INSERT INTO syntax allowed me to enter in the attributes of the table which i set to store data in. The Values syntax is the data which i have added, the way its typed out corresponds to the INSERT INTO statement. 
INSERT INTO Customer (FirstName, Surname, Customer_Email, PhoneNO, Home_AddressLine1, Home_AddressLine2, City, Home_Postcode, Billing_AddressLine1,
					  Billing_AddressLine2, Billing_City, Billing_Postcode)
VALUES('Tim', 'Christ', 'TimChrist@Gmail.com', '01534326546', '23', 'Stour Avenue', 'Lincoln', 'LN6F8B', '23', 'Stour', 'Lincoln', 'LN1F7B'),
	  ('Stuart', 'Mays', 'StuartMays@Gmail.com', '01534774546', '24', 'Kilby Way', 'Lincoln', 'LN4BNM', '24', 'Kilby Way', 'Lincoln', 'LN4BNM'),
      ('William', 'Hill', 'WilliamHill@Gmail.com', '01534860546', '13', 'Clarence Lane', 'Lincoln', 'LN2LKB', '13', 'Clarence Lane', 'Lincoln', 'LN2LKB'),
      ('Alice', 'Stevens', 'AliceStevens@Gmail.com', '01512756946', '63', 'Ravens Street', 'Lincoln', 'LN1F9J', '63', 'Ravens Street', 'Lincoln', 'LN1F9J'),
      ('Bethany', 'Lowther', 'BethanyLowther@Gmail.com', '01594776546', '123', 'Chelmsford Close', 'Lincoln', 'LN1L1B', '123', 'Chelmsford Close', 'Lincoln', 'LN1L1B'),
      ('Bill', 'Short', 'BillShort@Gmail.com', '01534759376', '45', 'Deben Way', 'Lincoln', 'LN5HBG', '45', 'Deben Way', 'Lincoln', 'LN5HBG'),
      ('Ethnal', 'Wise', 'EthanlWise@Gmail.com', '01534399546', '74', 'Tarrance Street', 'Lincoln', 'LN2K8J', '74', 'Tarrance Street', 'Lincoln', 'LN2K8J'),
      ('Ellie', 'Roberts', 'EllieRoberts@Gmail.com', '01560026546', '03', 'Lake Avenue', 'Lincoln', 'LN1KP1', '03', 'Lake Avenue', 'Lincoln', 'LN1KP1');
	
	
INSERT INTO Employee (Employee_FirstName, Employee_Surname, Employee_Job_Role, Employee_Gender, Employee_Email, PhoneNO, Employee_DOB, Employee_AddressLine1, Employee_AddressLine2, Employee_Postcode, City)
VALUES ('John', 'Colby', 'Manager', 'Male','JohnColby@LGC.com', '01534786546', '1976-03-09', '56', 'Drivers Close', 'LN1J7B', 'Lincoln'),
   	   ('Steven', 'Holmes','Gardener', 'Male', 'StevenHolmes@LGC.com', '01587658354', '1969-07-12', '23', 'Farm Lane', 'LN19GV', 'Lincoln'),	
       ('Bill', 'Cross', 'Cashier', 'Male','BillCross@LGC.com', '01587696571', '1987-12-09', '42', 'Digby Road', 'LN1J9J', 'Lincoln'),
       ('Wesley', 'Jacobs', 'Gardener', 'Male', 'WesleyJacobs@LGC.com', '01576599953', '1981-12-26', 'Flat 1A', 'Terrace Avenue', 'LN1A4S', 'Lincoln'),
       ('Sarah', 'Snell', 'Cashier', 'Female','SarahSnell@LGC.com', '01567523441', '1991-05-18', '17', 'Rose Close', 'LN1B8J', 'Lincoln');
		

INSERT INTO Supplier (Supplier_Name, Supplier_Email, Supplier_PhoneNO, Supplier_AddressLine1, Supplier_AddressLine2, Supplier_Postcode, Supplier_City)
VALUES('Plant Partners', 'PlantPartners@Gmail.com', '01599116546', '1', 'Industries Way', 'LN6J1B', 'Lincoln'),
   	  ('Flower Florists', 'FlowerFlorists@LGCCompanies.com', '01534733560', '16', 'Marble Street', 'LN3Q4C', 'Lincoln'),
	  ('Stem Industries', 'StemIndustries@LGCCompanies.com', '01538873590', '12', 'York Street', 'YO3P9C', 'York');
	   
	   
INSERT INTO Items(Plant_Name, Latin_Name, Plant_Catergory, Decsription, Season_of_Interest, How_to_Grow, Plant_Price, SupplierID)
VALUES ('Hibiscus', 'Hibiscus', 'Perennial', 'The flowers of this plant are either pink, red or white.', 'Fall bloom or Summer bloom', 'These plants take a while to grow. The plant is grown by panting seeds or by buying a ready grown Hibiscus plant and ensuring it gets aily sunlight and is watered daily.', '11.99', 0001),
	   ('Bell Flower', 'Camanula', 'Campanulacae','Bell flowers are star like flowers, that range short to tall, that come in multiple colours', 'Early Fall / Summer', 'Full sun / partial shade and needs to be well drained.', '4.99', 0002),
	   ('Buttercup', 'Ranunculus', 'Ranunculus', 'This is a cheerful plant which comes in colours such as yellow and white.', 'Spring', 'Needs full sun / partial shade and needs to be well shaded.', '1.99', 0002),
	   ('Areca Palm', 'Chrysalidocarpus lutescens', 'Palm Plant', 'This is a bushy palm plant that provides a tropical look to a room and has a height of 1.6m.', 'All year round', 'Needs  bright light and needs to be regulary watered. Avoid radiators.', '85.99', 0001),
	   ('Kentia Palm', 'Howea forsteriana', 'Palm plant / Office plant', 'This plant is a very tough plant that would be great for offices and reception areas.', 'All year round', 'Will tolerate low leves of light and needs watering daily.', '75.50', 0001),
	   ('Christmas Cactus', 'Schlumbergera', 'Cacti', 'This plant is very colourful which hs a mix of three colours and can bring a dash of colour to the darkest days.', 'Winter', 'The pllant needs regular sunlight and needs to be watered once to twice a week.', '9.99', 0002),
	   ('Potted Rose Palace', 'Rosa', 'Roses', 'Roses are the centre of romance and can light up a room.', 'Spring', 'Can be stood outdoors and placed indoors and easy to maintain', '2.99', 0003),
	   ('Orchid Smile Plant', 'Dendrobium', 'Orchids', 'This plant is from sout east Asia. This plant is pink and white and would be perfect for a living room!', 'January - June', 'Watered daily and regular sunlight', '19.65', 0002),
	   ('Potted Rose Parade', 'Freja', 'Roses', 'These roses are white and would be perfect for a living room!', 'Spring', 'Watered daily and regular sunlight', '7.99', 0002),
	   ('Potted Rose Parade', 'Neza', 'Roses', 'This plant is perfect for a home or conservatory, the roses are pink are provide a delgithful fragrance!', 'Spring', 'Watered daily and regular sunlight', '7.99', 0002),
	   ('TiSento Anthurium white', 'Anthurium andreanum', 'Plant', 'Also known as the flamingo flower, this plant is very stylish and looks good with any interior!', 'All year round', 'Watered daily and regular sunlight', '11.99', 0003);
	  
INSERT INTO CustomerOrder(CustomerID, ItemID, COrder_Date, COrder_Recieved_Date, COrder_DOPayment, Quantity, COrder_Total_Cost, COrder_Status)
VALUES (5, 3, '2018-01-03', '2018-01-08', '2018-01-03', '1', 1.99 * 1, 'Dispatched'), --Within the statements here and below i have used mathematical operators to calculate the total cost of the customers order by multiplying the price by the quantity.
	   (2, 4, '2018-01-03', '2018-01-08', '2018-01-03', '2', 85.99 * 2, 'Dispatched'),
	   (6, 5, '2017-11-16', '2018-01-08', '2017-11-16', '4', 75.50 * 2, 'Devlivered'),
	   (3, 8, '2017-10-13', '2017-10-16', '2017-10-13', '6', 19.65 * 6, 'Delivered'),
	   (1, 8, '2017-03-11', '2017-03-15', '2017-03-11', '2', 19.65 * 2, 'Delivered'),
	   (7, 10, '2017-03-26', '2018-03-30', '2017-03-26', '3', 7.99 * 3, 'Delivered');
	   
INSERT INTO PurchaseOrder(ItemId, SupplierID, POrder_Date, POrder_cost, POrder_Quantity, POrder_Total_Cost, POrder_DOPayment, POrder_Status)
VALUES(1, 1, '2017-10-23', '6.99', '40', 6.99 * 40, '2017-11-23', 'Paid'),	   
	  (2, 2, '2017-10-16', '2.99', '50', 2.99 * 50, '2017-11-26', 'Paid'),	   
	  (3, 2, '2017-10-19', '0.50', '100', 0.50 * 100, '2017-11-29', 'Paid'),	   
	  (4, 1, '2017-11-21', '35.00', '5', 35 * 5, '2017-12-21', 'Paid'),	   
	  (5, 1, '2017-11-23', '40.00', '3', 40 * 3, '2017-12-23', 'Paid'),	   
	  (6, 2, '2017-11-28', '4.00', '30', 4 * 30, '2017-12-23', 'Paid'),	   
	  (7, 3, '2017-12-29', '1.00', '20', 1 * 20, '2018-01-23', 'Payment Pending'),	   
	  (8, 2, '2017-12-30', '9.50', '20', 9.50* 20, '2018-01-23', 'Payment Pending'),	   
	  (9, 2, '2018-01-01', '2.99', '10', 2.99 * 10, '2018-02-23', 'Payment Pending'),	   
	  (10, 2, '2018-01-04', '3.20', '25', 3.20 * 25, '2018-02-23', 'Payment Pending'),	   
	  (11, 3, '2018-01-08', '3.50', '30', 3.50 * 30, '2018-02-23', 'Payment Pending');	   
	   

--ALTER Statements - These statements are used to add, delete and modify columns in an exisiting table.
--The ALTER table can also be used to drop items and constraints on tables.
ALTER TABLE `items` ADD FOREIGN KEY (`SupplierID`) REFERENCES `supplier`(`SupplierID`) ON DELETE RESTRICT ON UPDATE CASCADE; --This SQL statment ALters the item table and adds a supplierID a a foreign key.

ALTER TABLE customer --Here a coloumn named date of birth has been added to the customer table
ADD Date_of_Birth date;

ALTER TABLE CustomerOrder --Here the gender of the employee has been dropped from the employee table.
DROP COLUMN COrder_DOPayment;

--Update Statements - These statments UPDATE and modify existing records within a table.
UPDATE Items SET Plant_Name='Buttercup FlowerPlant' WHERE ItemID=3;
UPDATE Customer SET PhoneNO='01546897762' WHERE CustomerID=4;

--DELETE Statements
DELETE FROM Employee WHERE EmployeeID=0002;

--SELECT Statements
SELECT Plant_Name, Plant_Price FROM Items --For this select statement plant names are selected form the item table where the price of the plant is less than £10.
WHERE Plant_Price <= "10";

SELECT Employee_FirstName, Employee_Surname, Employee_Job_Role, Employee_Gender FROM Employee --For this select statement the employees first, second name, job role and gender are selected from the employee table where the job role is cashier and the gender is female. 
WHERE Employee_Job_Role='cashier' AND Employee_Gender='Female';

SELECT * FROM Supplier WHERE NOT Supplier_City='Lincoln'; --This select statement selects all of the suppliers which are not based in lincoln.

--INNER Join Sataements -  This statement selects records that have matching values in both tables.
SELECT CustomerOrder.COrderID, Customer.FirstName, Customer.Surname
FROM CustomerOrder
INNER JOIN Customer ON CustomerOrder.COrderID = Customer.CustomerID;

--LEFT Join Statements - This statement returns all the records from the left table and the matched records from the right table
SELECT Supplier.Supplier_Name, Items.Plant_Name
FROM Supplier
LEFT JOIN Items ON Supplier.SupplierID = Items.SupplierID
ORDER BY Supplier.Supplier_Name;

--Right Join Statements - The right join statement returns all records from the right table and the matched records from the left table. 
SELECT CustomerOrder.COrderID, Customer.FirstName, Customer.Surname, CustomerOrder.COrder_Date
FROM CustomerOrder
RIGHT JOIN Customer ON CustomerOrder.CustomerID = Customer.CustomerID
ORDER BY CustomerOrder.COrderID;

--UNION Statements - This statement is used to combine the result of two or more SELECT statements
SELECT city , PhoneNO FROM Customer
WHERE City='Lincoln'
UNION ALL
SELECT City, PhoneNo FROM Employee
WHERE City='Lincoln'
ORDER BY City;

--Below are the statements which create a copy of the tables. 
CREATE TABLE Copy_of_Customer LIKE Customer; --This statement creates a copy of the customer table and makes it the same format as the original customer table. 
INSERT Copy_of_Customer SELECT * FROM Customer; --This statement INSERTs a copy of all of the data records within the old customer table and puts them into the new one. 

CREATE TABLE Copy_of_Employee LIKE Employee; 
INSERT Copy_of_Employee SELECT * FROM Employee;

CREATE TABLE Copy_of_Supplier LIKE Supplier; 
INSERT Copy_of_Supplier SELECT * FROM Supplier;

CREATE TABLE Copy_of_Items LIKE Items; 
INSERT Copy_of_Items SELECT * FROM Items;

CREATE TABLE Copy_of_CustomerOrder LIKE CustomerOrder; 
INSERT Copy_of_CustomerOrder SELECT * FROM CustomerOrder;

CREATE TABLE Copy_of_PurchaseOrder LIKE PurchaseOrder; 
INSERT Copy_of_PurchaseOrder SELECT * FROM PurchaseOrder;

--The statements below create a read only user for the database. The user will not be able to DROP any tables or UPDATE any tables. This is only read only for the user. 
CREATE USER 'ReadOnly.Users'@'%' IDENTIFIED BY 'LincolnGardenCentreDATA';--CREATE USER creates a username and password which is used to access the database.
GRANT SELECT ON lincolngardencentre.* TO 'ReadOnly.Users'@'%'; --This grants access for the user to access the database but to only read it. 



