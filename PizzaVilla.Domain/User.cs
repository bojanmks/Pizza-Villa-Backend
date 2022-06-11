using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public class User : Entity, ISoftDeletable
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string Username { get; set; }
        public DateTime? DeletedAt { get; set; }
        public string DeletedBy { get; set; }

        public virtual ICollection<Cart> CartItems { get; set; } = new List<Cart>();
        public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
        public virtual ICollection<UsersUseCases> UseCases { get; set; } = new List<UsersUseCases>();
        public virtual ICollection<AuditLog> AuditLog { get; set; } = new List<AuditLog>();
    }
}
