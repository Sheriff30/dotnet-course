using Microsoft.EntityFrameworkCore;

namespace Lesson04_Relationships
{
    public class LibraryContext : DbContext
    {
        public DbSet<Book> Books { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<Borrowing> Borrowings { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            // Database جديدة للدرس ده
            options.UseSqlServer(
                "Server=localhost;Database=Library04Db;Trusted_Connection=True;TrustServerCertificate=True;");
        }
    }
}
