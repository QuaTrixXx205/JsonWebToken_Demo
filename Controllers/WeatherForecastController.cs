// using Microsoft.AspNetCore.Mvc;

// namespace JWT_Demo.Controllers
// {
//     [ApiController]
//     [Route("[controller]")]
//     public class WeatherForecastController : ControllerBase
//     {
//         private static readonly string[] Summaries = new[]
//         {
//             "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
//         };

//         [HttpGet("GetWeather")]
//         public IEnumerable<WeatherForecast> Get()
//         {
//             return Enumerable.Range(1, 5).Select(index => new WeatherForecast
//             {
//                 Date = DateTime.Now.AddDays(index),
//                 TemperatureC = Random.Shared.Next(-20, 55),
//                 Summary = Summaries[Random.Shared.Next(Summaries.Length)]
//             })
//             .ToArray();
//         }

//         [HttpGet("GetTemperature")]
//         public IEnumerable<int> GetTemperature()
//         {
//             return Enumerable.Range(1, 5).Select(index => Random.Shared.Next(0, 100)).ToArray();
//         }
//     }

//     public class WeatherForecast
//     {
//         public DateTime Date { get; set; }
//         public int TemperatureC { get; set; }
//         public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
//         public string? Summary { get; set; }
//     }
// }
