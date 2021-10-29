-- anslut till den
USE [Food_Rescue]
GO



--en query för att se alla sålda matlådor för en restaurang
SELECT DISTINCT Box_Name AS Box, Food_Category AS Category, Price, Best_Before, Restaurant_Name As Resturant, Phonenumber
FROM [Food_Package]
Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
Join [Order] ON [Order].Box_ID = [Food_Package].Box_ID
Join [Customer] ON [Customer].ID = [Order].Customer_ID
WHERE Restaurant_Name = 'Bohus Pizza'

--en query för att lägga till nya matlådor, kopplade till den aktuella restaurangen

--VG frågor
SELECT DISTINCT SUM(Price) AS 'Bohus Pizza Total Sales'
FROM [Food_Package]
Join [Restaurant] ON [Restaurant].Restaurant_ID = [Food_Package].Restaurant_ID
Join [Order] ON [Order].Box_ID = [Food_Package].Box_ID
WHERE Restaurant_Name = 'Haket'