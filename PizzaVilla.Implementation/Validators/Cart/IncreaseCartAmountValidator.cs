using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Cart
{
    public class IncreaseCartAmountValidator : AbstractValidator<int>
    {
        public IncreaseCartAmountValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x)
                .Must(x => context.Cart.Any(y => y.Id == x && y.UserId == user.Id))
                .WithMessage("A cart item with the id pf {PropertyValue} doesn't exist.")
                .Must(x => CartFunctions.GetUsersCart(context, (int)user.Id).Sum(y => y.Amount) < CartConstants.MaxItems)
                .WithMessage("You can't have any more items in your cart.");
        }
    }
}
