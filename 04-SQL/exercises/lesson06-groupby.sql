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


-- 3. لكل نوع: أرخص سعر، وأغلى سعر، ومتوسط السعر


-- 4. كل عضو استعار كام مرة (اسم العضو + العدد)، مترتبين من الأكتر للأقل


-- 5. الأعضاء اللي استعاروا أكتر من مرة بس
