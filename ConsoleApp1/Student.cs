using System;

namespace ConsoleApp1
{
    public class Student
    {
        // Properties of the Student class
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }

        // Constructor to initialize the Student entity
        public Student(int id, string name, int age, string email, string address)
        {
            Id = id;
            Name = name;
            Age = age;
            Email = email;
            Address = address;
        }
    }

    }