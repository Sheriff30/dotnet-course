# المرحلة 05: Entity Framework Core

## الدروس
- [ ] الدرس 1: يعني إيه ORM
- [ ] الدرس 2: DbContext و Entities
- [ ] الدرس 3: Code-First و Migrations
- [ ] الدرس 4: العلاقات
- [ ] الدرس 5: CRUD
- [ ] الدرس 6: Loading strategies
- [ ] الدرس 7: Fluent API و Data Annotations
- [ ] الدرس 8: تحسين الأداء

## 🛠 مشروع المرحلة
ربط مشروع المكتبة بـ SQL Server

---

## الدرس 1: يعني إيه ORM
**ORM (Object-Relational Mapper):** بيترجم بين الـ **Objects** في C# والـ **جداول** في SQL.

| SQL | C# |
|---|---|
| جدول | Class |
| عمود | Property |
| صف | Object |
| `SELECT` و `WHERE` | LINQ |

- **EF Core:** ORM كامل. بيكتب الـ SQL بدالك، وبيعمل الجداول، وبيتابع التغييرات. الأشهر في .NET.
- **Dapper:** "Micro ORM". إنت بتكتب الـ SQL، وهو بيحوّل النتيجة لـ Objects بس. أسرع وأبسط.

## الدرس 2: DbContext و Entities
- **Entity:** Class بيمثل جدول (`Book`).
- **DbContext:** الاتصال بالـ Database (`LibraryContext`).
- **DbSet<Book>:** الجدول اللي هتعمل عليه queries.

```csharp
using var db = new LibraryContext();
var books = db.Books.ToList();
```
- `using`: بيقفل الاتصال لما تخلص.

### LINQ ↔ SQL
| SQL | LINQ |
|---|---|
| `WHERE Price > 400` | `.Where(b => b.Price > 400)` |
| `ORDER BY Price` | `.OrderBy(b => b.Price)` |
| `ORDER BY Price DESC` | `.OrderByDescending(b => b.Price)` |
| `TOP 3` | `.Take(3)` |
| `SELECT Title` | `.Select(b => b.Title)` |
| `COUNT(*)` | `.Count()` |
| `AVG(Price)` | `.Average(b => b.Price)` |
| `WHERE Id = 1` (صف واحد) | `.Find(1)` أو `.FirstOrDefault(b => b.Id == 1)` |

⚠️ مفيش حاجة بتتبعت للـ Database غير لما تكتب `ToList()` أو `Count()` أو `First()`... قبلها ده مجرد "وصف" للـ query.
