
using ConsoleApp1;
using ConsoleApp1.models;

Student student = new Student(1, "Mani Mova", 20, "mani@example.com", "123 Main St","foo");
Student student2 = new Student(2, "Sahar", 22, "mani@example.com", "123 Main St","foo-company");
Course course = new Course(1, "Learning dotnet c#");
Mani mani = new();
int res = mani.sum(4,12);
string t =course.GetSampleCourse();
Console.WriteLine(mani.CourserGiver().Name);
Console.WriteLine(res);

