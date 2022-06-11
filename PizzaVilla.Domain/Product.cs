using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class Product : Entity, ISoftDeletable
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public int CategoryId { get; set; }
        public DateTime? DeletedAt { get; set; }
        public string DeletedBy { get; set; }

        public virtual ProductCategory Category { get; set; }
        public virtual ICollection<ProductsIngredients> Ingredients { get; set; } = new List<ProductsIngredients>();
        public virtual ICollection<Cart> CartItems { get; set; } = new List<Cart>();
    }
}
