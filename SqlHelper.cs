using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;

public class SqlHelper
{
    private readonly IConfiguration _configuration;

    public SqlHelper(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public async Task<ActionResult> ExecuteSqlQuery(string storedProcedureName, SqlParameter[]? parameters = null)
    {
        try
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
            using SqlConnection connection = new(connectionString);
            using SqlCommand command = new(storedProcedureName, connection)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (parameters != null && parameters.Length > 0)
            {
                command.Parameters.AddRange(parameters);
            }

            if (connection.State == ConnectionState.Closed)
            {
                await connection.OpenAsync();
            }

            SqlDataAdapter da = new(command);
            DataTable dt = new();
            da.Fill(dt);

            // Convert DataTable to a list of dictionaries
            var result = DataTableToList(dt);

            return new JsonResult(result); // Return the data as JSON
        }
        catch (Exception ex)
        {
            return new BadRequestObjectResult(new { message = ex.Message.ToString() });
        }
    }

    private List<Dictionary<string, object>> DataTableToList(DataTable table)
    {
        var list = new List<Dictionary<string, object>>();

        foreach (DataRow row in table.Rows)
        {
            var dict = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                dict[col.ColumnName] = row[col];
            }
            list.Add(dict);
        }

        return list;
    }
}
