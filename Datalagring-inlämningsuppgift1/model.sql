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

	ID						INT					identity, 
	Username				nvarchar(18)		not null,
	[Password]				nvarchar(18)		not null check(len([Password]) > 7),
	PassWordRegistration	Date				not null, 
	Email					nvarchar(50)
	PRIMARY KEY				(ID)
)

CREATE TABLE [Restaurant] (

	Resturant_ID			INT					identity, 
	Resturant_Name			nvarchar(18)		not null,
	City					nvarchar(18)		not null,
	Phonenumber				nvarchar(18)		not null,
	PRIMARY KEY				(Resturant_ID)
)

CREATE TABLE [Food_Package] (

	Product_ID				INT					identity, 
	Food_Box				nvarchar(25)		not null,
	Type_of_Food			nvarchar(25)		not null,
	Price					smallmoney,
	[User_ID]				INT, 
	Resturant_ID			INT, 
	PRIMARY KEY				(Product_ID)
)

SET IDENTITY_INSERT [Users] ON
INSERT INTO [Users] (ID, Username, [Password], PassWordRegistration, Email) VALUES (1, 'Joakim1', 'Password1', GETDATE(), 'test1@test.com')
INSERT INTO [Users] (ID, Username, [Password], PassWordRegistration, Email) VALUES (2, 'Joakim2', 'Password2', GETDATE(), 'test2@test.com')
SET IDENTITY_INSERT [Users] OFF

SET IDENTITY_INSERT [Restaurant] ON
INSERT INTO [Restaurant] (Resturant_ID, Resturant_Name, City, Phonenumber) VALUES (4, 'Pizzerian', 'Bohus', '0771223322')
INSERT INTO [Restaurant] (Resturant_ID, Resturant_Name, City, Phonenumber) VALUES (9, 'Mojjen', 'Bohus', '0771448822')
SET IDENTITY_INSERT [Restaurant] OFF

SET IDENTITY_INSERT [Food_Package] ON
INSERT INTO [Food_Package] (Product_ID, Food_Box, Type_of_Food, Price, [User_ID], Resturant_ID) VALUES (5, 'Pizza_Margarita', 'Non_Vegan', 100, 1, 7)
INSERT INTO [Food_Package] (Product_ID, Food_Box, Type_of_Food, Price, [User_ID], Resturant_ID) VALUES (12, 'Pizza_LaPesto', 'Vegetarian', 100, 1, 6)
SET IDENTITY_INSERT [Food_Package] OFF

/*
CREATE TABLE [Resturant_Staff] (

	ID						INT					identity, 
	Employee_Name			nvarchar(25)		not null,
	Employee_Phone			nvarchar(25)		not null,
	Resturant_ID			INT, 
	
)
*/


