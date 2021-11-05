-- koppla från databasen
USE master
GO
-- stäng ner andra anslutningar till databasen
ALTER	DATABASE [Food_Rescue]
SET 	SINGLE_USER
WITH	ROLLBACK IMMEDIATE
GO
-- försök slänga databasen
DROP DATABASE [Food_Rescue]
GO
-- skapa databasen på nytt
CREATE DATABASE [Food_Rescue]
GO
-- anslut till den
USE [Food_Rescue]
GO

-- skapat upp tabellerna till projektet. 

CREATE TABLE [Customer] (

	ID						INT					IDENTITY(1,1), 
	Full_Name				nvarchar(25)		not null,
	User_password			nvarchar(18)		not null CHECK(len(User_password) > 7),
	PassReg					Date				not null, 
	Email					nvarchar(50),
	PRIMARY KEY				(ID)	
)

CREATE TABLE [Restaurant] (

	Restaurant_ID			INT					IDENTITY(1000,1), 
	Restaurant_Name			nvarchar(18)		not null, 
	City					nvarchar(18)		not null,
	Phonenumber				nvarchar(18)		not null,
	PRIMARY KEY				(Restaurant_ID),
	Unique					(Restaurant_Name, Phonenumber)--För att undvika att det går att skapa samma resturang mer än en gång. 
)

CREATE TABLE [Order] (

	Order_ID				INT					IDENTITY(3000,1), 
	Delivery_Date			Date,
	Customer_ID				INT					FOREIGN KEY REFERENCES [Customer](ID)
	PRIMARY KEY				(Order_ID)
)

CREATE TABLE [Food_Package] (

	Box_ID					INT					IDENTITY(2000,1), 
	Box_Name				nvarchar(50)		not null,
	Food_Category			nvarchar(25)		not null,
	Price					smallmoney			not null,
	Best_Before				Date				not null,
	Restaurant_ID			INT					FOREIGN KEY REFERENCES [Restaurant](Restaurant_ID),
	Order_ID				INT					FOREIGN KEY REFERENCES [Order](Order_ID),
	PRIMARY KEY				(Box_ID)		
)

CREATE TABLE [Food_Content] (
	
	Content					nvarchar(255)		not null,
	Content_ID				INT					not null FOREIGN KEY REFERENCES [Food_Package](Box_ID)
)

--ID (Automatiskt),				Full_Name,				User_password,	PassReg,		Email,			
INSERT INTO [Customer] VALUES ('Joakim Engström',		'Password1',	GETDATE(),		'test1@test.com')
INSERT INTO [Customer] VALUES ('Pia',					'Password2',	GETDATE(),		'test2@test.com')
INSERT INTO [Customer] VALUES ('Jonas Alexandersson',	'Password3',	GETDATE(),		'test3@test.com')
INSERT INTO [Customer] VALUES ('Sandra Domingo',		'Password4',	GETDATE(),		'test4@test.com')
INSERT INTO [Customer] VALUES ('Rickard Hartman',		'Password5',	GETDATE(),		'test5@test.com')
INSERT INTO [Customer] VALUES ('Ninnie Djurberg',		'Password6',	GETDATE(),		'test6@test.com')
INSERT INTO [Customer] VALUES ('Björn',					'Password7',	GETDATE(),		'test7@test.com')
INSERT INTO [Customer] VALUES ('Theo',					'Password8',	GETDATE(),		'test8@test.com')
INSERT INTO [Customer] VALUES ('Kim',					'Password9',	GETDATE(),		'test9@test.com')
INSERT INTO [Customer] VALUES ('Märta',					'Password10',	GETDATE(),		'test10@test.com')
INSERT INTO [Customer] VALUES ('Random User1',			'Password11',	'2017-05-23',	'test12@test.com')
INSERT INTO [Customer] VALUES ('Random User2',			'Password12',	'2019-05-23',	'test12@test.com')

--Resturant_ID (Automatiskt),	Restaurant_Name,	City,		Phonenumber
INSERT INTO [Restaurant] VALUES ('Bohus Pizza',		'Bohus',	'6464642558')
INSERT INTO [Restaurant] VALUES ('Bohus Sushi',		'Bohus',	'1250704319')
INSERT INTO [Restaurant] VALUES ('Olivias_Food',	'Kungälv',	'2175682992')
INSERT INTO [Restaurant] VALUES ('Kinan',			'Göteborg', '7383540844')
INSERT INTO [Restaurant] VALUES ('Thaien',			'Ale',		'6775122397')
INSERT INTO [Restaurant] VALUES ('Da-Mille',		'Älvängen', '4859656410')
INSERT INTO [Restaurant] VALUES ('Old Corner',		'Göteborg', '1151014966')
INSERT INTO [Restaurant] VALUES ('Haket',			'Göteborg', '4772547633')
INSERT INTO [Restaurant] VALUES ('Mantram',			'Kungälv',	'2759989969')
INSERT INTO [Restaurant] VALUES ('Vi-Vet',			'Göteborg', '7318231329')

--Order_ID (Automatiskt),	Delivery_Date, 	Customer_ID
INSERT INTO [Order] VALUES ('2020-11-06',	1)
INSERT INTO [Order] VALUES ('2020-11-06',	2)
INSERT INTO [Order] VALUES ('2020-11-05',	3)
INSERT INTO [Order] VALUES ('2020-11-04',	4)
INSERT INTO [Order] VALUES ('2020-11-07',	3)
INSERT INTO [Order] VALUES ('2020-11-04',	2)
INSERT INTO [Order] VALUES ('2020-11-03',	5)
INSERT INTO [Order] VALUES ('2020-11-02',	6)
INSERT INTO [Order] VALUES ('2020-11-06',	7)
INSERT INTO [Order] VALUES ('2020-11-07',	5)
INSERT INTO [Order] VALUES ('2020-11-06',	8)
INSERT INTO [Order] VALUES ('2020-11-06',	9)
INSERT INTO [Order] VALUES ('2020-11-06',	10)
INSERT INTO [Order] VALUES ('2020-11-05',	2)
INSERT INTO [Order] VALUES ('2020-11-06',	3)
INSERT INTO [Order] VALUES ('2020-11-07',	5)

--Box_ID (Automatiskt)				Box_Name,			Food_Category,	Price,		Best_Before,					Restaurant_ID,	Order ID	
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		50,		DATEADD(DAY, 4, GETDATE()),		1000,			3001)--Bohus Pizza
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		55,		DATEADD(DAY, 3, GETDATE()),		1000,			null)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Meat',			65,		DATEADD(DAY, 3, GETDATE()),		1000,			3009)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Meat',			69,		DATEADD(DAY, 2, GETDATE()),		1000,			null)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		70,		DATEADD(DAY, 1, GETDATE()),		1000,			3003)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		69,		DATEADD(DAY, 2, GETDATE()),		1000,			null)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		69,		DATEADD(DAY, 5, GETDATE()),		1000,			3005)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Chicken',		69,		DATEADD(DAY, -3, GETDATE()),	1000,			null)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Chicken',		80,		DATEADD(DAY, 2, GETDATE()),		1000,			null)
INSERT INTO [Food_Package] VALUES	('Pasta',				'Vegetarian',	67,		DATEADD(DAY, 1, GETDATE()),		1000,			3002)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Fish',			89,		DATEADD(DAY, 3, GETDATE()),		1001,			null)--Bohus Sushi
INSERT INTO [Food_Package] VALUES	('Sushi',				'Fish',			89,		DATEADD(DAY, 2, GETDATE()),		1001,			null)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Fish',			89,		DATEADD(DAY, 4, GETDATE()),		1001,			3009)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Fish',			95,		DATEADD(DAY, 3, GETDATE()),		1001,			3004)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Fish',			95,		DATEADD(DAY, 4, GETDATE()),		1001,			null)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Vegan',		60,		DATEADD(DAY, 4, GETDATE()),		1001,			3003)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Vegan',		60,		DATEADD(DAY, 3, GETDATE()),		1001,			null)
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Meat',			89,		DATEADD(DAY, 3, GETDATE()),		1002,			3006)--Krogen
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Meat',			89,		DATEADD(DAY, 4, GETDATE()),		1002,			null)
INSERT INTO [Food_Package] VALUES	('Stew',				'Meat',			89,		DATEADD(DAY, 2, GETDATE()),		1002,			null)
INSERT INTO [Food_Package] VALUES	('Stew',				'Fish',			89,		DATEADD(DAY, 2, GETDATE()),		1003,			null)--Kinan
INSERT INTO [Food_Package] VALUES	('Stew',				'Meat',			90,		DATEADD(DAY, 2, GETDATE()),		1003,			3004)
INSERT INTO [Food_Package] VALUES	('Stew',				'Vegetarian',	90,		DATEADD(DAY, 4, GETDATE()),		1003,			null)
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Meat',			89,		DATEADD(DAY, 4, GETDATE()),		1004,			null)--Thaien
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Meat',			89,		DATEADD(DAY, 1, GETDATE()),		1004,			3007)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Chicken',		89,		DATEADD(DAY, 1, GETDATE()),		1005,			null)--Da-Mille
INSERT INTO [Food_Package] VALUES	('Pizza',				'Chicken',		90,		DATEADD(DAY, 4, GETDATE()),		1005,			null)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegetarian',	90,		DATEADD(DAY, 4, GETDATE()),		1006,			null)--Old Corner
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		69,		DATEADD(DAY, 3, GETDATE()),		1006,			3005)
INSERT INTO [Food_Package] VALUES	('Pizza',				'Vegan',		69,		DATEADD(DAY, 4, GETDATE()),		1006,			null)
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Vegetarian',	90,		DATEADD(DAY, 4, GETDATE()),		1007,			3001)--Haket
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Meat',			90,		DATEADD(DAY, 5, GETDATE()),		1007,			null)
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Vegan',		90,		DATEADD(DAY, 4, GETDATE()),		1007,			null)
INSERT INTO [Food_Package] VALUES	('Meatballs',			'Vegan',		90,		DATEADD(DAY, 4, GETDATE()),		1007,			3006)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Vegan',		90,		DATEADD(DAY, 1, GETDATE()),		1007,			null)
INSERT INTO [Food_Package] VALUES	('Sushi',				'Vegan',		90,		DATEADD(DAY, 4, GETDATE()),		1007,			3007)
INSERT INTO [Food_Package] VALUES	('Stew',				'Chicken',		95,		DATEADD(DAY, 2, GETDATE()),		1008,			null)--Mantram
INSERT INTO [Food_Package] VALUES	('Stew',				'Meat',			95,		DATEADD(DAY, 2, GETDATE()),		1008,			null)
INSERT INTO [Food_Package] VALUES	('Stew',				'Fish',			95,		DATEADD(DAY, 4, GETDATE()),		1008,			3008)
INSERT INTO [Food_Package] VALUES	('Stew',				'Chicken',		95,		DATEADD(DAY, 1, GETDATE()),		1009,			null)--Vi-Vet
INSERT INTO [Food_Package] VALUES	('Stew',				'Chicken',		95,		DATEADD(DAY, -2, GETDATE()),	1009,			null)
INSERT INTO [Food_Package] VALUES	('Stew',				'Chicken',		95,		DATEADD(DAY, 2, GETDATE()),		1009,			3010)
INSERT INTO [Food_Package] VALUES	('Stew',				'Chicken',		95,		DATEADD(DAY, 3, GETDATE()),		1009,			null)
INSERT INTO [Food_Package] VALUES	('Stew',				'Fish',			95,		DATEADD(DAY, 2, GETDATE()),		1009,			3002)
INSERT INTO [Food_Package] VALUES	('Stew',				'Fish',			95,		DATEADD(DAY, 3, GETDATE()),		1009,			null)

--									Content,						Content ID
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Vegan...........', 2015)
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Vegetarian......',	2009)									
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Meatballs.......',	2017)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: MeatPizza.......',	2018)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: FishSoup........',	2045)	
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: ChickenStew.....',	2043)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: VeganPizza......',	2000)	
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: RawFish.........',	2014)	










