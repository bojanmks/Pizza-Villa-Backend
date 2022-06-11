using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.UseCases.DTO;
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
    public class SetCartAmountValidator : AbstractValidator<SetCartAmountDto>
    {
        public SetCartAmountValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x.Id)
                .Must(x => context.Cart.Any(y => y.Id == x && y.UserId == user.Id))
                .WithMessage("A cart item with the id of {PropertyValue} doesn't exist.")
                .Must(x => context.Cart.Find(x).OrderId == null)
                .WithMessage("That cart item has already been ordered.");

            RuleFor(x => x.Amount)
                .Cascade(CascadeMode.Stop)
                .Must(x => x > 0).WithMessage("Amount can't be set to 0 or below.")
                .Must((item, amount) => CartFunctions.GetUsersCart(context, (int)user.Id).Where(x => x.Id != item.Id).Sum(x => x.Amount) + amount <= CartConstants.MaxItems)
                .WithMessage($"You can't have more than {CartConstants.MaxItems} items in your cart.");
        }
    }
}
