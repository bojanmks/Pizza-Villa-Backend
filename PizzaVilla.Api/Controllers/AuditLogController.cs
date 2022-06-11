using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.AuditLog;
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
    public class AuditLogController : ControllerBase
    {
        private UseCaseHandler _handler;

        public AuditLogController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns audit log entries.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [ProducesResponseType(typeof(PagedResponse<AuditLogDto>), 200)]
        public IActionResult Get([FromQuery] BasePagedDateSearch search, [FromServices] IGetAuditLogQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }
    }
}
