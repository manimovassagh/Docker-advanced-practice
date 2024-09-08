
using ConsoleApp1;
using ConsoleApp1.models;

Student student = new Student(1, "Mani Mova", 20, "mani@example.com", "123 Main St","foo");
Student student2 = new Student(2, "Sahar", 22, "mani@example.com", "123 Main St","foo-company");
Course course = new Course(1, "Learning dotnet c#");

string t =course.GetSampleCourse();
Console.WriteLine(student.Name);
Console.WriteLine(student2.Name);
Console.WriteLine(Mani.changer());
