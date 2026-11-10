-- =============================================
-- الدرس 5: تمرين JOINs
-- =============================================

USE Practice;
GO

-- 0. جهّز البيانات (شغّل الجزء ده مرة واحدة بس)
--    أ) شغّل lesson03-setup.sql الأول، عشان البيانات ترجع زي الأول
--    ب) وبعدين شغّل الـ INSERT ده: عضوين جداد لسه مستعاروش حاجة
INSERT INTO Members (FullName, Email, City, JoinDate) VALUES
('Hana Mostafa', 'hana@mail.com', 'Cairo', '2026-10-15'),
('Tamer Nabil',  NULL,            'Giza',  '2026-11-01');


-- 1. هات كل استعارة ومعاها اسم العضو (FullName و BorrowDate)
SELECT * FROM Books
SELECT * FROM Borrowings
SELECT * FROM Members

Select m.FullName , b.BorrowDate 
FROM Borrowings b 
INNER JOIN Members m ON m.id = b.MemberId;

-- 2. هات كل استعارة ومعاها عنوان الكتاب (Title و BorrowDate)
SELECT b.Title, br.BorrowDate
FROM Books b 
INNER JOIN Borrowings br
ON b.Id = br.BookId

-- 3. تقرير كامل: اسم العضو، عنوان الكتاب، تاريخ الاستعارة، تاريخ الرجوع
--    مترتب من الأحدث للأقدم
SELECT m.FullName, b.Title, br.BorrowDate
FROM Borrowings br 
INNER JOIN Books b
ON b.Id = br.BookId
INNER JOIN Members m 
ON m.id = br.MemberId
ORDER BY br.ReturnDate DESC

-- 4. الكتب اللي مع الناس دلوقتي (لسه مرجعتش): اسم العضو، عنوان الكتاب، تاريخ الاستعارة

SELECT m.FullName, b.Title, br.BorrowDate
FROM Borrowings br 
INNER JOIN Books b ON b.Id = br.BookId
INNER JOIN Members m ON m.id = br.MemberId
WHERE br.ReturnDate IS NULL;

-- 5. هات عناوين الكتب اللي Sherif Fouad استعارها
SELECT m.FullName, b.Title, br.BorrowDate
FROM Borrowings br 
INNER JOIN Books b ON b.Id = br.BookId
INNER JOIN Members m ON m.id = br.MemberId
WHERE m.Id = 1

-- 6. هات كل الأعضاء واستعاراتهم، حتى الأعضاء اللي ماستعاروش حاجة
--    (FullName و BookId و BorrowDate)


-- 7. هات الأعضاء اللي عمرهم ما استعاروا حاجة


-- 8. هات الكتب اللي محدش استعارها خالص


-- ⭐ 9. هات الأعضاء اللي من Cairo واستعاروا كتب برمجة (اسم العضو وعنوان الكتاب)


-- ⭐ 10. هات أسامي الأعضاء اللي استعاروا كتاب لـ George Orwell (من غير تكرار)

