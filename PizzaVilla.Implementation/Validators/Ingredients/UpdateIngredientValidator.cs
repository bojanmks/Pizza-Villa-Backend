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
    public class UpdateIngredientValidator : AbstractValidator<UpdateIngredientDto>
    {
        public UpdateIngredientValidator(PVDbContext context)
        {
            RuleFor(x => x.Id)
                .Must(x => context.Ingredients.Any(y => y.Id == x))
                .WithMessage("An ingredient with the id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.Data.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Ingredient name is required.")
                .Must((ingredient, name) => !context.Ingredients.Any(i => i.Name == name && i.Id != ingredient.Id))
                .WithMessage("Ingredient name {PropertyValue} is taken.")
                .OverridePropertyName("Name");
        }
    }
}
