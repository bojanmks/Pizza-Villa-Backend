using AutoMapper;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Cart;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Cart
{
    public class EfGetCartQuery : EfUseCase, IGetCartQuery
    {
        public int Id => 36;
        public string Name => "Get Cart (Ef)";
        public string Description => "Returns cart items of the currently logged in user using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly IApplicationActor _user;

        public EfGetCartQuery(PVDbContext context, IMapper mapper, IApplicationActor user)
            : base(context)
        {
            _mapper = mapper;
            _user = user;
        }

        public IEnumerable<CartDto> Execute(BaseSearch request)
        {
            var query = CartFunctions.GetUsersCart(Context, (int)_user.Id);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Product == null || x.Product.Name.Contains(request.Keyword));
            }

            var response = query.ToList().Select(x => _mapper.Map<CartDto>(x));

            return response;
        }
    }
}
