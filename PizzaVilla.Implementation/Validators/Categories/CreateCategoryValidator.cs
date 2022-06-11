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
    public class CreateCategoryValidator : AbstractValidator<CreateProductCategoryDto>
    {
        public CreateCategoryValidator(PVDbContext context)
        {
            RuleFor(x => x.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Category name is required.")
                .Must(x => !context.ProductCategories.Any(a => a.Name == x)).WithMessage("Category name {PropertyValue} is taken.");
        }
    }
}
