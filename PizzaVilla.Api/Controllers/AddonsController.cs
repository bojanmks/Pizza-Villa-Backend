using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.Commands.Addons;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Addons;
using PizzaVilla.Application.UseCases.Queries.Responses;
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
    public class AddonsController : ControllerBase
    {
        private UseCaseHandler _handler;

        public AddonsController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns addons.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [AllowAnonymous]
        [ProducesResponseType(typeof(PagedResponse<AddonDto>), 200)]
        [HttpGet]
        public IActionResult Get([FromQuery] BasePagedSearch search, [FromServices] IGetAddonsQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns addons with information important to administrators.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [ProducesResponseType(typeof(PagedResponse<AddonAdminDto>), 200)]
        [HttpGet]
        [Route("admin")]
        public IActionResult Get([FromQuery] BasePagedSearch search, [FromServices] IGetAddonsAdminQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns an addon with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Addon with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        [ProducesResponseType(typeof(AddonAdminDto), 200)]
        public IActionResult Get(int id, [FromServices] IFindAddonQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Creates a new addon.
        /// </summary>
        /// <param name="data"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull creation.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="422">Addon name is already taken.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPost]
        public IActionResult Post([FromBody] CreateAddonDto data, [FromServices] ICreateAddonCommand command)
        {
            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }

        /// <summary>
        /// Updates an ingredient with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="data"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull update.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Addon with the given id doesn't exist.</response>
        /// <response code="422">Addon name wasn't provided or is already taken; Price wasn't provided.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CreateAddonDto data, [FromServices] IUpdateAddonCommand command)
        {
            var updateData = new UpdateAddonDto
            {
                Id = id,
                Data = data
            };

            _handler.HandleCommand(command, updateData);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Deletes an addon with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull deletion.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Addon with the given id doesn't exist.</response>
        /// <response code="422">Addon cannot be deleted.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteAddonCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
