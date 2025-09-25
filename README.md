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
- `queries/` – pliki `.sql` z zapytaniami podzielonymi tematycznie (JOIN, GROUP BY, HAVING, agregaty).
- `screenshots/` – zrzuty ekranu wyników w SSMS (opcjonalnie).
- `README.md` – opis projektu.

---

## 📸 Przykład wyników
```sql
Poniżej zapytanie, które pokazuje klientów (imię i nazwisko) wraz z liczbą zamówień złożonych w latach 2012–2014. Wyświetlani są tylko ci klienci, którzy złożyli co najmniej 6 zamówień. Wyniki są posortowane malejąco według liczby zamówień:

<img width="825" height="844" alt="image" src="https://github.com/user-attachments/assets/2fe2cf52-0256-47f7-b7da-c0dd5109b013" />


