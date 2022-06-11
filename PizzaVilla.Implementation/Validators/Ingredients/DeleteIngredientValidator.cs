using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Ingredients
{
    public class DeleteIngredientValidator : AbstractValidator<int>
    {
        public DeleteIngredientValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.Ingredients.Any(y => y.Id == x)).WithMessage("An ingredient with the id of {PropertyValue} doesn't exist.")
                .Must(x => !context.Ingredients.Find(x).Products.Any()).WithMessage("There are products with this ingredient.")
                .Must(x => !context.Ingredients.Find(x).CartItems.Any()).WithMessage("There are cart items with this ingredient.")
                .OverridePropertyName("Id");
        }
    }
}
