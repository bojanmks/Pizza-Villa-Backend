using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.UseCases.Commands.Orders;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Orders;
using PizzaVilla.Implementation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly UseCaseHandler _handler;

        public OrdersController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns orders.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        public IActionResult Get([FromQuery] PagedDateSearch search, [FromServices] IGetOrdersQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns an order with the given ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Order with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IFindOrderQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Returns constants for making orders.
        /// </summary>
        /// <returns></returns>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [AllowAnonymous]
        [Route("constants")]
        public Dictionary<string, object> Get()
        {
            Type type = typeof(OrderConstants);

            PropertyInfo[] properties = type.GetProperties();

            var result = new Dictionary<string, object>();

            foreach (var prop in properties)
            {
                result.Add(prop.Name, prop.GetValue(null, null));
            }

            return result;
        }

        /// <summary>
        /// Creates a new order.
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
        public IActionResult Post([FromBody] CreateOrderDto data, [FromServices] ICreateOrderCommand command)
        {
            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }

        /// <summary>
        /// Marks the order as delivered.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull update.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Order with the given id doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}/delivered")]
        public IActionResult Put(int id, [FromServices] IMarkOrderAsDeliveredCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Cancels an order.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull deletion.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Order with the given id doesn't exist.</response>
        /// <response code="422">Order has already been delivered.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteOrderCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
