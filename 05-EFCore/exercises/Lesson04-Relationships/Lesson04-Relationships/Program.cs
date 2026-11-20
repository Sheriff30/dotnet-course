namespace Lesson04_Relationships
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using var db = new LibraryContext();

            // ✍️ سؤال 5 هنا
            //                 name: "IX_Books_CategoryId",

            //                name: "FK_Books_Categories_CategoryId",

            var category = new Category
            {
                Name = "Programming",
                Books = new List<Book>
                {
                    new Book {Title = "Clean Code" , Price = 850},                    new Book {Title = "Clean Code" , Price = 850},
                    new Book {Title = "Refactoring" , Price = 900},

                }
            };

            db.Categories.Add(category);
            db.SaveChanges();

        }
    }
}
