-- anslut till den
USE [Food_Rescue]
GO

--en rutin för att kunna radera (banna) en användare
-- Kolla vilka users
SELECT ID, Full_Name FROM [Customer]
-- Kontrollera så det är rätt
SELECT ID, Full_Name FROM [Customer] Where ID = 11
-- Ta bort user
DELETE FROM [Customer] WHERE ID = 11;
-- Kontrollera så det funkade
SELECT ID, Full_Name FROM [Customer]
-- ID 11 är nu borta. 

--en rutin för att registrera en ny restaurang
SELECT * FROM [Restaurant]

SELECT DISTINCT Full_Name, Food_Category
FROM [Food_Package]
JOIN [Customer] ON (ID=2) OR (ID=3)	
Order BY Full_Name
