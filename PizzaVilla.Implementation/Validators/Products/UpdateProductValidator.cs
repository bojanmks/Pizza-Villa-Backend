using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Products
{
    public class UpdateProductValidator : AbstractValidator<UpdateProductDto>
    {
        public UpdateProductValidator(PVDbContext context)
        {
            RuleFor(x => x.Id)
                .Must(x => context.Products.Any(y => y.Id == x))
                .WithMessage("A product with the id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.Data.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Name is required.")
                .MaximumLength(50)
                .Must((product, name) => !context.Products.Any(p => p.Name == name && p.CategoryId == product.Data.CategoryId && p.Id != product.Id))
                .WithMessage("Product with the name {PropertyValue} and the same category already exists.")
                .OverridePropertyName("Name");

            RuleFor(x => x.Data.Price)
                .NotEmpty().WithMessage("Price is required.")
                .OverridePropertyName("Price");

            RuleFor(x => x.Data.CategoryId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Category Id is required.")
                .Must(x => context.ProductCategories.Any(c => c.Id == x && c.IsActive))
                .WithMessage("Category with an id of {PropertyValue} doesn't exist.")
                .OverridePropertyName("CategoryId");

            RuleFor(x => x.Data.IngredientIds)
                .Cascade(CascadeMode.Stop)
                .Must(x => x != null).WithMessage("Ingredient Ids are required.")
                .Must(x => x.Count() >= 2).WithMessage("A product can't have less than 2 ingredients.")
                .Must(x => x.All(i => context.Ingredients.Any(idb => idb.Id == i && idb.IsActive)))
                .WithMessage("Some of the provided ingredients do not exist.");
        }
    }
}
