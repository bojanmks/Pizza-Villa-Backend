using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Addons
{
    public class UpdateAddonValidator : AbstractValidator<UpdateAddonDto>
    {
        public UpdateAddonValidator(PVDbContext context)
        {
            RuleFor(x => x.Id)
                .Must(x => context.Addons.Any(y => y.Id == x))
                .WithMessage("Addon with the id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.Data.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Addon name is required.")
                .Must((addon, name) => !context.Addons.Any(a => a.Name == name && a.Id != addon.Id))
                .WithMessage("Addon name {PropertyValue} is taken.")
                .OverridePropertyName("Name");

            RuleFor(x => x.Data.Price)
                .NotEmpty().WithMessage("Addon price is required.")
                .OverridePropertyName("Price");
        }
    }
}
