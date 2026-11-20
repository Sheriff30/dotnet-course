namespace Lesson04_Relationships
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }

        public int CategoryId { get; set; }
        public Category Category { get; set; }
        public List<Borrowing> Borrowings { get; set; }

        public List<Tag> Tags { get; set; }

    }
}
