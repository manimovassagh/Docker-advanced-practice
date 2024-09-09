namespace ConsoleApp1.models
{
    public class Mani
    {

        public Course CourserGiver()
        {
            Course course = new(3, "I am doing well baby");
            return course;
        }


        public int sum(int first, int second)
        {
            return first + second;
        }

        public Dictionary<int, string> getSomeLists()
        {
            return new Dictionary<int, string>  {
                {1,"mani"},
                {2,"Sahar"},
                {3,"Mehdi"},
                {4,"Arash"},
            };
        }

    }
}