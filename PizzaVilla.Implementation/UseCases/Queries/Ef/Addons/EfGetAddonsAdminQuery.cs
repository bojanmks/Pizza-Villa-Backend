using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Addons;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Addons
{
    public class EfGetAddonsAdminQuery : EfUseCase, IGetAddonsAdminQuery
    {
        public int Id => 11;
        public string Name => "Get Addons for Administrators (Ef)";
        public string Description => "Returns addons with information important to administrators using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetAddonsAdminQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<AddonAdminDto> Execute(BasePagedSearch request)
        {
            var query = Context.Addons.OrderBy(x => x.Name).AsQueryable();

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

            var response = new PagedResponse<AddonAdminDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<AddonAdminDto>(x))
            };

            return response;
        }
    }
}
