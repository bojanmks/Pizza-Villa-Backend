using FluentValidation;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Validators.Orders
{
    public class CreateOrderValidator : AbstractValidator<CreateOrderDto>
    {
        public CreateOrderValidator(PVDbContext context, IApplicationActor user)
        {
            RuleFor(x => x)
                .Must(x => CartFunctions.GetUsersCart(context, (int)user.Id).Any())
                .WithMessage("Your cart is empty.");

            RuleFor(x => x.DeliveryAddress)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Delivery Address is requred.")
                .Matches("^(\\d{1,}) [a-zA-Z0-9\\s]+(\\,)? [a-zA-Z]+(\\,)? [A-Z]{2} [0-9]{5,6}$")
                .WithMessage("Wrong address format.");
        }
    }
}
