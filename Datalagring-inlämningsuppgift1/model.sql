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
	PRIMARY KEY				(Restaurant_ID)
)

CREATE TABLE [Food_Package] (

	Box_ID					INT					IDENTITY(2000,1), 
	Box_Name				nvarchar(50)		not null,
	Food_Category			nvarchar(25)		not null,
	Price					smallmoney			not null,
	Best_Before				Date				not null,
	Restaurant_ID			INT					FOREIGN KEY REFERENCES [Restaurant](Restaurant_ID),
	PRIMARY KEY				(Box_ID)		
)

CREATE TABLE [Food_Content] (
	
	Content					nvarchar(255)		not null,
	Content_ID				INT					not null FOREIGN KEY REFERENCES [Food_Package](Box_ID)
)

CREATE TABLE [Order] (

	Order_ID				INT					IDENTITY(3000,1), 
	Delivery_Date			Date,
	Box_ID					INT					FOREIGN KEY REFERENCES [Food_Package](Box_ID),
	Customer_ID				INT					FOREIGN KEY REFERENCES [Customer](ID)
	PRIMARY KEY				(Order_ID)
)

--ID (Automatiskt),				Full_Name,				User_password,		PassReg,	Email,			
INSERT INTO [Customer] VALUES ('Joakim Engström',		'Password1',	GETDATE(), 'test1@test.com')
INSERT INTO [Customer] VALUES ('Pia',					'Password2',	GETDATE(), 'test2@test.com')
INSERT INTO [Customer] VALUES ('Jonas Alexandersson',	'Password3',	GETDATE(), 'test3@test.com')
INSERT INTO [Customer] VALUES ('Sandra Domingo',		'Password4',	GETDATE(), 'test4@test.com')
INSERT INTO [Customer] VALUES ('Rickard Hartman',		'Password5',	GETDATE(), 'test5@test.com')
INSERT INTO [Customer] VALUES ('Ninnie Djurberg',		'Password6',	GETDATE(), 'test6@test.com')
INSERT INTO [Customer] VALUES ('Björn',					'Password7',	GETDATE(), 'test7@test.com')
INSERT INTO [Customer] VALUES ('Theo',					'Password8',	GETDATE(), 'test8@test.com')
INSERT INTO [Customer] VALUES ('Kim',					'Password9',	GETDATE(), 'test9@test.com')
INSERT INTO [Customer] VALUES ('Märta',					'Password10',	GETDATE(), 'test10@test.com')
INSERT INTO [Customer] VALUES ('Delete this',			'Password11',	GETDATE(), 'test12@test.com')
INSERT INTO [Customer] VALUES ('Order food',			'Password12',	GETDATE(), 'test12@test.com')

--Resturant_ID (Automatiskt),	Restaurant_Name,	City,		Phonenumber
INSERT INTO [Restaurant] VALUES ('Bohus Pizza',		'Bohus',	'6464642558')
INSERT INTO [Restaurant] VALUES ('Bohus Sushi',		'Bohus',	'1250704319')
INSERT INTO [Restaurant] VALUES ('Krogen',			'Kungälv',	'2175682992')
INSERT INTO [Restaurant] VALUES ('Kinan',			'Göteborg', '7383540844')
INSERT INTO [Restaurant] VALUES ('Thaien',			'Ale',		'6775122397')
INSERT INTO [Restaurant] VALUES ('Da-Mille',		'Älvängen', '4859656410')
INSERT INTO [Restaurant] VALUES ('Old Corner',		'Göteborg', '1151014966')
INSERT INTO [Restaurant] VALUES ('Haket',			'Göteborg', '4772547633')
INSERT INTO [Restaurant] VALUES ('Mantram',			'Kungälv',	'2759989969')
INSERT INTO [Restaurant] VALUES ('Vi-Vet',			'Göteborg', '7318231329')

--Box_ID						Box_Name,			Food_Category,	Price,		Best_Before, Restaurant_ID, Sold	
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		50,		'2020-11-07',		1000)--Bohus Pizza
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		55,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Meat',			65,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Meat',			69,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		70,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		69,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		69,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Chicken',		69,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Chicken',		80,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Pasta',				'Vegetarian',	67,		'2020-11-07',		1000)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Fish',			89,		'2020-11-07',		1001)--Bohus Sushi
INSERT INTO [Food_Package] VALUES ('Sushi',				'Fish',			89,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Fish',			89,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Fish',			95,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Fish',			95,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Vegan',		60,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Vegan',		60,		'2020-11-07',		1001)
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Meat',			89,		'2020-11-07',		1002)--Krogen
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Meat',			89,		'2020-11-07',		1002)
INSERT INTO [Food_Package] VALUES ('Stew',				'Meat',			89,		'2020-11-07',		1002)
INSERT INTO [Food_Package] VALUES ('Stew',				'Fish',			89,		'2020-11-07',		1003)--Kinan
INSERT INTO [Food_Package] VALUES ('Stew',				'Meat',			90,		'2020-11-07',		1003)
INSERT INTO [Food_Package] VALUES ('Stew',				'Vegetarian',	90,		'2020-11-07',		1003)
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Meat',			89,		'2020-11-07',		1004)--Thaien
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Meat',			89,		'2020-11-07',		1004)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Chicken',		89,		'2020-11-07',		1005)--Da-Mille
INSERT INTO [Food_Package] VALUES ('Pizza',				'Chicken',		90,		'2020-11-07',		1005)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegetarian',	90,		'2020-11-07',		1006)--Old Corner
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		69,		'2020-11-07',		1006)
INSERT INTO [Food_Package] VALUES ('Pizza',				'Vegan',		69,		'2020-11-07',		1006)
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Vegetarian',	90,		'2020-11-07',		1007)--Haket
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Meat',			90,		'2020-11-07',		1007)
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Vegan',		90,		'2020-11-07',		1007)
INSERT INTO [Food_Package] VALUES ('Meatballs',			'Vegan',		90,		'2020-11-07',		1007)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Vegan',		90,		'2020-11-07',		1007)
INSERT INTO [Food_Package] VALUES ('Sushi',				'Vegan',		90,		'2020-11-07',		1007)
INSERT INTO [Food_Package] VALUES ('Stew',				'Chicken',		95,		'2020-11-07',		1008)--Mantram
INSERT INTO [Food_Package] VALUES ('Stew',				'Meat',			95,		'2020-11-07',		1008)
INSERT INTO [Food_Package] VALUES ('Stew',				'Fish',			95,		'2020-11-07',		1008)
INSERT INTO [Food_Package] VALUES ('Stew',				'Chicken',		95,		'2020-11-07',		1009)--Vi-Vet
INSERT INTO [Food_Package] VALUES ('Stew',				'Chicken',		95,		'2020-11-07',		1009)
INSERT INTO [Food_Package] VALUES ('Stew',				'Chicken',		95,		'2020-11-07',		1009)
INSERT INTO [Food_Package] VALUES ('Stew',				'Chicken',		95,		'2020-11-07',		1009)
INSERT INTO [Food_Package] VALUES ('Stew',				'Fish',			95,		'2020-11-07',		1009)
INSERT INTO [Food_Package] VALUES ('Stew',				'Fish',			95,		'2020-11-07',		1009)

--									Content,						Content ID
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Vegan...........', 2000)
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Vegetarian......',	2009)									
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: Meatballs.......',	2017)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: MeatPizza.......',	2000)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: FishSoup........',	2000)	
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: ChickenStew.....',	2000)		
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: VeganPizza......',	2000)	
INSERT INTO [Food_Content] VALUES ('INGREDIENTS: RawFish.........',	2000)	

--Order_ID (Automatiskt),	Delivery_Date, Box_ID 2000-2044, Customer_ID
INSERT INTO [Order] VALUES ('2020-11-06',	2000,	1)
INSERT INTO [Order] VALUES ('2020-11-06',	2003,	2)
INSERT INTO [Order] VALUES ('2020-11-05',	2005,	3)
INSERT INTO [Order] VALUES ('2020-11-04',	2010,	4)
INSERT INTO [Order] VALUES ('2020-11-07',	2001,	3)
INSERT INTO [Order] VALUES ('2020-11-04',	2002,	2)
INSERT INTO [Order] VALUES ('2020-11-03',	2030,	5)
INSERT INTO [Order] VALUES ('2020-11-02',	2024,	6)
INSERT INTO [Order] VALUES ('2020-11-06',	2035,	7)
INSERT INTO [Order] VALUES ('2020-11-07',	2043,	5)
INSERT INTO [Order] VALUES ('2020-11-06',	2017,	8)
INSERT INTO [Order] VALUES ('2020-11-06',	2004,	9)
INSERT INTO [Order] VALUES ('2020-11-06',	2019,	10)
INSERT INTO [Order] VALUES ('2020-11-05',	2031,	2)
INSERT INTO [Order] VALUES ('2020-11-06',	2041,	3)
INSERT INTO [Order] VALUES ('2020-11-07',	2022,	5)








