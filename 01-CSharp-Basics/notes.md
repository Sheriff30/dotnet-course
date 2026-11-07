# المرحلة 01: أساسيات C#

## الدروس
- [x] الدرس 1: المتغيرات والأنواع
- [x] الدرس 2: العمليات الحسابية والمنطقية
- [ ] الدرس 3: الشروط (if/else و switch)
- [ ] الدرس 4: الـ Loops
- [ ] الدرس 5: الـ Methods
- [ ] الدرس 6: Arrays و Lists و Dictionaries
- [ ] الدرس 7: التعامل مع النصوص
- [ ] الدرس 8: الـ Debugging

## 🛠 مشروع المرحلة
آلة حاسبة + To-Do List (Console)

---

## الدرس 1: المتغيرات والأنواع
المتغير = صندوق ليه **اسم** و**نوع**، وبنحط فيه **قيمة**.

```csharp
int age = 25;              // أرقام صحيحة
double height = 1.75;      // أرقام عشرية
decimal price = 99.99m;    // فلوس (أدق) - لازم m في الآخر
bool isStudent = true;     // true أو false
char grade = 'A';          // حرف واحد - علامة ' '
string name = "Sherif";    // نص - علامة " "
var city = "Cairo";        // var: الكومبايلر يستنتج النوع (string هنا)
const double Pi = 3.14;    // const: قيمة ثابتة متتغيرش
```

- **التسمية:** camelCase للمتغيرات (`firstName`)، متبدأش برقم، وسمّي اسم واضح.
- **String interpolation:** `Console.WriteLine($"My name is {name}");`
- **القراءة من المستخدم:**
```csharp
string input = Console.ReadLine();   // بيرجّع string دايماً
int year = int.Parse(input);         // تحويل لـ int
```

## الدرس 2: العمليات الحسابية والمنطقية
### حسابية
`+` `-` `*` `/` `%` (باقي القسمة)

⚠️ `int / int` = int: `7 / 2` = `3` مش 3.5
✅ الحل: `7.0 / 2` أو `(double)a / b`

```csharp
x++;      // x = x + 1
x += 5;   // x = x + 5   (وكمان -= *= /=)
Math.Pow(2, 3);       // 8
Math.Sqrt(16);        // 4
Math.Round(3.456, 2); // 3.46
```

### مقارنة (النتيجة bool)
`==` `!=` `>` `<` `>=` `<=`
⚠️ `=` تخصيص قيمة، `==` مقارنة

### منطقية
- `&&` AND: الاتنين لازم true
- `||` OR: واحد بس يكفي
- `!` NOT: يعكس

```csharp
bool canDrive = age >= 18 && hasLicense;
bool isEven = number % 2 == 0;
```

### الأولوية
`()` ← `* / %` ← `+ -` ← مقارنة ← `&&` ← `||`

## الدرس 3: الشروط
```csharp
if (score >= 90)
{
    Console.WriteLine("A");
}
else if (score >= 80)
{
    Console.WriteLine("B");
}
else
{
    Console.WriteLine("F");
}
```
- الشروط بتتراجع **بالترتيب**، وأول واحد يتحقق بيتنفذ والباقي بيتساب.
- استخدم `{ }` دايماً، حتى لو سطر واحد.

### Ternary: if صغيرة في سطر
```csharp
string result = score >= 50 ? "Pass" : "Fail";
```

### switch
```csharp
switch (day)
{
    case 1:
        Console.WriteLine("Saturday");
        break;
    case 6:
    case 7:
        Console.WriteLine("Weekend");
        break;
    default:
        Console.WriteLine("Invalid");
        break;
}
```

### switch expression (الطريقة الحديثة)
```csharp
string name = day switch
{
    1 => "Saturday",
    2 => "Sunday",
    _ => "Invalid"      // _ = أي حاجة تانية
};

string grade = score switch
{
    >= 90 => "A",
    >= 80 => "B",
    _ => "F"
};
```
