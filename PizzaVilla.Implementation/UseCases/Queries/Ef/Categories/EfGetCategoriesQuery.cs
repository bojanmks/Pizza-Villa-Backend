using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Categories;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Categories
{
    public class EfGetCategoriesQuery : EfUseCase, IGetCategoriesQuery
    {
        public int Id => 25;
        public string Name => "Get Product Categories (Ef)";
        public string Description => "Returns Product Categories using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetCategoriesQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public IEnumerable<ProductCategoryDto> Execute(BaseSearch request)
        {
            var query = Context.ProductCategories.OrderBy(x => x.Name).Where(x => x.IsActive);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }

            return query.Select(x => _mapper.Map<ProductCategoryDto>(x)).ToList();
        }
    }
}
