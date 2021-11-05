-- anslut till den
USE [Food_Rescue]
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A1: Rutin för att kunna radera (banna) en användare

/*
	Här valde jag att först visa hur jag skulle kunna använda namnet på en gammal användare. Detta för att jag inte vet hur bra det
	är att ta bort en användare som är länkad till bland annat orders. Så jag kollar i just detta testet vilka som är över ett år gamla. 
	Jag gör en uppdate och ändrar namnet till Old User. Sedan visar jag att jag kan ta bort den genom att använda IDt från de som var gamla. 
*/

SELECT * FROM [Customer] -- Kolla vilka users som finns.

SELECT ID, Full_Name, PassReg FROM [Customer] Where PassReg < DATEADD(YEAR, -1, GETDATE()) -- Sortera ut de gamla. 

Update [Customer] -- Uppdaterar inaktiv användare med ett annat user name. 
	SET Full_Name = 'Old User'
		Where PassReg < DATEADD(YEAR, -1, GETDATE())

SELECT ID, Full_Name FROM [Customer] Where ID = 11 OR ID = 12 -- Kontrollera så det är rätt

DELETE FROM [Customer] WHERE ID = 11 OR ID = 12; -- Ta bort ID 11 och 12 som var de gamla. 

SELECT ID, Full_Name FROM [Customer] -- Kontrollera så det funkade

-- ID 11 och 12 är nu borta. 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A2: Rutin för att registrera en ny restaurang

/*
	Precis som i model så gör vi en Insert Into med all data som behövs för att den skall kunna registrera. 
	Gör en kontroll innan vad som finns och en efter för att se om den gått genom. 
*/

SELECT * FROM [Restaurant] --Se hur litan ser ut idag. 

--Resturant_ID (Automatiskt),	Restaurant_Name,	City,		Phonenumber
INSERT INTO [Restaurant] VALUES ('Ny-Matbutik',		'Göteborg', '7318231329')

SELECT * FROM [Restaurant] --kolla om listan är uppdaterad och det är den. 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Extra Querys

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A3: Byt namn på restaurang efter ägarbyte

/*
	Jag lekte med tanken på att en person eller annan resturang köper upp en eller flera konkurenter. 
	Men för att inte förlora all historik och annat så gör jag istälelt en 
	uppdate på namnet. Just i dett fallet så låter jag Williams Bistro ta över 2 olika resturanger. 
*/

SELECT Restaurant_Name, Restaurant_ID FROM [Restaurant] -- Lista de som finns

Update [Restaurant] -- Uppdatera 2 resutranger med ett nytt namn. 
	SET Restaurant_Name = 'Williams_Bistro'
		WHERE Restaurant_Name = 'Da-Mille' OR Restaurant_Name = 'Thaien'

SELECT * FROM [Restaurant] WHERE Restaurant_Name = 'Williams_Bistro' -- Lista hur det blev

-------------------------------------------------------------------------------------------------------------------------------------------------------------


