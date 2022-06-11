using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.Cart;
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
    public class EfIncreaseCartAmount : EfUseCase, IIncreaseCartAmountCommand
    {
        public int Id => 38;
        public string Name => "Increase Cart Amount (Ef)";
        public string Description => "Increases the amount in the cart item with the provided id by one using Entity Framework.";

        private readonly IncreaseCartAmountValidator _validator;

        public EfIncreaseCartAmount(PVDbContext context, IncreaseCartAmountValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var cartItem = Context.Cart.Find(id);

            cartItem.Amount++;

            Context.SaveChanges();
        }
    }
}
