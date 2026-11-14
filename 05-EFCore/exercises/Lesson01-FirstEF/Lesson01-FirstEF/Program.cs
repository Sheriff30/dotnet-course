namespace Lesson01_FirstEF
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using var db = new LibraryContext();

            // مثال: هات كل الكتب
            // SQL: SELECT * FROM Books
            var books = db.Books.ToList();

            //  foreach (var book in books)
            //  {
            // Console.WriteLine($"{book.Title} - {book.Price}");
            //  }

            // ✍️ التمرين: اكتب كل سؤال تحت، واطبع النتيجة

            // 1. هات الكتب اللي نوعها Programming
            //    SQL: SELECT * FROM Books WHERE Genre = 'Programming'

            //  var programmingBooks = db.Books.Where(b => b.Genre == "Programming").ToList();
            //     foreach (var b in programmingBooks)
            //   {
            // Console.WriteLine($"{b.Title} - {b.Genre}");

            //    }

            // 2. هات الكتب اللي سعرها أكبر من 400، مترتبة من الأغلى للأرخص
            //    SQL: SELECT * FROM Books WHERE Price > 400 ORDER BY Price DESC

            //   var moreThanFourHundred = db.Books.Where(b => b.Price > 400).OrderByDescending(b => b.Price);


            //   foreach (var b in moreThanFourHundred)
            // {
            //   Console.WriteLine($"{b.Title} - {b.Price}");
            // }


            // 3. هات أغلى 3 كتب
            //    SQL: SELECT TOP 3 * FROM Books ORDER BY Price DESC

            //   var topThree = db.Books.OrderByDescending(b => b.Price).Take(3);

            //    foreach (var b in topThree)
            //   {
            //   Console.WriteLine($"{b.Title} - {b.Price}");
            //   }
            // 4. هات عدد الكتب، ومتوسط السعر
            //    SQL: SELECT COUNT(*), AVG(Price) FROM Books
            //    var count = db.Books.Count();
            //     var avgPrice = db.Books.Average(b => b.Price);
            //   Console.WriteLine($"Count: {count} Average-Price: {avgPrice}");

            // 5. هات كتاب واحد بالـ Id بتاعه (مثلاً 1)، واطبع عنوانه
            //    SQL: SELECT TOP 1 * FROM Books WHERE Id = 1
            var firstBook = db.Books.Where(b => b.Id == 1).ToList();
            foreach (var item in firstBook)
            {
                Console.WriteLine(item.Title);
            }
        }
    }
}
