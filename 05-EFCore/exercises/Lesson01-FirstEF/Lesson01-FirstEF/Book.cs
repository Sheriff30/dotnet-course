namespace Lesson01_FirstEF
{
    // كل Class = جدول، وكل Property = عمود
    // الـ Class ده بيمثل جدول Books اللي عملناه في درس SQL
    public class Book
    {
        public int Id { get; set; }               // Id اسمه Id ← EF Core بيعرف لوحده إنه Primary Key
        public string Title { get; set; }
        public string Author { get; set; }
        public string Genre { get; set; }
        public int PublishYear { get; set; }
        public int Pages { get; set; }
        public decimal Price { get; set; }
        public int AvailableCopies { get; set; }
    }
}
