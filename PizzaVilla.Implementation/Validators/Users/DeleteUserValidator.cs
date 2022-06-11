using FluentValidation;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Users
{
    public class DeleteUserValidator : AbstractValidator<int>
    {
        public DeleteUserValidator(PVDbContext context)
        {
            RuleFor(x => x)
                .Must(x => context.Users.Any(y => y.Id == x))
                .WithMessage("A user with the id of {PropertyValue} doesn't exist.");

            // No other validation because the user is being soft deleted
        }
    }
}
