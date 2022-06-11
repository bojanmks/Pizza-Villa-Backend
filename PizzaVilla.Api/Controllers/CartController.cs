using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.Commands.Cart;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Cart;
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
    public class CartController : ControllerBase
    {
        private readonly UseCaseHandler _handler;

        public CartController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns cart items of the currently logged in user.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        public IActionResult Get([FromQuery] BaseSearch search, [FromServices] IGetCartQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Adds a new item to the currenly logged in users cart.
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
        public IActionResult Post([FromBody] AddItemToCartDto data, [FromServices] IAddItemToCartCommand command)
        {
            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }

        /// <summary>
        /// Decreases the amount in the cart item with the provided id by one.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Action was successful.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Cart item doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}/increase")]
        public IActionResult IncreaseAmount(int id, [FromServices] IIncreaseCartAmountCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Increases the amount in the cart item with the provided id by one.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Action was successful.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Cart item doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}/decrease")]
        public IActionResult DecreaseAmount(int id, [FromServices] IDecreaseCartAmountCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Sets the amount in the cart item with the provided id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="amount"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Action was successful.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Cart item doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}/{amount}")]
        public IActionResult SetAmount(int id, int amount, [FromServices] ISetCartAmountCommand command)
        {
            var setAmountDto = new SetCartAmountDto
            {
                Id = id,
                Amount = amount
            };

            _handler.HandleCommand(command, setAmountDto);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Deletes an ingredient with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull deletion.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Cart item with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCartItemCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
