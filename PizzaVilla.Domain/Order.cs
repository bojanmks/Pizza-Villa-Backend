using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class Order : Entity, ISoftDeletable
    {
        public int UserId { get; set; }
        public decimal TotalPrice { get; set; }
        public string DeliveryAddress { get; set; }
        public DateTime? DeliveredAt { get; set; }
        public DateTime? DeletedAt { get; set; }
        public string DeletedBy { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<Cart> CartItems { get; set; } = new List<Cart>();
    }
}
