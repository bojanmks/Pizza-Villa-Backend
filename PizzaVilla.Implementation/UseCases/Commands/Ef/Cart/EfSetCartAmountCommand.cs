using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.Cart;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using PizzaVilla.Implementation.Validators.Cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Cart
{
    public class EfSetCartAmountCommand : EfUseCase, ISetCartAmountCommand
    {
        public int Id => 40;
        public string Name => "Set Cart Amount (Ef)";
        public string Description => "Sets the amount in a cart item to the amount provided using Entity Framework.";

        private readonly SetCartAmountValidator _validator;

        public EfSetCartAmountCommand(PVDbContext context, SetCartAmountValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(SetCartAmountDto request)
        {
            _validator.ValidateAndThrow(request);

            var cartItem = Context.Cart.Find(request.Id);

            cartItem.Amount = request.Amount;

            Context.SaveChanges();
        }
    }
}
