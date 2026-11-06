namespace Lesson02_Operators
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the frist number: ");
            int fristNumber = int.Parse(Console.ReadLine());
            Console.Write("Enter the second number: ");
            int secondNumber = int.Parse(Console.ReadLine());

            if (secondNumber == 0)
            {
                Console.WriteLine("Please don't enter Zero (0)");
                return;
            }
            Console.WriteLine("===== Results =====");
            Console.WriteLine($"{fristNumber} + {secondNumber} = {fristNumber + secondNumber}");
            Console.WriteLine($"{fristNumber} - {secondNumber} = {fristNumber - secondNumber}");
            Console.WriteLine($"{fristNumber} * {secondNumber} = {fristNumber * secondNumber}");
            Console.WriteLine($"{fristNumber} / {secondNumber} = {Math.Round((double)fristNumber / (double)secondNumber, 2)}");
            Console.WriteLine($"{fristNumber} % {secondNumber} = {fristNumber % secondNumber}");
            Console.WriteLine($"{fristNumber} ^ {secondNumber} = {Math.Pow(fristNumber, secondNumber)}");
            Console.WriteLine("-------------------");
            Console.WriteLine($"First number is even: {fristNumber % 2 == 0}");
            Console.WriteLine($"Both numbers are positive: {fristNumber > 0 && secondNumber > 0}");
            Console.WriteLine($"At least one is greater than 100: {fristNumber > 100 || secondNumber > 100}");


        }
    }
}
