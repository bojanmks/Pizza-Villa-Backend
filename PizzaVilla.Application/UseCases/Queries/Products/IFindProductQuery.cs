using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries.Products
{
    public interface IFindProductQuery : IQuery<int, ProductDto>
    {
    }
}
