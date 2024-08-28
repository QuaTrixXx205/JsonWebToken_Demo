using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.IdentityModel.Tokens;

public class JwtToken
{
    private static readonly byte[] KeyBytes = GenerateKey();

    // Generate a secure key (64 bytes) for HS512
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
}
