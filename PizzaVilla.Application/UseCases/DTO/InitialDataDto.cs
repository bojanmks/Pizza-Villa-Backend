using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class InitialDataDto : BaseDto
    {
        public IEnumerable<Ingredient> Ingredients { get; set; }
        public IEnumerable<Product> Products { get; set; }
        public IEnumerable<ProductCategory> Categories { get; set; }
        public IEnumerable<ProductsIngredients> ProductsIngredients { get; set; }
        public IEnumerable<Addon> Addons { get; set; }
        public IEnumerable<User> Users { get; set; }
    }
}
