using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Orders;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Orders
{
    public class EfFindOrderQuery : EfUseCase, IFindOrderQuery
    {
        public int Id => 43;
        public string Name => "Find Order (Ef)";
        public string Description => "Find an Order with the specified id using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindOrderQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public OrderDetailedDto Execute(int id)
        {
            var order = Context.Orders.Find(id);

            if (order == null)
            {
                throw new EntityNotFoundException("Order", id);
            }

            return _mapper.Map<OrderDetailedDto>(order);
        }
    }
}
