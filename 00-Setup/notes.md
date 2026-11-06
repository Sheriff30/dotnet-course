# المرحلة 00: التجهيز

## الدروس
- [x] الدرس 1: يعني إيه .NET و C#
- [x] الدرس 2: التسطيب
- [x] الدرس 3: أول برنامج
- [ ] الدرس 4: Git و GitHub

---

## الدرس 1: يعني إيه .NET و C#
- **C#:** لغة البرمجة، يعني الكلام اللي بتكتبه.
- **.NET:** المنصة اللي بتشغّل الكود، وفيها مكتبات وأدوات جاهزة.
- **.NET Framework:** النسخة القديمة (Windows بس). مش هنستخدمها.
- **.NET Core:** النسخة الجديدة، بتشتغل على Windows و Mac و Linux.
- **.NET 5 وما بعدها:** هي نفسها .NET Core بعد ما اتشالت كلمة Core.

## الدرس 2: التسطيب
1. .NET SDK (أحدث نسخة LTS) من dotnet.microsoft.com
2. Visual Studio Community (مجاني، على Windows). وإنت بتسطّبه اختار "ASP.NET and web development".
   أو VS Code + إضافة C# Dev Kit لو بتحب محرر أخف.
3. التأكد:
```bash
dotnet --version
```

## الدرس 3: أول برنامج
```bash
dotnet new console -n HelloWorld
cd HelloWorld
dotnet run
```
- `dotnet new console`: يعمل مشروع Console جديد
- `-n`: اسم المشروع
- `dotnet run`: يشغّل البرنامج

```csharp
Console.WriteLine("Hello, World!"); // اطبع السطر ده على الشاشة
```

## ✍️ التمرين
1. اعمل مشروع HelloWorld جوه فولدر `exercises` وشغّله.
2. خلّيه يطبع 3 سطور: اسمك، سنّك، وليه عايز تتعلم .NET.
3. ابعت الكود لـ Claude يراجعه.

## 📝 ملاحظاتي
(اكتب هنا أي حاجة عايز تفتكرها)
