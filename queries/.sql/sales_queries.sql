-- File: sales_queries.sql
-- DB  : AdventureWorks2012
-- Note: zapytania sprzedażowe (terytoria, trendy, fracht)

/* =========================
   1) Terytoria z SUM(TotalDue) > 10 000 000 (z nazwą terytorium)
   ========================= */
SELECT
    SUM(S.TotalDue) AS TotalDue,
    T.Name          AS TerritoryName
FROM Sales.SalesOrderHeader AS S
LEFT JOIN Sales.SalesTerritory AS T ON S.TerritoryID = T.TerritoryID
GROUP BY T.Name
HAVING SUM(S.TotalDue) > 10000000
ORDER BY TotalDue DESC;
GO
-- ----------------------------------------------------------

/* =========================
   2) Liczba zamówień per terytorium w zakresie dat (2011-07-01 – 2012-12-31)
   ========================= */
SELECT
    T.TerritoryID,
    COUNT(S.SalesOrderID) AS TotalSales
FROM Sales.SalesOrderHeader AS S
LEFT JOIN Sales.SalesTerritory AS T ON S.TerritoryID = T.TerritoryID
WHERE S.OrderDate >= '2011-07-01' AND S.OrderDate < '2013-01-01'
GROUP BY T.TerritoryID
ORDER BY TotalSales DESC;
GO
-- ----------------------------------------------------------

/* =========================
   3) Średnia opłata frachtowa dla TerritoryID = 4
   ========================= */
SELECT
    AVG(S.Freight) AS AvgFreight
FROM Sales.SalesOrderHeader AS S
WHERE S.TerritoryID = 4;
GO
-- ----------------------------------------------------------

/* =========================
   4) Trend miesięczny: SUM(TotalDue) per miesiąc (2012)
   (używamy „pierwszego dnia miesiąca” jako bucketa; sargowalne)
   ========================= */
SELECT
    CAST(DATEFROMPARTS(YEAR(S.OrderDate), MONTH(S.OrderDate), 1) AS date) AS MonthStart,
    SUM(S.TotalDue) AS TotalDue
FROM Sales.SalesOrderHeader AS S
WHERE S.OrderDate >= '2012-01-01' AND S.OrderDate < '2013-01-01'
GROUP BY CAST(DATEFROMPARTS(YEAR(S.OrderDate), MONTH(S.OrderDate), 1) AS date)
ORDER BY MonthStart;
GO
-- ----------------------------------------------------------

