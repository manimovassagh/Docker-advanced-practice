using ConsoleApp1;
using ConsoleApp1.models;
using System.Text.Json;

Student student = new Student(1, "Mani Mova", 20, "mani@example.com", "123 Main St", "foo");
Student student2 = new Student(2, "Sahar", 22, "mani@example.com", "123 Main St", "foo-company");
Course course = new Course(1, "Learning dotnet c#");
Mani mani = new();
string t = course.GetSampleCourse();
Dictionary<int,string> lists = mani.getSomeLists();
string student2Json = JsonSerializer.Serialize(student2, new JsonSerializerOptions { WriteIndented = true });
string res= JsonSerializer.Serialize(lists, new JsonSerializerOptions { WriteIndented = true });
Console.WriteLine(res);


