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
    public class CreateProductValidator : AbstractValidator<CreateProductDto>
    {
        public CreateProductValidator(PVDbContext context)
        {
            RuleFor(x => x.Name)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Name is required.")
                .MaximumLength(50)
                .Must((product, name) => !context.Products.Any(p => p.Name == name && p.CategoryId == product.CategoryId))
                .WithMessage("Product with the name {PropertyValue} and the same category already exists.");

            RuleFor(x => x.ImageName)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Image name is required.");

            RuleFor(x => x.Price).NotEmpty().WithMessage("Price is required.");

            RuleFor(x => x.CategoryId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Category Id is required.")
                .Must(x => context.ProductCategories.Any(c => c.Id == x && c.IsActive.Value)).WithMessage("Category with an id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.IngredientIds)
                .Cascade(CascadeMode.Stop)
                .Must(x => x != null).WithMessage("Ingredient Ids are required.")
                .Must(x => x.Count() >= 2).WithMessage("A product can't have less than 2 ingredients.")
                .Must(x => x.All(i => context.Ingredients.Any(idb => idb.Id == i && idb.IsActive.Value)))
                .WithMessage("Some of the provided ingredients do not exist.");
        }
    }
}
