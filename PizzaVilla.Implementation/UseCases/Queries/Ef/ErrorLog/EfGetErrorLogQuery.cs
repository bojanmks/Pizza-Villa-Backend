using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.ErrorLog;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.ErrorLog
{
    public class EfGetErrorLogQuery : EfUseCase, IGetErrorLogQuery
    {
        public int Id => 16;
        public string Name => "Get Error Log (Ef)";
        public string Description => "Returns Error Log entries using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetErrorLogQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<ErrorLogDto> Execute(PagedDateSearch request)
        {
            var query = Context.ErrorLog.OrderBy(x => x.OccuredAt).AsQueryable();

            if (request.DateFrom != null)
            {
                query = query.Where(x => x.OccuredAt > request.DateFrom);
            }

            if (request.DateTo != null)
            {
                query = query.Where(x => x.OccuredAt < request.DateTo);
            }

            if (request.PerPage == null)
            {
                request.PerPage = 15;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<ErrorLogDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<ErrorLogDto>(x))
            };

            return response;
        }
    }
}
