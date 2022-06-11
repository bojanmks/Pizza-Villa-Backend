using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Contact
{
    public class ContactMessageValidator : AbstractValidator<ContactDto>
    {
        public ContactMessageValidator()
        {
            RuleFor(x => x.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Wrong email format.");

            RuleFor(x => x.Title).NotEmpty().WithMessage("Message Title is required.");

            RuleFor(x => x.Message).NotEmpty().WithMessage("Message Title is required.");
        }
    }
}
