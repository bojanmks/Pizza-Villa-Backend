using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Addons
{
    public class DeleteAddonValidator : AbstractValidator<int>
    {
        public DeleteAddonValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.Addons.Any(a => a.Id == x)).WithMessage("Addon with an id of {PropertyValue} doesn't exist.")
                .Must(x => !context.Addons.Find(x).CartItems.Any()).WithMessage("There are cart items with this addon.")
                .OverridePropertyName("Id");
        }
    }
}
