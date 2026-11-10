# المرحلة 04: SQL

## الدروس
- [x] الدرس 1: يعني إيه Database
- [x] الدرس 2: تسطيب SQL Server و SSMS
- [x] الدرس 3: SELECT و WHERE و ORDER BY
- [x] الدرس 4: INSERT و UPDATE و DELETE
- [x] الدرس 5: JOINs
- [x] الدرس 6: GROUP BY والـ Aggregate functions
- [ ] الدرس 7: Keys و Normalization
- [ ] الدرس 8: Indexes و Stored Procedures و Views

## 🛠 مشروع المرحلة
تصميم قاعدة بيانات متجر إلكتروني

---

## الدرس 1: يعني إيه Database
- **Database:** مكان منظّم بنحفظ فيه البيانات بشكل دائم.
- **DBMS:** البرنامج اللي بيدير الـ Database (زي SQL Server و PostgreSQL و MySQL).
- **Relational Database:** البيانات متقسمة **جداول** (Tables)، والجداول مربوطة ببعض.
  - **Column (عمود):** نوع معلومة (Name, Price).
  - **Row (صف):** سجل واحد (منتج واحد).
  - **Primary Key:** عمود قيمته مش بتتكرر، بيميّز كل صف (Id).
  - **Foreign Key:** عمود بيشاور على Primary Key في جدول تاني (ده الربط).
- **SQL:** اللغة اللي بنكلم بيها الـ Database.
- **SQL vs NoSQL:** الـ SQL جداول وعلاقات ثابتة، والـ NoSQL (زي MongoDB) مستندات مرنة شبه JSON.

## الدرس 2: التسطيب
1. **SQL Server Developer Edition** (مجاني) من موقع Microsoft.
2. **SSMS** (SQL Server Management Studio).
3. اتصل بـ `localhost` (أو `.`) بـ **Windows Authentication**، وعلّم على **Trust server certificate**.

```sql
SELECT @@VERSION;            -- نسخة SQL Server
CREATE DATABASE Practice;    -- اعمل Database جديدة
```
- شغّل الكود بـ **F5** أو **Execute**.
- لو حددت جزء من الكود، هيتنفذ الجزء ده بس.

## الدرس 3: SELECT و WHERE و ORDER BY
```sql
SELECT * FROM Books;                       -- كل الأعمدة
SELECT Title, Price FROM Books;            -- أعمدة معينة
SELECT Title AS BookName FROM Books;       -- اسم مستعار
SELECT DISTINCT Genre FROM Books;          -- من غير تكرار
SELECT TOP 5 * FROM Books;                 -- أول 5
SELECT Title, Price * 0.9 AS NewPrice FROM Books;  -- عمود محسوب
```

### WHERE
| العملية | المعنى |
|---|---|
| `=` و `<>` | يساوي، لا يساوي |
| `>` `<` `>=` `<=` | مقارنة |
| `AND` `OR` `NOT` | منطق |
| `BETWEEN 10 AND 20` | من 10 لـ 20 (شاملة) |
| `IN ('Cairo', 'Giza')` | واحدة من القيم دي |
| `LIKE 'C%'` | بيبدأ بـ C (`%` أي عدد حروف، `_` حرف واحد) |
| `IS NULL` / `IS NOT NULL` | فاضي / مش فاضي (متستخدمش `= NULL`) |

- النصوص بين `' '` مش `" "`.

### ORDER BY
```sql
SELECT * FROM Books ORDER BY Price DESC;          -- تنازلي
SELECT * FROM Books ORDER BY Genre, Price DESC;   -- بأكتر من عمود
```

### ترتيب الكتابة
`SELECT` ← `FROM` ← `WHERE` ← `ORDER BY`

## الدرس 4: INSERT و UPDATE و DELETE
### INSERT: إضافة
```sql
INSERT INTO Books (Title, Author, Genre, PublishYear, Pages, Price, AvailableCopies)
VALUES ('Clean Code', 'Robert Martin', 'Programming', 2008, 464, 850, 3);

-- أكتر من صف مرة واحدة
INSERT INTO Members (FullName, City, JoinDate) VALUES
('Ali', 'Cairo', '2026-11-08'),
('Mai', 'Giza',  '2026-11-08');
```
- متكتبش الـ `Id`: الـ `IDENTITY` بيعمله لوحده.
- الأعمدة اللي `NULL` مسموح بيها ممكن تسيبها.

### UPDATE: تعديل
```sql
UPDATE Books
SET Price = 900, AvailableCopies = AvailableCopies + 1
WHERE Id = 1;
```

### DELETE: مسح
```sql
DELETE FROM Members WHERE Id = 9;
```

### ⚠️ أخطر غلطة
`UPDATE` أو `DELETE` **من غير WHERE** = بيتنفذ على **كل الجدول**.
✅ اعمل `SELECT` بنفس الـ `WHERE` الأول، واتأكد من النتيجة.

### Foreign Key بيحميك
مينفعش تمسح كتاب ليه استعارات، لأن الاستعارات هتبقى بتشاور على حاجة مش موجودة.

### Transaction: شبكة أمان
```sql
BEGIN TRANSACTION;
DELETE FROM Borrowings;
SELECT * FROM Borrowings;   -- فاضي
ROLLBACK;                   -- رجّع كل حاجة
-- COMMIT;                  -- أو ثبّت التغيير
```

### تواريخ
- `GETDATE()`: التاريخ والوقت دلوقتي
- `CAST(GETDATE() AS DATE)`: التاريخ بس

## الدرس 5: JOINs
### INNER JOIN: الصفوف اللي ليها مقابل في الجدولين بس
```sql
SELECT m.FullName, b.BorrowDate
FROM Borrowings b
INNER JOIN Members m ON b.MemberId = m.Id;
```
- `ON`: شرط الربط، غالباً Foreign Key = Primary Key.
- `b` و `m`: Aliases (أسامي مختصرة للجداول).
- لو العمود موجود في الجدولين (زي `Id`)، لازم تكتب الجدول قبله: `m.Id`.

### 3 جداول
```sql
SELECT m.FullName, bk.Title, br.BorrowDate
FROM Borrowings br
JOIN Members m ON br.MemberId = m.Id
JOIN Books bk  ON br.BookId = bk.Id;
```
(`JOIN` لوحدها = `INNER JOIN`)

### LEFT JOIN: كل صفوف الجدول الشمال، حتى لو ملهاش مقابل
```sql
SELECT m.FullName, br.BorrowDate
FROM Members m
LEFT JOIN Borrowings br ON br.MemberId = m.Id;
-- اللي ملوش استعارات: BorrowDate = NULL
```

### اللي ملوش مقابل خالص
```sql
SELECT m.FullName
FROM Members m
LEFT JOIN Borrowings br ON br.MemberId = m.Id
WHERE br.Id IS NULL;
```

| النوع | بيرجّع |
|---|---|
| `INNER JOIN` | اللي ليه مقابل في الاتنين |
| `LEFT JOIN` | كل الشمال + المقابل لو موجود |
| `RIGHT JOIN` | كل اليمين + المقابل (نادراً بنستخدمها) |
| `FULL JOIN` | كل حاجة من الاتنين |

## الدرس 6: GROUP BY والـ Aggregate functions
### Aggregate functions: بتحوّل صفوف كتير لقيمة واحدة
| الدالة | بترجّع |
|---|---|
| `COUNT(*)` | عدد الصفوف |
| `COUNT(Email)` | عدد الصفوف اللي العمود فيها مش NULL |
| `SUM(Price)` | المجموع |
| `AVG(Price)` | المتوسط |
| `MIN(Price)` / `MAX(Price)` | الأصغر / الأكبر |

### GROUP BY: احسب لكل مجموعة لوحدها
```sql
SELECT Genre, COUNT(*) AS BooksCount, AVG(Price) AS AvgPrice
FROM Books
GROUP BY Genre;
```
⚠️ أي عمود في `SELECT` مش جوه دالة، **لازم** يبقى في `GROUP BY`.

### HAVING: فلترة بعد التجميع
```sql
SELECT Genre, COUNT(*) AS BooksCount
FROM Books
GROUP BY Genre
HAVING COUNT(*) > 2;
```
- `WHERE`: بتفلتر **الصفوف** قبل التجميع.
- `HAVING`: بتفلتر **المجموعات** بعد التجميع.

### ترتيب التنفيذ
`FROM` ← `JOIN` ← `WHERE` ← `GROUP BY` ← `HAVING` ← `SELECT` ← `ORDER BY`
