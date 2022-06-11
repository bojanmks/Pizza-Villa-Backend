using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class ProductDto : BaseDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public ProductCategoryDto Category { get; set; }
        public IEnumerable<IngredientDto> Ingredients { get; set; }
    }

    public class ProductAdminDto : BaseAdminDtoSoftDeletable
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public ProductCategoryAdminDto Category { get; set; }
        public IEnumerable<IngredientAdminDto> Ingredients { get; set; }
    }

    public class CreateProductDto
    {
        public string ImageName { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int CategoryId { get; set; }
        public IEnumerable<int> IngredientIds { get; set; }
        public bool IsActive { get; set; }
    }

    public class UpdateProductDto : BaseDto
    {
        public CreateProductDto Data { get; set; }
    }
}
