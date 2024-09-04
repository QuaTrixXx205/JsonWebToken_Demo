using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Text.Json.Nodes;

namespace JWT_Demo.Controllers
{
    [ApiController]
    [Route("")]
    public class ManagerController : ControllerBase
    {
        private readonly SqlHelper _sqlHelper;
        private readonly JwtToken _jwt;

        public ManagerController(IConfiguration configuration)
        {
            _sqlHelper = new SqlHelper(configuration);
            _jwt = new JwtToken();
        }

        private (bool isValid, ClaimsPrincipal? Claims) CheckAuth(HttpRequest request)
        {
            string authHeader = request.Headers["Authorization"];

            if (string.IsNullOrEmpty(authHeader) || !authHeader.StartsWith("Bearer "))
            {
                return (false, null); // Invalid authorization header
            }

            string token = authHeader["Bearer ".Length..].Trim();

            if (_jwt.ValidateToken(token, out ClaimsPrincipal? claims))
            {
                if (!string.IsNullOrEmpty(claims?.FindFirst(ClaimTypes.Name)?.Value))
                {
                    return (true, claims);
                }
            }

            return (false, null); // Invalid token
        }

        // GET
        [HttpPost(Name = "Get Chu De")]
        [Route("GetChuDe")]
        public async Task<ActionResult> GetChuDe()
        {
            var (IsValid, Claims) = CheckAuth(Request);

            if (!IsValid)
            {
                return Unauthorized(new { message = "Token is invalid or Authorization header is missing." });
            }

            var userName = Claims?.FindFirst(c => c.Type == ClaimTypes.Name)?.Value;

            return await _sqlHelper.ExecuteSqlQuery("spDanhMuc_ChuDeSelectAll");
        }

        // ADD - UPDATE
        [HttpPost(Name = "Update Chu De")]
        [Route("UpdateChuDe")]
        public async Task<ActionResult> UpdateChuDe()
        {
            try
            {
                var (IsValid, Claims) = CheckAuth(Request);

                if (!IsValid)
                {
                    return Unauthorized(new { message = "Token is invalid or Authorization header is missing." });
                }

                var userName = Claims?.FindFirst(c => c.Type == ClaimTypes.Name)?.Value;

                if (string.IsNullOrEmpty(userName))
                {
                    return BadRequest(new { message = "Invalid user." });
                }

                SqlParameter[] parameters;

                using (var reader = new StreamReader(Request.Body))
                {
                    var requestBody = await reader.ReadToEndAsync();
                    var jsonObject = JObject.Parse(requestBody);

                    parameters = new SqlParameter[]
                    {
                        new SqlParameter("@MaCD", jsonObject["MaCD"]?.Value<string>() ?? "0"),
                        new SqlParameter("@TenChuDe", jsonObject["TenChuDe"]?.Value<string>()),
                        new SqlParameter("@UserName", userName), // Use the extracted username from the token claims
                    };
                }

                return await _sqlHelper.ExecuteSqlQuery("spDanhMuc_ChuDeUpdate", parameters);
            }
            catch (Exception ex)
            {
                // Log the exception (you might want to implement a logging mechanism here)
                return StatusCode(500, new { message = "An error occurred while processing your request.", error = ex.Message });
            }
        }

        // DELETE
        [HttpPost(Name = "Delete Chu De")]
        [Route("DeleteChuDe")]
        public async Task<ActionResult> DeleteChuDe()
        {
            try
            {
                // Check if the request is authorized
                var (IsValid, Claims) = CheckAuth(Request);

                if (!IsValid)
                {
                    return Unauthorized(new { message = "Token is invalid or Authorization header is missing." });
                }

                // Extract the username from the claims
                var userName = Claims?.FindFirst(c => c.Type == ClaimTypes.Name)?.Value;

                if (string.IsNullOrEmpty(userName))
                {
                    return BadRequest(new { message = "Invalid user." });
                }

                // Read and parse the request body
                using (var reader = new StreamReader(Request.Body))
                {
                    var requestBody = await reader.ReadToEndAsync();
                    var jsonObject = JObject.Parse(requestBody);

                    // Create SQL parameters
                    var parameters = new SqlParameter[]
                    {
                        new SqlParameter("@MaCD", jsonObject["MaCD"]?.Value<int>() ?? 0),
                        new SqlParameter("@UserName", userName), // Use the extracted username from the token claims
                    };

                    // Execute the SQL query
                    return await _sqlHelper.ExecuteSqlQuery("spDanhMuc_ChuDeDelete", parameters);
                }
            }
            catch (Exception ex)
            {
                // Log the exception (you might want to implement a logging mechanism here)
                return StatusCode(500, new { message = "An error occurred while processing your request.", error = ex.Message });
            }
        }

    }
}
