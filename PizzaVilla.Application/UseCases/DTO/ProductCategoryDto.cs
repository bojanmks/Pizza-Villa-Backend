using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class ProductCategoryDto : BaseDto
    {
        public string Name { get; set; }
    }

    public class ProductCategoryAdminDto : BaseAdminDto
    {
        public string Name { get; set; }
    }

    public class CreateProductCategoryDto
    {
        public string Name { get; set; }
        public bool IsActive { get; set; }
    }

    public class UpdateProductCategoryDto : BaseDto
    {
        public CreateProductCategoryDto Data { get; set; }
    }
}
