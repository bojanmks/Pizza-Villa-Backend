using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Commands.Orders
{
    public interface IDeleteOrderCommand : ICommand<int>
    {
    }
}
