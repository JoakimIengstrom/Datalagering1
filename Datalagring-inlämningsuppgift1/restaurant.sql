-- anslut till den
USE [Food_Rescue]
GO

SELECT * FROM [Food_Package] 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query R1: Kolla alla sålda matlådor för en restaurang.

/*
	Här kollar jag vilka lådor Bohus Pizza har sålt genom att kolla vilka boxar som Bohus Pizza har lagt ut och har ett Order_ID som inte är null. 
	Parametrar:
		[Food_Package]: Box_Name, Food_Category, Price
		[Restaurant]: Restaurant_Name, Phonenumber
*/

SELECT DISTINCT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant, Phonenumber
	FROM [Food_Package]
		Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
			WHERE Restaurant_Name = 'Bohus Pizza' AND Order_ID IS NOT NULL

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query R2: Lägga till nya matlådor, kopplade till den aktuella restaurangen

/*
	Gör en kontroll och ser vilka resturanger som finns och vilket ID de har. 
	Sedan gör jag en vanlig INSERT INTO [Food_Package]. Är noga med att fylla i all information som behövs och välja en resturang. 
*/

SELECT Restaurant_Name, Restaurant_ID FROM [Restaurant] --Kollar vilka restaurant som finns. 

-- Lägger till_ Sort, kategori, pris, datum, Restaurant ID och sätter den till Null då den inte är såld. 
INSERT INTO [Food_Package] VALUES ('Pasta',	'Vegetarian', 55, DATEADD(DAY, 4, GETDATE()),	1006, null)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Extra Querys

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query R3: Denna kollar vad en specefik resturang har sålt. 

/*
	Denna är till för att en resturang skall kunna kolla sin historik. Totalt värde, snitt order och totalt antal ordrar. 
*/

SELECT DISTINCT SUM(Price) AS '"Olivias Food" Total Sales', AVG(Price) AS 'Avgerage Order', Count(Price) AS 'Number of Sales'
	FROM [Food_Package]
		Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
		Join [Order] ON [Order].Order_ID = [Food_Package].Order_ID
			WHERE Restaurant_Name = 'Olivias_Food'

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query R4: Denna visar allt som hittils är sålt.  

/*
	Här kan vi se Vad Food Rescure har sålt hittils. 
*/

SELECT DISTINCT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant, Phonenumber
	FROM [Food_Package]
		Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
			WHERE [Food_Package].Order_ID IS NOT NULL

-- Fortsättning, summerar totalsumman hittils. 

SELECT DISTINCT SUM(Price) AS 'Total sales in Food_Rescue'
	FROM [Food_Package]
		WHERE Order_ID IS NOT NULL

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query R5: Denna finns bara för att en resturang kan kolla exakt vad den har kvar att sälja. 

/*
	Resturangen får en snabb bllick och kan kolla vad som finns och vad de har för datum. Kanske de måste rea ut något.  
*/

SELECT DISTINCT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant
	FROM [Food_Package]
		Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
			WHERE Restaurant_Name = 'Bohus Pizza' And Order_ID IS NULL 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

