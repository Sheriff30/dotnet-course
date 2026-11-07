namespace Lesson03_Conditions
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.Write("Enter your name: ");
            string name = Console.ReadLine();
            Console.Write("Enter your score: ");
            int score = int.Parse(Console.ReadLine());
            Console.Write("Enter day number: ");
            int day = int.Parse(Console.ReadLine());

            if (score < 0 || score > 100)
            {
                Console.WriteLine("Invalid score!");
                return;
            }
            string dayName = day switch
            {
                1 => "Saturday",
                2 => "Sunday",
                3 => "Monday",
                4 => "Tuesday",
                5 => "Wednesday",
                6 => "Thursday",
                7 => "Friday",
                _ => "Invalid day",
            };






            string grade;

            if (score >= 90 && score <= 100)
            {
                grade = "A - Excellent";
            }
            else if (score >= 80 && score <= 89)
            {
                grade = "B - Very Good";
            }
            else if (score >= 70 && score <= 79)
            {
                grade = "C - Good";
            }
            else if (score >= 50 && score <= 69)
            {
                grade = "D - Pass";
            }
            else if (score >= 0 && score < 50)
            {
                grade = "F - Fail";
            }
            else
            {
                grade = "Invalid Score! Please enter a score between 0 and 100.";
            }

            string status = score >= 50 ? "Passed" : "Failed";



            Console.WriteLine("===== Student Report =====");
            Console.WriteLine($"Name: {name}");
            Console.WriteLine($"Score: {score}");
            Console.WriteLine($"Grade: {grade}");
            Console.WriteLine($"Status: {status}");
            Console.WriteLine($"Day: {dayName}");
            if (dayName == "Friday") Console.WriteLine("Enjoy your weekend!");
            Console.WriteLine("==========================");
        }
    }
}
