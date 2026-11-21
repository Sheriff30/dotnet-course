namespace Lesson05_CRUD
{
    public class Member
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public List<Borrowing> Borrowings { get; set; }
    }
}
