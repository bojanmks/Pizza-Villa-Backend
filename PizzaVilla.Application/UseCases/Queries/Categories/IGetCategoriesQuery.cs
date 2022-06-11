using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries.Categories
{
    public interface IGetCategoriesQuery : IQuery<BaseSearch, IEnumerable<ProductCategoryDto>>
    {
    }
}
