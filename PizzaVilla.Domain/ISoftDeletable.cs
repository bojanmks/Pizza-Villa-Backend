using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Domain
{
    public interface ISoftDeletable
    {
        public DateTime? DeletedAt { get; set; }
        public string DeletedBy { get; set; }
    }
}
