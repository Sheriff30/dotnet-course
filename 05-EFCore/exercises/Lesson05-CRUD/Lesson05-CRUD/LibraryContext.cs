using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Lesson05_CRUD
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
            // نفس الـ Database بتاعة الدرس 4 (الجداول موجودة خلاص، فمش محتاجين Migrations)
            options.UseSqlServer(
                "Server=localhost;Database=Library04Db;Trusted_Connection=True;TrustServerCertificate=True;");

            // اطبع الـ SQL عشان تشوف INSERT و UPDATE و DELETE بعينك
            options.LogTo(Console.WriteLine, new[] { DbLoggerCategory.Database.Command.Name }, LogLevel.Information);
        }
    }
}
