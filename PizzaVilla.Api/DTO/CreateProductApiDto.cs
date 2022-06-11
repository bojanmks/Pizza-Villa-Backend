using Microsoft.AspNetCore.Http;
using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaVilla.Api.DTO
{
    public class CreateProductApiDto : CreateProductDto
    {
        public IFormFile Image { get; set; }
    }
}
