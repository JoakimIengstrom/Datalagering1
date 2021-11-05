-- anslut till den
USE [Food_Rescue]
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query U1: I denna kan jag nu kolla vilka matlådor som inte är sålda av en viss typ och sortera de efter billigast först. 

/*
	I denna så kollar jag efter alla lådor som är i kategorin Vegan. 
	Väljer lite kategorier för att ge bra ut. 
	Sätter WHERE to 'Vegan' AND IS NULL för att få fram de som är osålda. 
	Sedan sorterar jag dessa på priset genom ORDER BY. 
*/

SELECT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant, Phonenumber
FROM [Food_Package] 
	Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
		WHERE Food_Category = 'Vegan' AND [Food_Package].Order_ID IS NULL
			Order BY 'Price' ASC --ASC är standardvärdet

-- Kortare lösning men med mindre info till kunden.
SELECT * From [Food_Package] 
	WHERE Food_Category = 'Vegan' AND Order_ID IS NULL 
		Order BY 'Price' 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query U2: Modifiera en lunchlådas användar ID från NULL till ID:t på en användare som köper en låda. -Valde att byta till Order_ID

/*
	Här simulerar vi hur det ser ut när vi lägger till en order och ger en matlåda det tillhörande IDt. 
	Använder nu Scope_Identity för att hitta den senast tillagda ordern som är genererad.  
	Kort och gått, jag gör en Insert Into [Order] Hämtar upp den med Scope_Identity och gör sedan en Update på ORDER_ID. 
*/

INSERT INTO [Order] VALUES (DATEADD(DAY, 3, GETDATE()), 1) 
	UPDATE [Food_Package]
		SET Order_ID = (SELECT SCOPE_IDENTITY() FROM [Order] WHERE Order_ID = SCOPE_IDENTITY()) 
			WHERE Box_ID = 2016

SELECT * FROM [Food_Package]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Extra Querys

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query U3: Kollar hur mycket en person har spenderat och snitt priset på det som är köpt.

/*
	Just i denna tar jag fram en person, tittar på hur mycket den kunden spendrat, samt var snittpriset är för dessa köp. 
*/


SELECT DISTINCT SUM(Price) AS 'Jonas Spendings', AVG(Price) AS 'Average Price'
	FROM [Order]
		Join [Food_Package] ON [Order].Order_ID = [Food_Package].Order_ID
		Join [Customer] ON [Customer].ID = [Order].Customer_ID
			WHERE ID = 3

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query U4: Ta reda på vilka boxar som har kortast datum kvar, även se om någon råkar vara gammal. 

/*
	Genom att göra en lista på vad som finns kvar att köpa som vi sedan sorterar på datumet.
	Jag har valt att använda mig av parametrarna resturangens namn, så får joina den, sedan bara vilken mat och datum det är. 
	Väljer att använda AS för att göra det tydligare för den som läser ut det. 
	Hade sedan kunnat använda denna i admin för att ta fram de som är gamla och ta bort dem ur listan. 
*/

SELECT Restaurant_Name AS Restaurant, Box_Name AS Food, Best_Before 
	FROM [Food_Package]
		Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
			WHERE Order_ID IS NULL
				ORDER BY Best_Before 
				
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query U5: Titta på vem som har köpt vad.

/*
	Låter en kund kolla på sina köp historiskt, se vad som är köpt och hur mycket som har spenderats. 
*/

Select ID, Full_Name, Box_Name, Price
	FROM [Order]
		Join [Food_Package] ON [Order].Order_ID = [Food_Package].Order_ID
		Join [Customer] ON [Customer].ID = [Order].Customer_ID
			ORDER BY Full_Name

-------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query U6: Se vad en box har för innehåll. 

/*
	Titta på innehållsförtecknignen i en Box. 
*/

Select Content, Content_ID AS Food_Box FROM [Food_Content] -- Lista de som finns. 

Select Content, Content_ID AS Food_Box -- Kolla vald box. 
	FROM [Food_Content] 
		Where Content_ID = 2009

-------------------------------------------------------------------------------------------------------------------------------------------------------------
