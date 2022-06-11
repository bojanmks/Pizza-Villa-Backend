using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class AddonDto : BaseDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class AddonAdminDto : BaseAdminDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class CreateAddonDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public bool IsActive { get; set; }
    }

    public class UpdateAddonDto : BaseDto
    {
        public CreateAddonDto Data { get; set; }
    }
}
