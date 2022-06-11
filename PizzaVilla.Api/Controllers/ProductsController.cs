using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Api.DTO;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.Products;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Products;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.Implementation;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly UseCaseHandler _handler;

        public ProductsController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Returns products.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [AllowAnonymous]
        [HttpGet]
        [ProducesResponseType(typeof(PagedResponse<ProductDto>), 200)]
        public IActionResult Get([FromQuery] BasePagedSearch search, [FromServices] IGetProductsQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns products with information important to administrators.
        /// </summary>
        /// <param name="search"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet]
        [Route("admin")]
        [ProducesResponseType(typeof(PagedResponse<ProductAdminDto>), 200)]
        public IActionResult Get([FromQuery] BasePagedSearch search, [FromServices] IGetProductsAdminQuery query)
        {
            return Ok(_handler.HandleQuery(query, search));
        }

        /// <summary>
        /// Returns a product with the given ID.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Product with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}")]
        [AllowAnonymous]
        public IActionResult Get(int id, [FromServices] IFindProductQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        /// <summary>
        /// Returns a product with information important to Administrators.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Product with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpGet("{id}/admin")]
        public IActionResult Get(int id, [FromServices] IFindProductAdminQuery query)
        {
            return Ok(_handler.HandleQuery(query, id));
        }

        private IEnumerable<string> SupportedExtensions => new List<string> { ".jpg", ".jpeg", ".png", ".webp" };

        private string ResizeAndUploadImage(IFormFile file)
        {
            var extension = Path.GetExtension(file.FileName);

            if (!SupportedExtensions.Contains(extension))
            {
                throw new UnprocessableEntityException("Unsupported file type.");
            }

            var guid = Guid.NewGuid();

            var fileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", fileName);

            using (var image = Image.Load(file.OpenReadStream()))
            {
                image.Mutate(x => x.Resize(400, 400));
                image.Save(path);
            }

            return fileName;
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
        public IActionResult Post([FromForm] CreateProductApiDto data, [FromServices] ICreateProductCommand command)
        {
            if(data.Image != null)
            {
                data.ImageName = ResizeAndUploadImage(data.Image);
            } 
            else
            {
                throw new UnprocessableEntityException("Image wasn't provided.");
            }

            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }

        /// <summary>
        /// Updates a product with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="data"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull update.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Product with the given id doesn't exist.</response>
        /// <response code="422">Data sent is invalid.</response>
        /// <response code="500">Internal server error.</response>
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] CreateProductApiDto data, [FromServices] IUpdateProductCommand command)
        {
            if (data.Image != null)
            {
                data.ImageName = ResizeAndUploadImage(data.Image);
            }

            var updateData = new UpdateProductDto
            {
                Id = id,
                Data = data
            };

            _handler.HandleCommand(command, updateData);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        /// <summary>
        /// Deletes a product with the given id.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="204">Successfull deletion.</response>
        /// <response code="401">Unauthorized access.</response>
        /// <response code="403">Forbidden.</response>
        /// <response code="404">Product with the given id doesn't exist.</response>
        /// <response code="500">Internal server error.</response>
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteProductCommand command)
        {
            _handler.HandleCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
