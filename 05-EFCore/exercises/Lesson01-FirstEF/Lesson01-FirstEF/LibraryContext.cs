using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Lesson01_FirstEF
{
    // الـ DbContext = الاتصال بالـ Database
    public class LibraryContext : DbContext
    {
        // كل DbSet = جدول تقدر تستخدمه
        public DbSet<Book> Books { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            // الـ Connection String: عنوان الـ Database
            options.UseSqlServer(
                "Server=localhost;Database=Practice;Trusted_Connection=True;TrustServerCertificate=True;");

            // اطبع الـ SQL اللي EF Core بيكتبه (عشان تشوفه بعينك)
            options.LogTo(Console.WriteLine, new[] { DbLoggerCategory.Database.Command.Name }, LogLevel.Information);
        }
    }
}
