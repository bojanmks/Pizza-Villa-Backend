using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.ErrorLog;
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
    public class ErrorLogController : ControllerBase
    {
        private UseCaseHandler _handler;

        public ErrorLogController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns error log entries.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        public IActionResult Get([FromQuery] PagedDateSearch search, [FromServices] IGetErrorLogQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }
    }
}
