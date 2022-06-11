using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class ProductsIngredients
    {
        public int ProductId { get; set; }
        public int IngredientId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Ingredient Ingredient { get; set; }
    }
}
