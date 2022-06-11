using FluentValidation;
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
    public class EfDeleteCartItemCommand : EfUseCase, IDeleteCartItemCommand
    {
        public int Id => 41;
        public string Name => "Delete Cart Item (Ef)";
        public string Description => "Deletes a Cart Item with the provided id using Entity Framework.";

        private readonly DeleteCartItemValidator _validator;

        public EfDeleteCartItemCommand(PVDbContext context, DeleteCartItemValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var cartItem = Context.Cart.Find(id);

            Context.Remove(cartItem);

            Context.SaveChanges();
        }
    }
}
