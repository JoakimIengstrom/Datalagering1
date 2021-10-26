-- anslut till den
USE [Food_Rescue]
GO

SELECT *
FROM [Food_Content]
Where Vegan = 'Yes'

SELECT *
FROM [Food_Content]
Where Meat = 'Yes'

SELECT *
FROM [Food_Content]
Where Vegetarian = 'Yes'

Select Count(Content)
FROM [Food_Content]
Where Vegetarian = 'Yes'