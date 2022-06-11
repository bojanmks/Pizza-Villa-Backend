using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Products
{
    public class DeleteProductValidator : AbstractValidator<int>
    {
        public DeleteProductValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.Products.Any(y => y.Id == x))
                .WithMessage("A product with the id of {PropertyValue} doesn't exist.");

            // No other validation because the product is being soft deleted
        }
    }
}
