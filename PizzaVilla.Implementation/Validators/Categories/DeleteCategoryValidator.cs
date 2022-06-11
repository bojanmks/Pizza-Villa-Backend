using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Categories
{
    public class DeleteCategoryValidator : AbstractValidator<int>
    {
        public DeleteCategoryValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.ProductCategories.Any(a => a.Id == x)).WithMessage("Category with an id of {PropertyValue} doesn't exist.")
                .Must(x => !context.ProductCategories.Find(x).Products.Any()).WithMessage("There are products with this category.")
                .OverridePropertyName("Id");
        }
    }
}
