using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Api.Core;
using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly JwtManager _manager;

        public AuthController(JwtManager manager)
        {
            _manager = manager;
        }

        /// <summary>
        /// Generates and returns a token from correct user credentials.
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        /// <response code="200">Successfull authentication.</response>
        /// <response code="403">Incorrect credentials.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Post([FromBody] AuthRequestDto request)
        {
            var token = _manager.MakeToken(request.Email, request.Password);

            return Ok(new { token });
        }
    }
}
