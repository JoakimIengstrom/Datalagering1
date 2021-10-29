-- anslut till den
USE [Food_Rescue]
GO

--query för att hitta alla oköpta matlådor i alla restauranger av en viss typ (kött/fisk/vego), sorterade på pris lägst först: ORDER BY, INNER JOIN


--Query I denna kan jag nu kolla vilka matlådor som inte är sålda genom att kolla vilka BOX ID som int matchar BOX ID på sålda ordrar.
SELECT DISTINCT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant, Phonenumber
FROM [Food_Package]
Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
Join [Order] ON [Order].Box_ID != [Food_Package].Box_ID
Join [Customer] ON [Customer].ID = [Order].Customer_ID
WHERE Food_Category = 'Vegan'

--query för att modifiera en lunchlådas användar ID från NULL till ID:t på en användare som köper en låda
/*
-- Använde inte null, men lägger till det. 
Alter Table [Food_Package]
ADD Sold varchar(5);

--Kollar så det funkar, väljer BOX_ID 45
SELECT * FROM [Food_Package]

SELECT * FROM [Order]

UPDATE [Food_Package]
SET Sold = 12
WHERE BOX_ID = 2016;


UPDATE
    [Food_Package]
SET
    SOLD = 12
FROM
    [Order]
    --JOIN [Order] ON [Order].Box_ID = [Food_Package].Box_ID       
WHERE
    [Order].Customer_ID = 12





--VG Fråga
SELECT DISTINCT SUM(Price) AS 'Jonas Spendings', AVG(Price) AS 'Average Price'
FROM [Order]
Join [Food_Package] ON [Order].Box_ID = [Food_Package].Box_ID
Join [Customer] ON [Customer].ID = [Order].Customer_ID
WHERE ID = 3

*/




