using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class Addon : Entity
    {
        public string Name { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<CartAddons> CartItems { get; set; } = new List<CartAddons>();
    }
}
