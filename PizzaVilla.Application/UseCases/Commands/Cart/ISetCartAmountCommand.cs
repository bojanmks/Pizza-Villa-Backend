using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Commands.Cart
{
    public interface ISetCartAmountCommand : ICommand<SetCartAmountDto>
    {

    }
}
