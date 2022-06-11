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
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(PVDbContext context)
        {
            RuleFor(x => x.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Wrong email format.")
                .Must(x => !context.Users.Any(u => u.Email == x)).WithMessage("Email {PropertyValue} is taken.");

            RuleFor(x => x.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Username is requred.")
                .MinimumLength(6).WithMessage("Username needs to be at least 6 characters long.")
                .MaximumLength(20).WithMessage("Username cannot be longer than 20 characters.")
                .Matches("^(?=[a-zA-Z0-9._]{3,12}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                .WithMessage("Wrong username format.")
                .Must(x => !context.Users.Any(u => u.Username == x)).WithMessage("Username {PropertyValue} is taken.");

            RuleFor(x => x.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .WithMessage("Password is required.")
                .Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\@\$\!\%\*\?\&\#])[A-Za-z\d@$!%*?&]{8,}$")
                .WithMessage("Password needs to be at least 8 characters long and contain at least one: Uppercase character, Lowercase character, Number, Special character.");

        }
    }
}
