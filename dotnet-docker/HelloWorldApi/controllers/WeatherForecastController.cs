using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("[controller]")]
public class HelloWorldController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        var response = new 
        {
            Name = "John Doe",
            Age = 30
        };
        return Ok(response);
    }
}
