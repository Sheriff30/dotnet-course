namespace Lesson01_Variables
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter your name: ");
            string name = Console.ReadLine();
            Console.Write("Enter your birth year: ");
            int age = DateTime.Now.Year - int.Parse(Console.ReadLine());
            Console.Write("Enter your height: ");
            double height = double.Parse(Console.ReadLine());
            Console.Write("Are you Student? ");
            bool isStudent = bool.Parse(Console.ReadLine());

            Console.WriteLine("===== ID Card =====");
            Console.WriteLine($"Name: {name}");
            Console.WriteLine($"Age: {age}");
            Console.WriteLine($"Height: {height} m");
            Console.WriteLine($"Student: {isStudent}");
            Console.WriteLine("===================");

        }
    }
}
