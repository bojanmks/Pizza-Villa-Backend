using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class Cart : Entity
    {
        public int UserId { get; set; }
        public int? ProductId { get; set; }
        public int Amount { get; set; }
        public int? OrderId { get; set; }
        public decimal? ProductPriceWhenOrdered { get; set; }

        public virtual User User { get; set; }
        public virtual Product Product { get; set; }
        public virtual Order Order { get; set; }
        public virtual ICollection<CartAddons> Addons { get; set; } = new List<CartAddons>();
        public virtual ICollection<CartIngredients> Ingredients { get; set; } = new List<CartIngredients>();
    }
}
