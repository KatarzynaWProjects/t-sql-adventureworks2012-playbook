Technologie: Microsoft SQL Server 2012, T-SQL, SSMS
# t-sql-adventureworks2012-playbook
Praktyczne zapytania T-SQL na AdventureWorks2012: agregaty, GROUP BY/HAVING, filtry dat, analizy klientów i produktów. Praca wykonana na rozbudowanych schematach z wieloma tabelami i relacjami.

---

##  Cele projektu
- Analiza danych biznesowych w przykładowej bazie AdventureWorks2012.
- Wykorzystanie agregacji (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) do badania kosztów, cen i sprzedaży.
- Grupowanie i filtrowanie danych w oparciu o `GROUP BY`, `HAVING` i `WHERE`.
- Tworzenie raportów sprzedażowych dla produktów, klientów i terytoriów.
- Przedstawienie zależności między tabelami poprzez łączenia (`JOIN`).
- Sprawdzanie powiązań między tabelami poprzez klucze główne i obce widoczne we właściwościach bazy.

---

##  Użyte technologie
- **MS SQL Server 2019 Developer Edition**
- **AdventureWorks2012** (przykładowa baza Microsoft)
- **T-SQL** (język zapytań SQL Server)

---

##  Zakres
1. **Agregacje**  
   - Liczba rekordów z `COUNT(*)`.  
   - Średnie koszty i ceny produktów (`AVG`, `MAX`).
     
2. **Filtrowanie i grupowanie**  
   - `WHERE` do filtrowania wierszy.  
   - `HAVING` do filtrowania wyników po agregacjach.  
   - Grupowanie klientów wg typu (`GROUP BY PersonType`).  

3. **Łączenie tabel (JOIN)**  
   - `INNER JOIN` – dopasowania po obu stronach.  
   - `LEFT JOIN` – wszystkie rekordy z lewej tabeli + dopasowania z prawej.  
   - Łączenie wielu tabel (np. Customer + Person + SalesOrderHeader).  

4. **Analizy sprzedaży**  
   - Klienci z największą liczbą zamówień.  
   - Produkty zamawiane co najmniej 200 razy w danym roku.  
   - Sprzedaż wg terytoriów przekraczająca 10M USD.  
   - Analiza relacji między wieloma tabelami i używanie kluczy obcych / głównych
---

##  Struktura repozytorium
   - `queries/sql/` – pliki `.sql` z podziałem tematycznym:
   - `customer_queries.sql`
   - `product_queries.sql`
   - `sales_queries.sql`
   - `README.md`

**Pliki zapytań:**
- [customer_queries.sql](./queries/sql/customer_queries.sql)
- [product_queries.sql](./queries/sql/product_queries.sql)
- [sales_queries.sql](./queries/sql/sales_queries.sql)
---

## 📸 Przykład wyników
```sql
-- Poniżej zapytanie, które pokazuje klientów (imię i nazwisko) wraz z liczbą zamówień złożonych w latach 2012–2014. Wyświetlani są tylko ci klienci, którzy złożyli co najmniej 6 zamówień. Wyniki są posortowane malejąco według liczby zamówień:
SELECT P.LastName, P.FirstName, COUNT(S.SalesOrderID) AS Total_sum
FROM Sales.SalesOrderHeader AS S
INNER JOIN Sales.Customer AS C ON C.CustomerID = S.CustomerID
INNER JOIN Person.Person AS P ON C.CustomerID = P.BusinessEntityID
WHERE S.OrderDate BETWEEN '2012-05-01' AND '2014-06-30'
GROUP BY P.LastName, P.FirstName
HAVING COUNT(S.SalesOrderID) >= 6
ORDER BY Total_sum DESC;
```
![9925e44c-765b-4f4a-bb15-4a23571f7139](https://github.com/user-attachments/assets/4b7318e1-4dd4-4823-b9b6-017f5f43c665)
