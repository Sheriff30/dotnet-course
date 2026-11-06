# المرحلة 01: أساسيات C#

## الدروس
- [ ] الدرس 1: المتغيرات والأنواع
- [ ] الدرس 2: العمليات الحسابية والمنطقية
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
