using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class CartAddons
    {
        public int CartId { get; set; }
        public int AddonId { get; set; }
        public decimal? PriceWhenOrdered { get; set; }

        public virtual Cart CartItem { get; set; }
        public virtual Addon Addon { get; set; }
    }
}
