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
	Full_Name				nvarchar(18)		not null,
	[Password]				nvarchar(18)		not null check(len([Password]) > 7),
	PassReg					Date				not null, 
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
	Food_Category			nvarchar(25)		not null,
	Price					smallmoney			not null,
	[User_ID]				INT					not null, 
	Resturant_ID			INT					not null, 
	PRIMARY KEY				(Product_ID)
)

CREATE TABLE [Food_Content] (

	Product_ID				INT					identity, 
	Content					nvarchar(150)		not null,
	Meat					nvarchar(3),		
	Fish					nvarchar(3),
	Chicken					nvarchar(3), 
	Vegan					nvarchar(3),
	Vegetarian				nvarchar(3),
	PRIMARY KEY				(Product_ID)
)

CREATE TABLE [Sales] (

	Order_ID				INT					identity, 
	[User_ID]				INT					not null,
	Product_ID				INT					not null,
	Quantity				INT					not null,
	SUM_Price				smallmoney,
	Resturant_ID			INT, 
	Sales_Date				Date,
	PRIMARY KEY				(Order_ID)
)

--SET IDENTITY_INSERT [Users] ON
INSERT INTO [Users] VALUES ('Joakim Engström', 'Password1', GETDATE(), 'test1@test.com')
INSERT INTO [Users] VALUES ('Joakim2', 'Password2', GETDATE(), 'test2@test.com')
--SET IDENTITY_INSERT [Users] OFF

SET IDENTITY_INSERT [Restaurant] ON
INSERT INTO [Restaurant] (Resturant_ID, Resturant_Name, City, Phonenumber) VALUES (4, 'Pizzerian', 'Bohus', '0771223322')
INSERT INTO [Restaurant] (Resturant_ID, Resturant_Name, City, Phonenumber) VALUES (9, 'Mojjen', 'Bohus', '0771448822')
SET IDENTITY_INSERT [Restaurant] OFF

SET IDENTITY_INSERT [Food_Package] ON
INSERT INTO [Food_Package] (Product_ID, Food_Box, Food_Category, Price, [User_ID], Resturant_ID) VALUES (5, 'Pizza_Margarita', 'Non_Vegan', 100, 1, 7)
INSERT INTO [Food_Package] (Product_ID, Food_Box, Food_Category, Price, [User_ID], Resturant_ID) VALUES (12, 'Pizza_LaPesto', 'Vegetarian', 100, 1, 6)
SET IDENTITY_INSERT [Food_Package] OFF

SET IDENTITY_INSERT [Food_Content] ON
INSERT INTO [Food_Content] (Product_ID, Content, Meat, Fish, Chicken, Vegan, Vegetarian) VALUES (20, 'Food Text of Content', Null, Null, Null, 'Yes', 'Yes')
SET IDENTITY_INSERT [Food_Content] OFF

SET IDENTITY_INSERT [Sales] ON
INSERT INTO [Sales] (Order_ID, [User_ID], Product_ID, Quantity, SUM_Price, Resturant_ID, Sales_Date) VALUES (1000, 1, 5, 1, 100, 7, GETDATE())
SET IDENTITY_INSERT [Sales] OFF

