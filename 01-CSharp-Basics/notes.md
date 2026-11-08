# المرحلة 01: أساسيات C#

## الدروس
- [x] الدرس 1: المتغيرات والأنواع
- [x] الدرس 2: العمليات الحسابية والمنطقية
- [x] الدرس 3: الشروط (if/else و switch)
- [x] الدرس 4: الـ Loops
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

## الدرس 4: الـ Loops
### for: لما تعرف هتكرر كام مرة
```csharp
for (int i = 1; i <= 5; i++)
{
    Console.WriteLine(i);   // 1 2 3 4 5
}
// البداية ; الشرط ; الخطوة
```

### while: طول ما الشرط صح (ممكن متتنفذش ولا مرة)
```csharp
int count = 0;
while (count < 3)
{
    count++;
}
```

### do-while: بتتنفذ مرة على الأقل، وبعدين تشيّك
```csharp
int score;
do
{
    Console.Write("Enter score (0-100): ");
    score = int.Parse(Console.ReadLine());
} while (score < 0 || score > 100);
```

### foreach: لكل عنصر في مجموعة
```csharp
foreach (char c in "Sherif")
{
    Console.WriteLine(c);
}
```

### break و continue
- `break`: اخرج من الـ loop خالص
- `continue`: سيب اللفة دي وروح للي بعدها

### Nested loops
```csharp
for (int row = 1; row <= 3; row++)
{
    for (int col = 1; col <= row; col++)
    {
        Console.Write("*");
    }
    Console.WriteLine();
}
```

⚠️ Infinite loop: لو الشرط عمره ما بقى false، البرنامج هيفضل شغال للأبد. اتأكد إن في حاجة بتتغير جوه الـ loop.

### رقم عشوائي
```csharp
int secret = Random.Shared.Next(1, 101);   // من 1 لـ 100
```

#### الفرق عن JavaScript
| JavaScript | C# |
|---|---|
| `for (let i = 0; ...)` | `for (int i = 0; ...)` |
| `for (const x of arr)` | `foreach (var x in arr)` |
| `for (const key in obj)` | مفيش، بنلف على `dict.Keys` |
| `arr.forEach(x => ...)` | `list.ForEach(x => ...)` (للـ List بس) |

## الدرس 5: الـ Methods
```csharp
static int Add(int a, int b)
{
    return a + b;
}
// static + نوع اللي بترجعه + الاسم + (البارامترز بأنواعها)
```
- `void`: مش بترجع حاجة.
- الأسامي PascalCase: `CalculateTotal` مش `calculateTotal`.
- جوه `Program` لازم `static` عشان تتنادى من `Main`.

### Expression-bodied
```csharp
static bool IsEven(int n) => n % 2 == 0;
```

### Default و Named parameters
```csharp
static void PrintLine(char symbol = '=', int length = 20) { ... }
PrintLine();                 // ====================
PrintLine('-', 10);
PrintLine(length: 5);        // =====
```

### Overloading: نفس الاسم، بارامترز مختلفة
```csharp
static int Add(int a, int b) => a + b;
static double Add(double a, double b) => a + b;
static int Add(int a, int b, int c) => a + b + c;
```

### out و TryParse
```csharp
if (int.TryParse(input, out int number))
{
    // التحويل نجح، و number فيه القيمة
}
else
{
    // المستخدم كتب حاجة مش رقم - مفيش crash
}
```

### ref: تعديل المتغير الأصلي
```csharp
static void Double(ref int x) => x *= 2;
int n = 5;
Double(ref n);   // n = 10
```

#### الفرق عن JavaScript
| JavaScript | C# |
|---|---|
| `function add(a, b)` | `static int Add(int a, int b)` |
| `const f = (a) => a * 2` | `static int F(int a) => a * 2;` |
| مفيش Overloading | في Overloading |
| مفيش ref/out | في ref و out |
| `camelCase` | `PascalCase` |
