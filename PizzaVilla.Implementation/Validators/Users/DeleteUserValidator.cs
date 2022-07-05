using FluentValidation;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Users
{
    public class DeleteUserValidator : AbstractValidator<int>
    {
        public DeleteUserValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x)
                .Must(x => context.Users.Any(y => y.Id == x))
                .WithMessage("A user with the id of {PropertyValue} doesn't exist.")
                .Must(x => x != user.Id)
                .WithMessage("You can't delete your own account.");

            // No other validation because the user is being soft deleted
        }
    }
}
