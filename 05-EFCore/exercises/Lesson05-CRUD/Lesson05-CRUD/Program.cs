namespace Lesson05_CRUD
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using var db = new LibraryContext();

            // ✍️ حل كل سؤال، وبعد ما يشتغل علّق عليه (//) عشان ميتنفذش تاني

            // 1. Create

            //  var sherif = new Member
            //  {
            //      FullName = "Sherif Fouad"
            //  };

            //   var tarek = new Member
            //  {
            //      FullName = "Tarek Fouad"
            //   };

            //  db.Members.AddRange(
            //    sherif,
            //    tarek
            //  );

            //     var category = new Category
            //   {
            //         Name = "Novel "
            //   };

            //    db.Categories.AddRange(
            //    category
            //  );

            // 2. Read
            // var books = db.Books.OrderBy(b => b.Price).ToList();
            //   foreach (var b in books)
            //  {

            //    Console.WriteLine($"{b.Title} - {b.Price}");

            //   }

            //   Console.WriteLine(db.Books.Any(b => b.Title == "1984"));

            // 3. Update
            //   var firstBook = db.Books.Find(4);

            //    if (firstBook != null)
            //  {
            //    firstBook.Price *= 1.10m;
            //
            //   }
            //    else
            //   {
            // Console.WriteLine("No Book");
            //    }



            // 4. الاستعارة

            db.Borrowings.Add(new Borrowing
            {
                BorrowDate = DateTime.Now,
                BookId = 4,
                MemberId = 1

            });
            //   db.Borrowings.Find(1).ReturnDate = DateTime.Now;


            // 5. Delete

            //  var mem = db.Members.Find(2);

            // if (mem != null)
            //   {

            // db.Members.Remove(mem);
            //  }
            //   else
            //  {
            //  Console.WriteLine("Member not found");

            //    }


            db.Members.Remove(db.Members.Find(1));

            db.SaveChanges();


            //  Console.WriteLine(tarek.Id);
            //  Console.WriteLine(sherif.Id);

        }
    }
}
