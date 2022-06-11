using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Orders
{
    public class MarkOrderAsDeliveredValidator : AbstractValidator<int>
    {
        public MarkOrderAsDeliveredValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.Orders.Any(y => y.Id == x))
                .WithMessage("An order with the id of {PropertyValue} doesn't exist.")
                .Must(x => context.Orders.Any(y => y.Id == x & y.DeliveredAt == null))
                .WithMessage("That order has already been delivered.");
        }
    }
}
