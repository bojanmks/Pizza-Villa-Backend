using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Users
{
    public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
    {
        public UpdateUserValidator(PVDbContext context)
        {
            RuleFor(x => x.Id)
                .Must(x => context.Users.Any(y => y.Id == x))
                .WithMessage("A user with the id of {PropertyValue} doesn't exist.");

            RuleFor(x => x.Data.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Wrong email format.")
                .Must((user, email) => !context.Users.Any(u => u.Email == email && u.Id != user.Id)).WithMessage("Email {PropertyValue} is taken.")
                .OverridePropertyName("Email");

            RuleFor(x => x.Data.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Username is requred.")
                .MinimumLength(6).WithMessage("Username needs to be at least 6 characters long.")
                .MaximumLength(20).WithMessage("Username cannot be longer than 20 characters.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Wrong username format.")
                .Must((user, username) => !context.Users.Any(u => u.Username == username && u.Id != user.Id)).WithMessage("Username {PropertyValue} is taken.")
                .OverridePropertyName("Username");

            RuleFor(x => x.Data.Password)
                .Cascade(CascadeMode.Stop)
                .Matches(@"(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\@\$\!\%\*\?\&\#])[A-Za-z\d@$!%*?&]{8,}$)|^$")
                .WithMessage("Password needs to be at least 8 characters long and contain at least one: Uppercase character, Lowercase character, Number, Special character.")
                .OverridePropertyName("Password");
        }
    }
}
