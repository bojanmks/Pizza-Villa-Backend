using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Categories;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Categories
{
    public class EfGetCategoriesAdminQuery : EfUseCase, IGetCategoriesAdminQuery
    {
        public int Id => 26;
        public string Name => "Get Product Categories for Administrators (Ef)";
        public string Description => "Returns Product Categories with information impotant to Administrators using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetCategoriesAdminQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<ProductCategoryAdminDto> Execute(BasePagedSearch request)
        {
            var query = Context.ProductCategories.OrderBy(x => x.Name).AsQueryable();

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

            var response = new PagedResponse<ProductCategoryAdminDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<ProductCategoryAdminDto>(x))
            };

            return response;
        }
    }
}
