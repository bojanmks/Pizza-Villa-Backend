using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Orders;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Orders
{
    public class EfGetOrdersQuery : EfUseCase, IGetOrdersQuery
    {
        public int Id => 42;
        public string Name => "Get Orders (Ef)";
        public string Description => "Returns Orders using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetOrdersQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<OrderDto> Execute(BasePagedDateSearch request)
        {
            var query = Context.Orders.AsQueryable();

            if(!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.User.Username.Contains(request.Keyword) || x.User.Email.Contains(request.Keyword));
            }

            if (request.DateFrom != null)
            {
                query = query.Where(x => x.CreatedAt > request.DateFrom);
            }

            if (request.DateTo != null)
            {
                query = query.Where(x => x.CreatedAt < request.DateTo);
            }

            if (request.PerPage == null)
            {
                request.PerPage = 15;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<OrderDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).ToList().Select(x => _mapper.Map<OrderDto>(x))
            };

            return response;
        }
    }
}
