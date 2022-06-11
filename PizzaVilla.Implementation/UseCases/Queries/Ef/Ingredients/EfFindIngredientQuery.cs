using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Ingredients;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Ingredients
{
    public class EfFindIngredientQuery : EfUseCase, IFindIngredientQuery
    {
        public int Id => 5;
        public string Name => "Find ingredient (Ef)";
        public string Description => "Get data about one ingredient using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindIngredientQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public IngredientAdminDto Execute(int id)
        {
            var ingredient = Context.Ingredients.Find(id);

            if(ingredient == null)
            {
                throw new EntityNotFoundException("Ingredient", id);
            }

            return _mapper.Map<IngredientAdminDto>(ingredient);
        }
    }
}
