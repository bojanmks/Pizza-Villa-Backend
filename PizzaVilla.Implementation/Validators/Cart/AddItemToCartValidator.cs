using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Cart
{
    public class AddItemToCartValidator : AbstractValidator<AddItemToCartDto>
    {
        public AddItemToCartValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x)
                .Must(x => (x.IngredientIds != null && x.IngredientIds.Count() >= OrderConstants.MinIngredients && x.IngredientIds.Count() <= OrderConstants.MaxIngredients && x.ProductId == null)
                                || (x.IngredientIds == null || !x.IngredientIds.Any()) && x.ProductId != null
                ).WithMessage($"You can either create an order for an existing product, or an order without a product and at least {OrderConstants.MinIngredients} but no more than {OrderConstants.MaxIngredients} ingredients.")
                .Must(x => CartFunctions.GetUsersCart(context, (int)user.Id).Sum(x => x.Amount) < CartConstants.MaxItems)
                .WithMessage("You can't have any more items in your cart.");

            RuleFor(x => x.ProductId)
                .Must(x => x == null || context.Products.Any(y => y.Id == x))
                .WithMessage("Selected product doesn't exist.");

            RuleFor(x => x.IngredientIds)
                .Must(x => (x == null || !x.Any()) || (x.All(y => context.Ingredients.Any(z => z.Id == y && z.IsActive.Value))))
                .WithMessage("Some of the selected ingredients don't exist.");

            RuleFor(x => x.AddonIds)
                .Cascade(CascadeMode.Stop)
                .Must(x => x == null || x.All(y => context.Addons.Any(z => z.Id == y && z.IsActive.Value)))
                .WithMessage("Some of the selected addons don't exist.")
                .Must(x => x == null || x.Count() <= OrderConstants.MaxAddons)
                .WithMessage("Some of the selected addons don't exist.");
        }
    }
}
