using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries.Ingredients
{
    public interface IFindIngredientQuery : IQuery<int, IngredientAdminDto>
    {

    }
}
