using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Ingredients;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Ingredients
{
    public class EfGetIngredientsQuery : EfUseCase, IGetIngredientsQuery
    {
        public int Id => 1;
        public string Name => "Get ingredients (Ef)";
        public string Description => "Get ingredients using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetIngredientsQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<IngredientDto> Execute(BasePagedSearch request)
        {
            var query = Context.Ingredients.OrderBy(x => x.Name).Where(x => x.IsActive);

            if(!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }

            if (request.PerPage == null)
            {
                request.PerPage = 10;
            }

            if(request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<IngredientDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<IngredientDto>(x))
            };

            return response;
        }
    }
}
