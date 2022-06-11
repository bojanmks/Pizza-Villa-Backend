using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class BaseDto
    {
        public int Id { get; set; }
    }

    public class BaseAdminDto : BaseDto
    {
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public bool IsActive { get; set; }
    }

    public class BaseAdminDtoSoftDeletable : BaseAdminDto
    {
        public DateTime? DeletedAt { get; set; }
        public string DeletedBy { get; set; }
    }
}
