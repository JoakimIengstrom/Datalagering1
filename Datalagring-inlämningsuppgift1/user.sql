-- anslut till den
USE [Food_Rescue]
GO

--Query - Check for not sold Boxes skall ligga i USER
SELECT Food_Box, Food_Category, Price, Restaurant_Name
FROM [Food_Package]
Join [Restaurant] on [Food_Package].Restaurant_ID = [Restaurant].Restaurant_ID
WHERE [Order_ID] IS NULL AND [Food_Category] = 'Fisk'
ORDER BY Price ASC 

SELECT *
FROM [Food_Package]
WHERE [Order_ID] IS NULL

--Order_ID (Automatiskt), [User_ID], Sales_Date
--INSERT INTO [Order] VALUES (1, GETDATE())
--UPDATE [Food_Package]
--SET Order_ID SCOPE_IDENTITY ID
--WHERE Food_Category = 'Vegan' 

SELECT *
FROM [Food_Package]
WHERE [Order_ID] IS NOT NULL


