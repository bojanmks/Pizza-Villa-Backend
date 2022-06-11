using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Orders;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators.Orders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Orders
{
    public class EfDeleteOrderCommand : EfUseCase, IDeleteOrderCommand
    {
        public int Id => 46;
        public string Name => "Delete Order (Ef)";
        public string Description => "Cancels an order if it hasn't been delivered yet using Entity Framework.";

        private readonly DeleteOrderValidator _validator;

        public EfDeleteOrderCommand(PVDbContext context, DeleteOrderValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var order = Context.Orders.Find(id);

            Context.Remove(order);

            Context.SaveChanges();
        }
    }
}
