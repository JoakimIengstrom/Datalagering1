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
	Full_Name				nvarchar(25)		not null,
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

-- Insert data into [Users]
INSERT INTO [Users] VALUES ('Joakim Engström', 'Password1', GETDATE(), 'test1@test.com')
INSERT INTO [Users] VALUES ('Jonas Engström', 'Password2', GETDATE(), 'test2@test.com')
INSERT INTO [Users] VALUES ('Jonas Alexandersson', 'Password3', GETDATE(), 'test3@test.com')
INSERT INTO [Users] VALUES ('Sandra Domingo', 'Password4', GETDATE(), 'test4@test.com')
INSERT INTO [Users] VALUES ('Rickard Hartman', 'Password5', GETDATE(), 'test5@test.com')
INSERT INTO [Users] VALUES ('Nunnie Djurberg', 'Password6', GETDATE(), 'test6@test.com')

INSERT INTO [Restaurant] VALUES ('Pizzerian', 'Bohus', '0771223322')
INSERT INTO [Restaurant] VALUES ('Mojjen', 'Bohus', '0771448822')

INSERT INTO [Food_Package] VALUES ('Pizza_Margarita', 'Non_Vegan', 100, 1, 7)
INSERT INTO [Food_Package] VALUES ('Pizza_LaPesto', 'Vegetarian', 100, 1, 6)

--Product_ID (Automatiskt), Content, Meat, Fish, Chicken, Vegan, Vegetarian
INSERT INTO [Food_Content] VALUES ('Vegan Food', Null, Null, Null, 'Yes', 'Yes')
INSERT INTO [Food_Content] VALUES ('Meat without Diary', 'Yes', Null, Null, Null, Null)
INSERT INTO [Food_Content] VALUES ('Fish Stew', Null, 'Yes', Null, Null, Null)
INSERT INTO [Food_Content] VALUES ('Vegetarian', Null, Null, Null, Null, 'Yes')
INSERT INTO [Food_Content] VALUES ('Chicken Faita', Null, Null, 'Yes', Null, Null)

SET IDENTITY_INSERT [Sales] ON
INSERT INTO [Sales] (Order_ID, [User_ID], Product_ID, Quantity, SUM_Price, Resturant_ID, Sales_Date) VALUES (1000, 1, 5, 1, 100, 7, GETDATE())
SET IDENTITY_INSERT [Sales] OFF

