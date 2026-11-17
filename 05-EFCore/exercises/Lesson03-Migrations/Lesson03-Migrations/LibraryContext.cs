using Microsoft.EntityFrameworkCore;

namespace Lesson03_Migrations
{
    public class LibraryContext : DbContext
    {
        public DbSet<Book> Books { get; set; }
        public DbSet<Member> Members { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            // ⚠️ Database جديدة اسمها LibraryDb (مش Practice)
            // EF Core هو اللي هيعملها
            options.UseSqlServer(
                "Server=localhost;Database=LibraryDb;Trusted_Connection=True;TrustServerCertificate=True;");
        }
    }
}
