using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.Orders;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using PizzaVilla.Implementation.Validators.Orders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Orders
{
    public class EfCreateOrderCommand : EfUseCase, ICreateOrderCommand
    {
        public int Id => 44;
        public string Name => "Create Order (Ef)";
        public string Description => "Creates a new order for the currently logged in user using Entity Framework.";

        private readonly IApplicationActor _user;
        private readonly IMapper _mapper;
        private readonly CreateOrderValidator _validator;

        public EfCreateOrderCommand(PVDbContext context, IApplicationActor user, IMapper mapper, CreateOrderValidator validator)
            : base(context)
        {
            _user = user;
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(CreateOrderDto request)
        {
            _validator.ValidateAndThrow(request);

            var usersCart = CartFunctions.GetUsersCart(Context, (int)_user.Id).ToList();

            foreach(var item in usersCart)
            {
                item.ProductPriceWhenOrdered = item.Product?.Price;

                foreach(var ingredient in item.Ingredients)
                {
                    ingredient.PriceWhenOrdered = ingredient.Ingredient.Price;
                }

                foreach(var addon in item.Addons)
                {
                    addon.PriceWhenOrdered = addon.Addon.Price;
                }
            }

            var newOrder = new Order
            {
                TotalPrice = _mapper.Map<IEnumerable<CartDto>>(usersCart).Sum(x => x.TotalPrice * x.Amount),
                UserId = (int)_user.Id,
                CartItems = usersCart
            };

            _mapper.Map(request, newOrder);

            Context.Orders.Add(newOrder);

            Context.SaveChanges();
        }
    }
}
