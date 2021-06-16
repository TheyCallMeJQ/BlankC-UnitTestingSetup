using System;
using Xunit;
using PrimeService;

namespace PrimeService.Tests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            string testString = "Hello!";
            Dog d = new Dog(testString);
            Assert.Equal(expected: testString, actual: d.Name);
        }
    }
}
