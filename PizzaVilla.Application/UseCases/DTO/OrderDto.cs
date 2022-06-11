using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class OrderDto : BaseAdminDto
    {
        public UserDto User { get; set; }
        public decimal TotalPrice { get; set; }
        public DateTime? DeliveredAt { get; set; }
    }

    public class OrderDetailedDto : OrderDto
    {
        public string DeliveryAddress { get; set; }
        public IEnumerable<CartDto> Items { get; set; }
    }

    public class CreateOrderDto
    {
        public string DeliveryAddress { get; set; }
    }
}
