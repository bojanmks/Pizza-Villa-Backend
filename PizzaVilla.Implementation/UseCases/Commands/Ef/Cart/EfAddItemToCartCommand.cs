using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.Cart;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Cart
{
    public class EfAddItemToCartCommand : EfUseCase, IAddItemToCartCommand
    {
        public int Id => 37;
        public string Name => "Add Item To Cart (Ef)";
        public string Description => "Adds a new item to the logged in user's cart using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly IApplicationActor _user;
        private readonly AddItemToCartValidator _validator;

        public EfAddItemToCartCommand(PVDbContext context, IMapper mapper, IApplicationActor user, AddItemToCartValidator validator)
            : base(context)
        {
            _mapper = mapper;
            _user = user;
            _validator = validator;
        }

        public void Execute(AddItemToCartDto request)
        {
            request.AddonIds = request.AddonIds?.Distinct();
            request.IngredientIds = request.IngredientIds?.Distinct();

            _validator.ValidateAndThrow(request);

            var usersCart = CartFunctions.GetUsersCart(Context, (int)_user.Id);

            var elementInCart = usersCart.FirstOrDefault(x => x.ProductId == request.ProductId
                                                            && (((request.AddonIds == null || !request.AddonIds.Any()) && !x.Addons.Any()) ||
                                                            (request.AddonIds != null && x.Addons.Select(y => y.AddonId).All(y => request.AddonIds.Contains(y))
                                                            && x.Addons.Count() == request.AddonIds.Count()))
                                                            && (request.IngredientIds == null 
                                                            || (x.Ingredients.Select(y => y.IngredientId).All(y => request.IngredientIds.Contains(y)) 
                                                            && x.Ingredients.Count() == request.IngredientIds.Count()))
                                                        );

            if(elementInCart != null)
            {
                elementInCart.Amount++;
            }
            else
            {
                var cartItem = _mapper.Map<Domain.Cart>(request);
                cartItem.UserId = (int)_user.Id;

                Context.Cart.Add(cartItem);
            }

            Context.SaveChanges();
        }
    }
}
