using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class CartIngredients
    {
        public int CartId { get; set; }
        public int IngredientId { get; set; }
        public decimal? PriceWhenOrdered { get; set; }

        public virtual Cart CartItem { get; set; }
        public virtual Ingredient Ingredient { get; set; }
    }
}
