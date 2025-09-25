-- File: product_queries.sql
-- DB  : AdventureWorks2012
-- Note: zapytania o produkty (wolumen, przychód, koszty, kolory)

/* =========================
   1) Produkty zamawiane ≥ 200 szt. w roku 2012
   (SUM(OrderQty) z Sales.SalesOrderDetail; data po OrderDate w nagłówku)
   ========================= */
SELECT
    PR.Name           AS ProductName,
    SUM(D.OrderQty)   AS TotalQty
FROM Sales.SalesOrderDetail  AS D
JOIN Sales.SalesOrderHeader  AS H ON H.SalesOrderID = D.SalesOrderID
JOIN Production.Product      AS PR ON PR.ProductID  = D.ProductID
WHERE H.OrderDate >= '2012-01-01' AND H.OrderDate < '2013-01-01'
GROUP BY PR.Name
HAVING SUM(D.OrderQty) >= 200
ORDER BY TotalQty DESC;
GO
-- ----------------------------------------------------------

/* =========================
   2) Przychód per produkt (SUM(LineTotal)) – TOP 20
   ========================= */
SELECT TOP (20)
    PR.Name            AS ProductName,
    SUM(D.LineTotal)   AS Revenue
FROM Sales.SalesOrderDetail  AS D
JOIN Production.Product      AS PR ON PR.ProductID = D.ProductID
GROUP BY PR.Name
ORDER BY Revenue DESC;
GO
-- ----------------------------------------------------------

/* =========================
   3) Kolory produktów z liczbą sztuk ≥ 20 (NULL pomijamy)
   ========================= */
SELECT
    PR.Color,
    COUNT(*) AS ProductCount
FROM Production.Product AS PR
WHERE PR.Color IS NOT NULL
GROUP BY PR.Color
HAVING COUNT(*) >= 20
ORDER BY ProductCount DESC;
GO
-- ----------------------------------------------------------

/* =========================
   4) Średni koszt standardowy (tylko wartości > 0)
   ========================= */
SELECT AVG(PR.StandardCost) AS AvgStandardCost
FROM Production.Product AS PR
WHERE PR.StandardCost > 0;
GO
-- ----------------------------------------------------------

/* =========================
   5) Najwyższa cena katalogowa
   ========================= */
SELECT MAX(PR.ListPrice) AS MaxListPrice
FROM Production.Product AS PR;
GO
-- ----------------------------------------------------------

