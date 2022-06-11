using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class UseCaseDto : BaseDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
