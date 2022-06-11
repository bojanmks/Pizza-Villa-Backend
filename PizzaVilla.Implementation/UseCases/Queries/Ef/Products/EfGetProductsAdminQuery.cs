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
    public class EfGetProductsAdminQuery : EfUseCase, IGetProductsAdminQuery
    {
        public int Id => 31;
        public string Name => "Get Products for Administrators (Ef)";
        public string Description => "Returns Products with information important to administrators using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetProductsAdminQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<ProductAdminDto> Execute(BasePagedSearch request)
        {
            var query = Context.Products.OrderBy(x => x.Name).AsQueryable();

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

            var response = new PagedResponse<ProductAdminDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).ToList().Select(x => _mapper.Map<ProductAdminDto>(x))
            };

            return response;
        }
    }
}
