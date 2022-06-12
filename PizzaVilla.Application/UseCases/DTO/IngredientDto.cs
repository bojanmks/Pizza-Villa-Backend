using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class IngredientDto : BaseDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class IngredientAdminDto : BaseAdminDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class IngredientOrderedDto : IngredientAdminDto
    {
        public decimal? PriceWhenOrdered { get; set; }
    }

    public class CreateIngredientDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public bool IsActive { get; set; }
    }

    public class UpdateIngredientDto : BaseDto
    {
        public CreateIngredientDto Data { get; set; }
    }
}
