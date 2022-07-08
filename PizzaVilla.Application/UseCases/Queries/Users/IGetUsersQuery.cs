using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries.Users
{
    public interface IGetUsersQuery : IQuery<BasePagedSearch, PagedResponse<UserDetailedDto>>
    {
    }
}
