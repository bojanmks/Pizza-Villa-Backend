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
    public class CreateAddonValidator : AbstractValidator<CreateAddonDto>
    {
        public CreateAddonValidator(PVDbContext context)
        {
            RuleFor(x => x.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Addon name is required.")
                .Must(x => !context.Addons.Any(a => a.Name == x)).WithMessage("Addon name {PropertyValue} is taken.");

            RuleFor(x => x.Price)
                .GreaterThanOrEqualTo(0)
                .WithMessage("Price cannot be less than 0.");
        }
    }
}
