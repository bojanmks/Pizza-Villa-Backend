using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.Application.UseCases.Queries.Users;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Users
{
    public class EfGetUsersQuery : EfUseCase, IGetUsersQuery
    {
        public int Id => 18;
        public string Name => "Get Users (Ef)";
        public string Description => "Returns users using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetUsersQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<UserDto> Execute(BasePagedSearch request)
        {
            var query = Context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Username.Contains(request.Keyword) || x.Email.Contains(request.Keyword));
            }

            if (request.PerPage == null)
            {
                request.PerPage = 15;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<UserDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<UserDto>(x))
            };

            return response;
        }
    }
}
