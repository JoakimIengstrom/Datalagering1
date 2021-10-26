-- anslut till den
USE [Food_Rescue]
GO

SELECT *
FROM [Users]

SELECT *
FROM [Restaurant]

SELECT *
FROM [Food_Content]

SELECT *
FROM [Order]

SELECT Food_Category, Full_Name
FROM [Food_Package]
JOIN [Users] ON (ID=1) OR (ID=2)	

