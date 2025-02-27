using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FTSI_Web_API_System_Integration.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly JwtTokenService _tokenService;

        public AuthController(IConfiguration config, JwtTokenService tokenService)
        {
            _config = config;
            _tokenService = tokenService;
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginModel login)
        {
            if (login.Username == _config["Credentials:Username"] && login.Password == _config["Credentials:Password"])
            {
                var token = _tokenService.GenerateToken();
                return Ok(new { Token = token });
            }
            return Unauthorized();
        }
    }

    public class LoginModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
