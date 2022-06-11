using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Orders
{
    public class DeleteOrderValidator : AbstractValidator<int>
    {
        public DeleteOrderValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Cascade(CascadeMode.Stop)
                .Must(x => context.Orders.Any(y => y.Id == x))
                .WithMessage("Order with the id of {PropertyValue} doesn't exist.")
                .Must(x => context.Orders.Any(y => y.Id == x && y.DeliveredAt == null))
                .WithMessage("That order has already been delivered.")
                .OverridePropertyName("Id");
        }
    }
}
