using System;

namespace PrimeService
{
    public class Dog
    {
        public string Name;

        public Dog(string Name)
        {
            this.Name = Name;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Dog d = new Dog("Albert");
        }
    }
}
