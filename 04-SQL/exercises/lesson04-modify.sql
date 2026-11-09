-- =============================================
-- الدرس 4: تمرين INSERT و UPDATE و DELETE
-- 💡 قبل أي UPDATE أو DELETE: اعمل SELECT بنفس الـ WHERE الأول
-- 💡 لو بوّظت البيانات: شغّل lesson03-setup.sql تاني وهترجع زي الأول
-- =============================================

USE Practice;
GO

-- 1. ضيف كتاب جديد:
--    Head First C# | Andrew Stellman | Programming | 2021 | 800 صفحة | 700 جنيه | 4 نسخ
INSERT INTO Books ( Title, Author, Genre, PublishYear, Pages, Price, AvailableCopies)
VALUES ('Head First C#', 'Andrew Stellman', 'Programming', 2021, 800, 700.00, 4);

-- 2. ضيف عضوين جداد في INSERT واحدة (اختار أي أسامي ومدن، وواحد منهم من غير إيميل)
SELECT * FROM Members;

INSERT INTO Members (FullName , Email , City , JoinDate) VALUES
('SHEKOS' , NULL, 'BNS', '2025-03-2'),
('SHEKOSLOLO' , 'hahalolxd@mail.com' , 'BNS2', '2025-04-3');

-- 3. سجّل استعارة: العضو رقم 1 استعار الكتاب رقم 4 النهارده
--    💡 تاريخ النهارده: CAST(GETDATE() AS DATE)
INSERT INTO Borrowings ( BookId , MemberId , BorrowDate , ReturnDate ) VALUES
(4 , 1 , CAST(GETDATE() AS DATE), NULL);


-- 4. المكتبة اشترت نسختين زيادة من الكتاب رقم 3 (زوّد AvailableCopies بـ 2)

UPDATE Books SET AvailableCopies = AvailableCopies + 2 WHERE Id = 3;

-- 5. الاستعارة رقم 2 الكتاب فيها رجع النهارده
UPDATE Borrowings SET ReturnDate = CAST(GETDATE() AS DATE) WHERE Id =2;

-- 6. زوّد سعر كل كتب البرمجة 10%
SELECT * FROM Books;
UPDATE Books SET Price =Price * 1.1 WHERE Genre = 'Programming';

-- 7. Omar Khaled عمل إيميل: omar@mail.com
SELECT * FROM Members;
UPDATE Members SET Email = 'omar@mail.com' WHERE FullName = 'Omar Khaled';	

-- 8. امسح واحد من العضوين اللي ضفتهم في سؤال 2
DELETE FROM Members Where id = 9;

-- 9. حاول تمسح الكتاب رقم 1 (Clean Code)
--    هيطلعلك خطأ. اكتب هنا في كومنت: ليه؟
-- لان الكتاب دا معمله استعاره


DELETE FROM Books Where id = 1;


-- ⭐ 10. جرّب الـ Transaction:
--    امسح كل الأعضاء من غير WHERE، اتأكد إنهم اتمسحوا بـ SELECT، وبعدين رجّعهم بـ ROLLBACK
--    💡 هيطلعلك خطأ بسبب الـ Foreign Key. فكّر ليه، وجرّب على جدول Borrowings بدل Members

