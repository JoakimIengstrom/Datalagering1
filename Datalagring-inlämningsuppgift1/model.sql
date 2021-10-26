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
CREATE TABLE [Users] (

	ID						INT					IDENTITY(1,1), 
	Full_Name				nvarchar(25)		not null,
	[Password]				nvarchar(18)		not null CHECK(len([Password]) > 7),
	PassReg					Date				not null, 
	Email					nvarchar(50)
	PRIMARY KEY				(ID)
)

CREATE TABLE [Restaurant] (

	Restaurant_ID			INT					IDENTITY(1000,1), 
	Restaurant_Name			nvarchar(18)		not null,
	City					nvarchar(18)		not null,
	Phonenumber				nvarchar(18)		not null,
	PRIMARY KEY				(Restaurant_ID)
)

CREATE TABLE [Order] (

	Order_ID				INT					IDENTITY(5000,1), 
	[User_ID]				INT					not null FOREIGN KEY REFERENCES [Users](ID),
	Sales_Date				Date,
	PRIMARY KEY				(Order_ID)
)

CREATE TABLE [Food_Package] (

	Product_ID				INT					IDENTITY(2000,1), 
	Food_Box				nvarchar(25)		not null,
	Food_Category			nvarchar(25)		not null,
	Price					smallmoney			not null,
	[Order_ID] 				INT					null FOREIGN KEY REFERENCES [Order](Order_ID), --Denna byter till kundens ID när den köps? FK
	Restaurant_ID			INT					not null FOREIGN KEY REFERENCES [Restaurant](Restaurant_ID), 
	PRIMARY KEY				(Product_ID)
		
)

CREATE TABLE [Food_Content] (

	Product_ID				INT					IDENTITY(3000,1), 
	Content					nvarchar(150)		not null,
	Meat					nvarchar(3),		
	Fish					nvarchar(3),
	Chicken					nvarchar(3), 
	Vegan					nvarchar(3),
	Vegetarian				nvarchar(3),
	PRIMARY KEY				(Product_ID)
)

--ID (Automatiskt), Full_Name, [Password], PassReg, Email
INSERT INTO [Users] VALUES ('Joakim Engström', 'Password1', GETDATE(), 'test1@test.com')
INSERT INTO [Users] VALUES ('Pia', 'Password2', GETDATE(), 'test2@test.com')
INSERT INTO [Users] VALUES ('Jonas Alexandersson', 'Password3', GETDATE(), 'test3@test.com')
INSERT INTO [Users] VALUES ('Sandra Domingo', 'Password4', GETDATE(), 'test4@test.com')
INSERT INTO [Users] VALUES ('Rickard Hartman', 'Password5', GETDATE(), 'test5@test.com')
INSERT INTO [Users] VALUES ('Nunnie Djurberg', 'Password6', GETDATE(), 'test6@test.com')

--Resturant_ID (Automatiskt), Restaurant_Name, City, Phonenumber
INSERT INTO [Restaurant] VALUES ('Bohus_Pizza', 'Bohus', '0771223322')
INSERT INTO [Restaurant] VALUES ('Mojjen', 'Bohus', '0771448822')
INSERT INTO [Restaurant] VALUES ('Krogen', 'Kungälv', '0303482346')
INSERT INTO [Restaurant] VALUES ('Kinan', 'Göteborg', '0312486248')
INSERT INTO [Restaurant] VALUES ('Thaien', 'Ale', '0302483687')
INSERT INTO [Restaurant] VALUES ('Da-Mille', 'Älvängen', '0302468468')

--Product_ID (Automatiskt), Content, Meat, Fish, Chicken, Vegan, Vegetarian
INSERT INTO [Food_Content] VALUES ('Vegan Food', Null, Null, Null, 'Yes', 'Yes')
INSERT INTO [Food_Content] VALUES ('Meat without Diary', 'Yes', Null, Null, Null, Null)
INSERT INTO [Food_Content] VALUES ('Fish Stew', Null, 'Yes', Null, Null, Null)
INSERT INTO [Food_Content] VALUES ('Vegetarian', Null, Null, Null, Null, 'Yes')
INSERT INTO [Food_Content] VALUES ('Chicken Faita', Null, Null, 'Yes', Null, Null)

--Order_ID (Automatiskt), [User_ID], Sales_Date
INSERT INTO [Order] VALUES (1, GETDATE())
INSERT INTO [Order] VALUES (2, GETDATE())
INSERT INTO [Order] VALUES (3, GETDATE())

--Product_ID Food_Box, Food_Category, Price, [Order_ID], Restaurant_ID
INSERT INTO [Food_Package] VALUES ('Pizza_Margarita(Vegan)', 'Vegan', 100, null, 1002)
INSERT INTO [Food_Package] VALUES ('Pizza_LaPesto', 'Vegetarian', 90, 5000, 1003)
INSERT INTO [Food_Package] VALUES ('Burgare', 'Kött', 89, 5001, 1001)
INSERT INTO [Food_Package] VALUES ('Fish and Shops', 'Fisk', 95, null, 1002)
INSERT INTO [Food_Package] VALUES ('Fish and Shops', 'Fisk', 103, null, 1004)
INSERT INTO [Food_Package] VALUES ('Fish and Shops', 'Fisk', 110, null, 1003)
INSERT INTO [Food_Package] VALUES ('Fish and Shops', 'Fisk', 99, null, 1001)


