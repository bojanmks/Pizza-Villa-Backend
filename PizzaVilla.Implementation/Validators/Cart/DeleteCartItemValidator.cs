using FluentValidation;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Cart
{
    public class DeleteCartItemValidator : AbstractValidator<int>
    {
        public DeleteCartItemValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x)
                .Cascade(CascadeMode.Stop)
                .Must(x => context.Cart.Any(y => y.Id == x && y.UserId == user.Id))
                .WithMessage("A cart item with the id of {PropertyValue} doesn't exist.")
                .Must(x => context.Cart.Find(x).OrderId == null)
                .WithMessage("That cart item has already been ordered.");
        }
    }
}
