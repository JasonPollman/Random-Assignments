/*
	Jason James Pollman
	ITCS-3160-001
	2/24/13
*/
	
USE AutoDealer3
GO


/* PART I */
/* Question #1 */
CREATE TABLE SalesVisits (	ID				int		NOT NULL,
							CustomerID		int		NOT NULL,
							SalesPersonID	int		NOT NULL,
							[Date]			date	NOT NULL,
							[Time]			time	NOT NULL,
							CONSTRAINT PK_SalesVisits PRIMARY KEY CLUSTERED(ID ASC),
							CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(ID),
							CONSTRAINT FK_SalesPersonID FOREIGN KEY(SalesPersonID) REFERENCES SalesPeople(ID))
GO


CREATE TABLE SalesVisitIntersts (	VisitID			int			NOT NULL,
									VehicleID		char(15)	NOT NULL,
									CONSTRAINT PK_SalesVisitInterests PRIMARY KEY CLUSTERED(VisitID, VehicleID ASC),
									CONSTRAINT FK_VisitID FOREIGN KEY(VisitID) REFERENCES SalesVisits(ID),
									CONSTRAINT FK_VehicleID FOREIGN KEY(VehicleID) REFERENCES Cars(VehicleID))
GO


CREATE TABLE CarSales (	VehicleID		char(15)	NOT NULL,
						CustomerID		int			NOT NULL,
						SalesPersonID	int			NOT NULL,
						BankID			char(9)		NOT NULL,
						SalesDate		date		NOT NULL,
						Price			money		NOT NULL,
						CONSTRAINT PK_CarSales PRIMARY KEY CLUSTERED(VehicleID ASC),
						CONSTRAINT FK_CarSales_VehicleID FOREIGN KEY(VehicleID) REFERENCES Cars(VehicleID),
						CONSTRAINT FK_CarSales_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(ID),
						CONSTRAINT FK_CarSales_SalesPersonID FOREIGN KEY(SalesPersonID) REFERENCES SalesPeople(ID),
						CONSTRAINT FK_CarSales_BankID FOREIGN KEY(BankID) REFERENCES Banks(RoutingNumber))
GO



/* Question #2 */
INSERT INTO SalesVisits VALUES ( 1,  1, 1, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 2,  1, 1, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 3,  1, 1, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 4,  1, 1, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 5,  2, 2, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 6,  2, 2, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 7,  2, 2, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 8,  2, 2, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES ( 9,  3, 3, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (10,  3, 3, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (11,  3, 3, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (12,  3, 3, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (13,  4, 4, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (14,  4, 4, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (15,  4, 4, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (16,  4, 4, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (17,  5, 1, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (18,  5, 1, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (19,  5, 1, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (20,  5, 1, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (21,  6, 2, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (22,  6, 2, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (23,  6, 3, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (24,  6, 3, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (25,  7, 4, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (26,  7, 4, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (27,  7, 1, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (28,  7, 1, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (29,  8, 1, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (30,  8, 2, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (31,  8, 3, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (32,  8, 4, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (33,  9, 1, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (34,  9, 2, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (35,  9, 2, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (36,  9, 4, '02-17-2013', '11:00 AM')
GO
INSERT INTO SalesVisits VALUES (37, 10, 1, '02-14-2013', '08:00 AM')
GO
INSERT INTO SalesVisits VALUES (38, 10, 2, '02-15-2013', '09:00 AM')
GO
INSERT INTO SalesVisits VALUES (39, 10, 3, '02-16-2013', '10:00 AM')
GO
INSERT INTO SalesVisits VALUES (40, 10, 4, '02-17-2013', '11:00 AM')
GO


INSERT INTO SalesVisitIntersts VALUES ( 1, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES ( 1, 'GHV305MEG301R')
GO
INSERT INTO SalesVisitIntersts VALUES ( 1, 'QLT113IHU647S')
GO
INSERT INTO SalesVisitIntersts VALUES ( 2, 'QIU403COU317I')
GO
INSERT INTO SalesVisitIntersts VALUES ( 2, 'TWO305EEN449V')
GO
INSERT INTO SalesVisitIntersts VALUES ( 2, 'UHC457CHJ476G')
GO
INSERT INTO SalesVisitIntersts VALUES ( 3, 'VHD838DMM722P')
GO
INSERT INTO SalesVisitIntersts VALUES ( 3, 'HTU791AKF984L')
GO
INSERT INTO SalesVisitIntersts VALUES ( 3, 'WZZ748FGT545E')
GO
INSERT INTO SalesVisitIntersts VALUES ( 4, 'VQT745LXX507E')
GO
INSERT INTO SalesVisitIntersts VALUES ( 5, 'QLT113IHU647S')
GO
INSERT INTO SalesVisitIntersts VALUES ( 6, 'WZZ748FGT545E')
GO
INSERT INTO SalesVisitIntersts VALUES ( 7, 'SMR917QVP285K')
GO
INSERT INTO SalesVisitIntersts VALUES ( 8, 'CPX560LRH462Q')
GO
INSERT INTO SalesVisitIntersts VALUES ( 9, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (10, 'EOI158MTU291A')
GO
INSERT INTO SalesVisitIntersts VALUES (11, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (12, 'SMR917QVP285K')
GO
INSERT INTO SalesVisitIntersts VALUES (13, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (14, 'WZZ748FGT545E')
GO
INSERT INTO SalesVisitIntersts VALUES (15, 'PCS756ISI197O')
GO
INSERT INTO SalesVisitIntersts VALUES (16, 'PCS756ISI197O')
GO
INSERT INTO SalesVisitIntersts VALUES (17, 'ATN939EHX518P')
GO
INSERT INTO SalesVisitIntersts VALUES (18, 'ZBZ023NXC981B')
GO
INSERT INTO SalesVisitIntersts VALUES (19, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (20, 'ESX208WZS412R')
GO
INSERT INTO SalesVisitIntersts VALUES (21, 'IMP048HYB446H')
GO
INSERT INTO SalesVisitIntersts VALUES (22, 'QZO626ZSA926A')
GO
INSERT INTO SalesVisitIntersts VALUES (23, 'UHP391YMS802R')
GO
INSERT INTO SalesVisitIntersts VALUES (24, 'VQT745LXX507E')
GO
INSERT INTO SalesVisitIntersts VALUES (25, 'QIU403COU317I')
GO
INSERT INTO SalesVisitIntersts VALUES (26, 'QIU403COU317I')
GO
INSERT INTO SalesVisitIntersts VALUES (27, 'QIU403COU317I')
GO
INSERT INTO SalesVisitIntersts VALUES (28, 'QIU403COU317I')
GO
INSERT INTO SalesVisitIntersts VALUES (29, 'QZO626ZSA926A')
GO
INSERT INTO SalesVisitIntersts VALUES (30, 'VQT745LXX507E')
GO
INSERT INTO SalesVisitIntersts VALUES (31, 'WZZ748FGT545E')
GO
INSERT INTO SalesVisitIntersts VALUES (32, 'XDF251XRS801U')
GO
INSERT INTO SalesVisitIntersts VALUES (33, 'XKZ546BCK157M')
GO
INSERT INTO SalesVisitIntersts VALUES (34, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (35, 'XVV027IXQ600Z')
GO
INSERT INTO SalesVisitIntersts VALUES (36, 'ATL968LXW390R')
GO
INSERT INTO SalesVisitIntersts VALUES (37, 'XZC881OSA178P')
GO
INSERT INTO SalesVisitIntersts VALUES (38, 'YNR313ZBZ878L')
GO
INSERT INTO SalesVisitIntersts VALUES (39, 'YTS322NNM086Y')
GO
INSERT INTO SalesVisitIntersts VALUES (40, 'ZAG321TRK992M')
GO
INSERT INTO SalesVisitIntersts VALUES (40, 'ZYF684IPV746C')
GO
INSERT INTO SalesVisitIntersts VALUES (40, 'YTS322NNM086Y')
GO
INSERT INTO SalesVisitIntersts VALUES (40, 'ATL968LXW390R')
GO


INSERT INTO CarSales VALUES ('ATL968LXW390R', 10, 4, '053000196', '2-17-13', 22500.00)
GO
INSERT INTO CarSales VALUES ('XVV027IXQ600Z',  9, 2, '053000196', '2-16-13', 26100.00)
GO
INSERT INTO CarSales VALUES ('WZZ748FGT545E',  8, 3, '053000196', '2-16-13', 32900.00)
GO
INSERT INTO CarSales VALUES ('QIU403COU317I',  7, 1, '053112712', '2-17-13', 30078.00)
GO
INSERT INTO CarSales VALUES ('IMP048HYB446H',  6, 2, '053112712', '2-14-13', 25000.00)
GO
INSERT INTO CarSales VALUES ('ESX208WZS412R',  5, 1, '055003492', '2-17-13', 21499.00)
GO



/* PART II */

/* Question #1 */
SELECT [Date], [Time], Customers.FirstName+' '+Customers.LastName AS 'Customer Name', SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sales Person' FROM SalesVisits JOIN SalesPeople ON SalesVisits.SalesPersonID = SalesPeople.ID JOIN Customers ON SalesVisits.CustomerID = Customers.ID
ORDER BY [Date], [Time], 'Customer Name', 'Sales Person'



/* Question #2 */
SELECT [Date], SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sales Person', COUNT(SalesPersonID) AS 'Number of Visits on This Day' FROM SalesVisits
JOIN SalesPeople ON SalesVisits.SalesPersonID = SalesPeople.ID
GROUP BY [Date], SalesPeople.FirstName, SalesPeople.LastName
ORDER BY [Date]



/* Question #3 */
SELECT [Date], [Time], Customers.FirstName+' '+Customers.LastName AS 'Customer Name', SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sales Person', Cars.Manufacturer, Cars.Model, Cars.[Year], Cars.Cost FROM SalesVisits
JOIN Customers ON SalesVisits.CustomerID = Customers.ID JOIN SalesPeople ON SalesVisits.SalesPersonID = SalesPeople.ID JOIN SalesVisitIntersts ON SalesVisits.ID = SalesVisitIntersts.VisitID JOIN Cars ON SalesVisitIntersts.VehicleID = Cars.VehicleID
ORDER BY [Date], [Time], 'Customer Name', 'Sales Person', Cars.Manufacturer, Cars.Model, Cars.[Year]



/* Question #4 */
SELECT SalesDate, Customers.FirstName+' '+Customers.LastName AS 'Customer Name', SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sales Person', Banks.RoutingNumber AS 'Bank ID', Banks.BankName, Cars.*, Price AS 'Price Sold', CONVERT(money, Price-Cars.Cost) AS 'Gross Profit' FROM CarSales
JOIN Banks ON CarSales.BankID = Banks.RoutingNumber JOIN Customers ON CarSales.CustomerID = Customers.ID JOIN SalesPeople ON CarSales.SalesPersonID = SalesPeople.ID JOIN Cars ON CarSales.VehicleID = Cars.VehicleID
ORDER BY SalesDate, 'Customer Name', 'Sales Person', 'Bank ID'



/* Question #5 */
SELECT SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sales Person', COUNT(SalesPersonID) AS 'Number of Cars Sold', SUM(CarSales.Price) AS 'Total Sales', SalesPeople.StartDate FROM CarSales
JOIN SalesPeople ON CarSales.SalesPersonID = SalesPeople.ID 
GROUP BY SalesPeople.FirstName, SalesPeople.LastName, SalesPeople.StartDate
ORDER BY 'Number of Cars Sold' DESC, 'Total Sales' DESC


/* Question #6 */
Select Price AS 'Top Sale Price!', SalesPeople.FirstName+' '+SalesPeople.LastName AS 'Sold By', Customers.FirstName+' '+Customers.LastName AS 'Sold To', Banks.*, Cars.*
FROM CarSales
JOIN Cars ON CarSales.VehicleID = Cars.VehicleID
JOIN SalesPeople ON CarSales.SalesPersonID = SalesPeople.ID
JOIN Customers ON CarSales.CustomerID = Customers.ID
JOIN Banks ON CarSales.BankID = Banks.RoutingNumber
WHERE Price = (SELECT Max(Price) FROM CarSales)
GROUP BY Price, SalesPeople.FirstName, SalesPeople.LastName, Customers.FirstName, Customers.LastName, Banks.RoutingNumber, Banks.BankName, Cars.VehicleID, Cars.Manufacturer, Cars.Model, Cars.Color, Cars.Cost, Cars.[Year]