using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.IdentityModel.Tokens;

public class JwtToken
{
    private static readonly byte[] KeyBytes = GenerateKey();

    private static byte[] GenerateKey()
    {
        using (var rng = RandomNumberGenerator.Create())
        {
            var keyBytes = new byte[64]; // 64 bytes = 512 bits
            rng.GetBytes(keyBytes);
            return keyBytes;
        }
    }

    public string GenerateJwtToken(string? username)
    {
        try
        {
            var securityKey = new SymmetricSecurityKey(KeyBytes);
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha512);
            var claims = new[] {
                new Claim(ClaimTypes.Name, username ?? "")
            };

            var token = new JwtSecurityToken(
                issuer: "http://localhost",
                audience: "bookstore api",
                claims: claims,
                expires: DateTime.UtcNow.AddDays(1),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);

        } catch (Exception ex) {
            throw new Exception("Error generating token: " + ex.Message);
        }
    }

    public bool ValidateToken(string token, out ClaimsPrincipal? claimsPrincipal)
    {
        claimsPrincipal = null;
        try
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = KeyBytes;
            var validationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = true,
                ValidIssuer = "http://localhost",
                ValidateAudience = true,
                ValidAudience = "bookstore api",
                ValidateLifetime = true,
                ClockSkew = TimeSpan.Zero // Optional: Adjusts the time tolerance
            };

            claimsPrincipal = tokenHandler.ValidateToken(token, validationParameters, out _);
            return true;
        }
        catch
        {
            return false;
        }
    }
}

