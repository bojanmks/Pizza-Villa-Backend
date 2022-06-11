using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class UserDto : BaseAdminDtoSoftDeletable
    {
        public string Username { get; set; }
        public string Email { get; set; }
    }

    public class UserDetailedDto : UserDto
    {
        public IEnumerable<int> UseCaseIds { get; set; }
    }

    public class CreateUserDto
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public IEnumerable<int> UseCaseIds { get; set; }
    }

    public class UpdateUserDto : BaseDto
    {
        public CreateUserDto Data { get; set; }
    }
}
