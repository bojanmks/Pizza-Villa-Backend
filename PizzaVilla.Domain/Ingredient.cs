using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class Ingredient : Entity
    {
        public string Name { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<ProductsIngredients> Products { get; set; } = new List<ProductsIngredients>();
        public virtual ICollection<CartIngredients> CartItems { get; set; } = new List<CartIngredients>();
    }
}
