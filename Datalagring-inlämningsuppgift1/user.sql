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
--problem ett har inte Null på mina Lunchlådor. 

--Börja med att kolla hur det ser ut. 
SELECT * FROM [Food_Package]

--Använde inte null, men lägger till det. 
--Gör en alter för att fixa det, lägger till column sold
Alter Table [Food_Package]
ADD Sold varchar(5);

--Kikar hur det ser ut och nu finns även sold. 
SELECT * FROM [Food_Package]

--Gör en lösning där jag hämtar både order och customer. Gör nu en uppdatering av Sold.
--Detta genom att göra en Uppdate där Orderns ID matchar Kundens ID. Där det matchar sätter jag
--null till kundens ID. Detta funkar!
UPDATE [Food_Package]
SET SOLD = [Customer].ID
FROM [Food_Package]
JOIN [Order] ON [Order].Box_ID = [Food_Package].Box_ID 
Join [Customer] ON [Customer].ID = [Order].Customer_ID
WHERE [Order].Customer_ID = [Customer].ID





--VG Fråga
SELECT DISTINCT SUM(Price) AS 'Jonas Spendings', AVG(Price) AS 'Average Price'
FROM [Order]
Join [Food_Package] ON [Order].Box_ID = [Food_Package].Box_ID
Join [Customer] ON [Customer].ID = [Order].Customer_ID
WHERE ID = 3

*




