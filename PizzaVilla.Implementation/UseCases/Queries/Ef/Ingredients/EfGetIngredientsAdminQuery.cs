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
    public class EfGetIngredientsAdminQuery : EfUseCase, IGetIngredientsAdminQuery
    {
        public int Id => 4;
        public string Name => "Get ingredients for administrators (Ef)";
        public string Description => "Get ingredients with data important for administrators using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetIngredientsAdminQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<IngredientAdminDto> Execute(BasePagedSearch request)
        {
            var query = Context.Ingredients.OrderBy(x => x.Name).AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }

            if (request.PerPage == null)
            {
                request.PerPage = 15;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<IngredientAdminDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<IngredientAdminDto>(x))
            };

            return response;
        }
    }
}
