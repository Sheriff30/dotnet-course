namespace Lesson03_Migrations
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using var db = new LibraryContext();

            // اتأكد إن الجدول موجود
            Console.WriteLine($"Books in database: {db.Books.Count()}");
        }
    }
}
