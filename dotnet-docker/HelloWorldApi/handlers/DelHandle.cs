// File: TweetHandler.cs
using Microsoft.AspNetCore.Http;








public class DelHandler
{
    public static IResult DelHandleInit()
    {
       var t = new { Name = "Nice Done  it worksPractice makes perfect 😄🚀", Age = 45 };
    
       return Results.Ok(t);
    }

}