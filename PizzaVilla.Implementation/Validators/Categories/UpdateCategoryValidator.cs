using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Categories
{
    public class UpdateCategoryValidator : AbstractValidator<UpdateProductCategoryDto>
    {
        public UpdateCategoryValidator(PVDbContext context)
        {
            RuleFor(x => x.Id)
                .Must(x => context.ProductCategories.Any(y => y.Id == x))
                .WithMessage("A category with the id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.Data.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Category name is required.")
                .Must((category, name) => !context.ProductCategories.Any(a => a.Name == name && a.Id != category.Id))
                .WithMessage("Category name {PropertyValue} is taken.")
                .OverridePropertyName("Name");
        }
    }
}
