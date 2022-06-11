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
    public class EfMarkOrderAsDeliveredCommand : EfUseCase, IMarkOrderAsDeliveredCommand
    {
        public int Id => 45;
        public string Name => "Mark Order as Delivered (Ef)";
        public string Description => "Marks an order as Delivered using Entity Framework.";

        private readonly MarkOrderAsDeliveredValidator _validator;

        public EfMarkOrderAsDeliveredCommand(PVDbContext context, MarkOrderAsDeliveredValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var order = Context.Orders.FirstOrDefault(x => x.Id == id);

            order.DeliveredAt = DateTime.UtcNow;

            Context.SaveChanges();
        }
    }
}
