-- anslut till den
USE [Food_Rescue]
GO

SELECT *
FROM [Users]

SELECT *
FROM [Restaurant]

SELECT *
FROM [Food_Package]

SELECT Type_of_Food, Username
FROM [Food_Package]
JOIN [Users] ON (ID=1)	