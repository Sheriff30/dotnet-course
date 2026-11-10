-- =============================================
-- الدرس 6: تمرين GROUP BY والـ Aggregate functions
-- =============================================

USE Practice;
GO

SELECT *  FROM Borrowings
SELECT *  FROM Members
SELECT * FROM Books
-- 1. في سطر واحد: عدد الكتب في المكتبة، ومجموع النسخ المتاحة، ومتوسط السعر
SELECT COUNT(*) AS TOTALBOOKS,
 AVG(Price) AS AVGPRICE,
 SUM(AvailableCopies) AS AvailCopies 
FROM BOOKS;

-- 2. عدد الكتب في كل نوع (Genre)، مترتبين من الأكتر للأقل
SELECT Genre, COUNT(*) AS NumBooks
FROM Books
GROUP BY Genre
ORDER BY NumBooks DESC;


-- 3. لكل نوع: أرخص سعر، وأغلى سعر، ومتوسط السعر
SELECT Genre, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice, AVG(Price) AS AvgPrice
FROM Books
GROUP BY Genre;


-- 4. كل عضو استعار كام مرة (اسم العضو + العدد)، مترتبين من الأكتر للأقل
SELECT * FROM Borrowings;
SELECT M.FullName, COUNT(B.BookID) AS NumBorrowings
FROM Members M
JOIN Borrowings B ON M.Id = B.MemberID
GROUP BY M.FullName
ORDER BY NumBorrowings DESC;


-- 5. الأعضاء اللي استعاروا أكتر من مرة بس
SELECT M.FullName, COUNT(B.BookID) AS NumBorrowings
FROM Members M
JOIN Borrowings B ON M.Id = B.MemberID
GROUP BY M.FullName
HAVING COUNT(B.BookID) > 1;
