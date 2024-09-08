using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("mani")]
public class HelloWorldController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        var response = new 
        {
            Name = "🌟 Mani Developer 🌟",
            Age = 30,
            Message = "Welcome to the 🌍 Hello World API! 🚀"
        };
        return Ok(response);
    }
}
