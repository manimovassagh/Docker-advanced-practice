
namespace ConsoleApp1
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Company { get; set; }

        // Constructor to initialize the Student entity
        public Student(int id, string name, int age, string email, string address,string company)
        {
            Id = id;
            Name = name;
            Age = age;
            Email = email;
            Address = address;
            Company = company;
        }
    }

    }