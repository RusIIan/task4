



CREATE DATABASE TASK

USE TASK
CREATE TABLE Employees(
[Id] INT PRIMARY KEY IDENTITY,
[OrderId] INT FOREIGN KEY REFERENCES [Order](Id),
[CategoryId] INT FOREIGN KEY REFERENCES [Category](Id),
[Name] NVARCHAR(25) NOT NULL,
[LastName] NVARCHAR(30) NOT NULL,
[Age] INT NOT NULL,
[Salary] MONEY NOT NULL,
)
INSERT Employees
VALUES(2,1,'Cavid','Alakbarov',26,1520),
		(6,5,'Ruslan','Ibrahimov',23,2500),
		 (4,2,'Fidan','Kerimova',18,1358),
		  (10,2,'Valeh','Agayev',35,1520),
		   (2,1,'Onur','Ibadov',23,1520),
		    (1,1,'Cavid','Alakbarov',26,1520),
			 (8,5,'Ruslan','Ibrahimov',23,2500),
			  (2,1,'Nicat','Huseynzade',18,2450),
			   (7,5,'Ruslan','Ibrahimov',23,2500),
			    (1,1,'Ali','Rehimov',24,2020),
				 (9,4,'Zahid','Nureliyev',22,1410),
				  (10,4,'Ayan','Huseynova',19,1520),
				   (1,1,'Cavid','Alakbarov',26,1520),
				    (10,2,'Aqil','Qarayev',30,950),
					 (4,3,'Sveta','Qarayeva',21,1520)
GO
CREATE TABLE [Order](
[Id] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(MAX) NOT NULL,
[CategoryId] INT FOREIGN KEY REFERENCES [Category](Id),
[Count] INT NOT NULL,
[Unit price] MONEY CHECK([Unit price]>20) NOT NULL
)
INSERT [Order]
VALUES('Beer',1,150,60),
		('Tequila',1,200,163),
		  ('Sushi',2,350,27),
		   ('Apple',3,100,30),
		     ('Steik',2,150,235),
			  ('RAM',5,235,200),
			   ('SSD',5,142,150),
			    ('VIDEO CARD',5,123,1350),
				 ('Potatoes',4,50,21),
				  ('Broccoli',4,50,25)

GO
CREATE TABLE Category(
[Id] INT PRIMARY KEY IDENTITY,
[Name]nvarchar(max) NOT NULL,
[Description] NVARCHAR(MAX) NOT NULL
)
INSERT Category([Name],[Description])
VALUES('Alcohol Drink','you can drink after 18+'),
		('Food','fresh food'),
		  ('FRUIT','fresh fruit'),
		   ('Vegetables','fresh vegatales'),
		     ('Electronics','PC Texnology')
go
	
--CREATE TABLE EmployessLog(
--ID INT PRIMARY KEY IDENTITY,
--Logdata NVARCHAR(MAX)
--)
			
--CREATE TRIGGER EmployeesTriggerLog
--ON Employees
--Instead of DELETE,INSERT,UPDATE
--AS
--DECLARE @DeleteEmp NVARCHAR(MAX), @InsertEmp NVARCHAR(MAX)
--SELECT @DeleteEmp=[Name] FROM deleted
--SELECT @InsertEmp=[Name] FROM inserted
--INSERT EmployessLog VALUES(SUSER_SNAME()+ ' Adi isci terefinden ' + 
--' saat: ' + CAST(GETDATE() AS NVARCHAR(MAX))+ '  adi ' + @DeleteEmp +
--'  olan iscini '+ @InsertEmp + '  yeni adi ile evez etmek isteyib')


--Update Employees
--set [Name]='дшнплгалга' where id =1

go

--CREATE TRIGGER EmployeesTrigger
--ON Employees
--AFTER INSERT
--AS 
--SELECT @@IDENTITY

--Insert Employees([Name],[LastName],[Age],[Salary])
--Values ('Fikret','Emirov',56,1536) 

Go
--CREATE PROC OrderProcedure
--AS
--SELECT * FROM [Order]

--EXEC OrderProcedure

GO
--CREATE VIEW CategoryAndOrder
--AS SELECT [C].[Name], SUM([O].[Unit price])as [Sum Unit Price Category]
--FROM [Category] [C] INNER JOIN [Order][O] 
--ON C.Id=[O].[CategoryId] GROUP BY [C].[Name]