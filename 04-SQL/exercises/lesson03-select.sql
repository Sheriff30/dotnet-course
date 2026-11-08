-- =============================================
-- الدرس 3: تمرين SELECT و WHERE و ORDER BY
-- اكتب الـ query تحت كل سؤال
-- عشان تشغّل query واحدة: حددها بالماوس واضغط F5
-- =============================================

USE Practice;
GO

-- 1. هات كل الكتب بكل الأعمدة

SELECT * FROM Books;

-- 2. هات العنوان (Title) والسعر (Price) بس لكل الكتب
SELECT Title, Price FROM Books;

-- 3. هات كتب البرمجة بس (Genre = 'Programming')
SELECT * FROM Books Where Genre = 'Programming';

-- 4. هات الكتب اللي سعرها أكبر من 400، مترتبة من الأغلى للأرخص
SELECT * FROM Books Where Price > 400 ORDER BY Price DESC

-- 5. هات الكتب اللي اتنشرت من 2010 لـ 2020
SELECT * FROM Books Where PublishYear BETWEEN 2010 AND 2020;

-- 6. هات الكتب اللي خلصت من المكتبة (AvailableCopies = 0)

SELECT * FROM Books Where AvailableCopies = 0;
-- 7. هات الكتب اللي في عنوانها كلمة 'the'
SELECT * FROM Books Where Title LIKE '%the%';

-- 8. هات الأعضاء اللي من Cairo أو Giza، مترتبين بالاسم أبجدياً
SELECT * FROM Members Where City IN ('Cairo','Giza') ORDER BY FullName DESC;
-- 9. هات الأعضاء اللي ملهمش إيميل
SELECT * FROM Members WHERE Email IS NULL;


-- 10. هات أغلى 3 كتب
SELECT TOP 3 Title , Price From Books ORDER BY PRICE ;
-- 11. هات أنواع الكتب (Genre) من غير تكرار
SELECT DISTINCT Genre FROM Books;

-- 12. هات عمليات الاستعارة اللي الكتاب فيها لسه مرجعش
Select * From Borrowings WHERE ReturnDate is NULL;

-- ⭐ 13. هات العنوان والسعر، وعمود جديد اسمه DiscountedPrice فيه السعر بعد خصم 10%


-- ⭐ 14. هات كتب George Orwell اللي سعرها أقل من 200، أو أي كتاب صفحاته أقل من 100

