
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddControllers(); // Register the controllers





var app = builder.Build();

// Configure the HTTP request pipeline.
app.MapGet("/", () => new { Name = "Practice makes perfect 😄🚀", Age = 30 });


app.MapGet("/del", DelHandler.DelHandleInit);

// Map controller routes
app.MapControllers(); // Enable attribute routing, so your controllers can be accessed

app.Run();
