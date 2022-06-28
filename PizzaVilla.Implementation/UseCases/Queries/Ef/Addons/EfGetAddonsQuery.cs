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
    public class EfGetAddonsQuery : EfUseCase, IGetAddonsQuery
    {
        public int Id => 9;
        public string Name => "Get Addons (Ef)";
        public string Description => "Get Addons using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetAddonsQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public IEnumerable<AddonDto> Execute(BaseSearch request)
        {
            var query = Context.Addons.OrderBy(x => x.Name).Where(x => x.IsActive);

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }

            var response = query.Select(x => _mapper.Map<AddonDto>(x)).ToList();

            return response;
        }
    }
}
