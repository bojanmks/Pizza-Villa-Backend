using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Products;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Products
{
    public class EfGetProductsQuery : EfUseCase, IGetProductsQuery
    {
        public int Id => 24;
        public string Name => "Get Products (Ef)";
        public string Description => "Returns Products using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetProductsQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<ProductDto> Execute(ProductSearch request)
        {
            var query = Context.Products.OrderBy(x => x.Name).Where(x => x.IsActive);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword) || x.Ingredients.Any(i => i.Ingredient.Name.Contains(request.Keyword)));
            }

            if(request.CategoryIds != null && request.CategoryIds.Any())
            {
                query = query.Where(x => request.CategoryIds.Contains(x.CategoryId));
            }

            if(request.SortOrder != null)
            {
                switch(request.SortOrder)
                {
                    case ProductsOrder.NameAsc:
                        query = query.OrderBy(x => x.Name);
                        break;
                    case ProductsOrder.NameDesc:
                        query = query.OrderByDescending(x => x.Name);
                        break;
                    case ProductsOrder.PriceAsc:
                        query = query.OrderBy(x => x.Price);
                        break;
                    case ProductsOrder.PriceDesc:
                        query = query.OrderByDescending(x => x.Price);
                        break;
                }
            }

            if (request.PerPage == null)
            {
                request.PerPage = 8;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<ProductDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).ToList().Select(x => _mapper.Map<ProductDto>(x))
            };

            return response;
        }
    }
}
