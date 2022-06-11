using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.Application.UseCases.Queries.Users;
using PizzaVilla.Implementation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UseCaseHandler _handler;

        public UsersController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns users.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [ProducesResponseType(typeof(PagedResponse<UserDto>), 200)]
        public IActionResult Get([FromQuery] BasePagedSearch search, [FromServices] IGetUsersQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns a user with the given ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">User with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        [ProducesResponseType(typeof(UserDetailedDto), 200)]
        public IActionResult Get(int id, [FromServices] IFindUserQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new user.
        /// </summary>
        /// <param name="data"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull creation.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] CreateUserDto data, [FromServices] ICreateUserCommand command)
        {
            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }

        /// <summary>
        /// Updates a user with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="data"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull update.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">User with the given id doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CreateUserDto data, [FromServices] IUpdateUserCommand command)
        {
            var updateData = new UpdateUserDto
            {
                Id = id,
                Data = data
            };

            _handler.HandleCommand(command, updateData);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Deletes a user with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull deletion.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">User with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
