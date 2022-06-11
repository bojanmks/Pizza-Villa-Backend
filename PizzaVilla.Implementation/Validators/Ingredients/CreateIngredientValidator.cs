using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Ingredients
{
    public class CreateIngredientValidator : AbstractValidator<CreateIngredientDto>
    {
        public CreateIngredientValidator(PVDbContext context)
        {
            RuleFor(x => x.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Ingredient name is required.")
                .Must(x => !context.Ingredients.Any(i => i.Name == x)).WithMessage("Ingredient name {PropertyValue} is taken.");
        }
    }
}
