namespace sample_maker
{











    public class Course
    {
        public int Id { get; set; }
        public required string Title { get; set; }
        public required string Description { get; set; }
        public int Duration { get; set; }
        public required string Level { get; set; }
        public required string Category { get; set; }
        public required string Language { get; set; }
        public required string Tags { get; set; }
        public required string ImageUrl { get; set; }
        public bool IsAdvanced { get; set; }



        public static Course AdvancedCourse => new Course
        {
            Id = 1,
            Title = "Advanced .NET Core",
            Description = "Learn how to build highly scalable and maintainable .NET Core applications.",
            Duration = 4,
            Level = "Advanced",
            Category = ".NET Core",
            Language = "C#",
            Tags = "C#, .NET Core, Advanced",
            ImageUrl = "https://i.imgur.com/7UjZuJZ.png",
            IsAdvanced = true
        };
    }
}
