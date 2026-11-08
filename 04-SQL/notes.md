# المرحلة 04: SQL

## الدروس
- [x] الدرس 1: يعني إيه Database
- [x] الدرس 2: تسطيب SQL Server و SSMS
- [ ] الدرس 3: SELECT و WHERE و ORDER BY
- [ ] الدرس 4: INSERT و UPDATE و DELETE
- [ ] الدرس 5: JOINs
- [ ] الدرس 6: GROUP BY والـ Aggregate functions
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
