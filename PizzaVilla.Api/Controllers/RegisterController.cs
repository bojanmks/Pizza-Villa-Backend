using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Implementation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [AllowAnonymous]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly UseCaseHandler _handler;
        private readonly IRegisterUserCommand _command;

        public RegisterController(UseCaseHandler handler, IRegisterUserCommand command)
        {
            _handler = handler;
            _command = command;
        }

        /// <summary>
        /// Registers a new user.
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        /// <response code="201">Successfull registration.</response>
        /// <response code="422">Username or email are already taken.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] RegisterUserDto data)
        {
            _handler.HandleCommand(_command, data);
            return StatusCode(StatusCodes.Status201Created);
        }
    }
}
