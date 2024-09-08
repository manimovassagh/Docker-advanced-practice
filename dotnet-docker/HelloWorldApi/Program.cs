using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Configure the HTTP request pipeline.
app.MapGet("/", () => new { Name = "John Doe", Age = 30 });

app.Run();
