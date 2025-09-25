/* ==========================================================
   File: customer_queries.sql
   DB  : AdventureWorks2012
   ========================================================== */

-- =========================
-- 1) Klienci z min. 6 zamówieniami w przedziale dat
--    (JOIN: SalesOrderHeader → Customer → Person)
-- =========================
SELECT
    P.LastName,
    P.FirstName,
    COUNT(S.SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader AS S
INNER JOIN Sales.Customer      AS C ON C.CustomerID       = S.CustomerID
INNER JOIN Person.Person       AS P ON C.PersonID         = P.BusinessEntityID
WHERE S.OrderDate >= '2012-05-01' AND S.OrderDate < '2014-07-01'
GROUP BY P.LastName, P.FirstName
HAVING COUNT(S.SalesOrderID) >= 6
ORDER BY TotalOrders DESC;
GO
-- ----------------------------------------------------------

-- =========================
-- 2) TOP 20 klientów wg liczby zamówień (cała historia)
-- =========================
SELECT TOP (20)
    P.LastName,
    P.FirstName,
    COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader AS S
JOIN Sales.Customer        AS C ON C.CustomerID   = S.CustomerID
JOIN Person.Person         AS P ON C.PersonID     = P.BusinessEntityID
GROUP BY P.LastName, P.FirstName
ORDER BY TotalOrders DESC;
GO
-- ----------------------------------------------------------

-- =========================
-- 3) Klienci z kraju 'Australia' (przykład filtra po atrybucie klienta)
-- =========================
SELECT DISTINCT
    P.LastName,
    P.FirstName,
    C.CustomerID,
    S.Name AS Territory
FROM Sales.Customer AS C
JOIN Person.Person       AS P ON C.PersonID = P.BusinessEntityID
JOIN Sales.SalesTerritory AS S ON C.TerritoryID = S.TerritoryID
WHERE S.Name = 'Australia';
GO

-- ----------------------------------------------------------
