using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.AuditLog;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.AuditLog
{
    public class EfGetAuditLogQuery : EfUseCase, IGetAuditLogQuery
    {
        public int Id => 15;
        public string Name => "Get Audit Log (Ef)";
        public string Description => "Returns Audit Log entries using Entity Framework.";

        private readonly IMapper _mapper;

        public EfGetAuditLogQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public PagedResponse<AuditLogDto> Execute(BasePagedDateSearch request)
        {
            var query = Context.AuditLog.OrderByDescending(x => x.ExecutionDateTime).AsQueryable();

            if(!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Identity.Contains(request.Keyword) || x.UseCaseName.Contains(request.Keyword));
            }

            if(request.DateFrom != null)
            {
                query = query.Where(x => x.ExecutionDateTime >= request.DateFrom);
            }

            if (request.DateTo != null)
            {
                query = query.Where(x => x.ExecutionDateTime <= request.DateTo);
            }

            if (request.PerPage == null)
            {
                request.PerPage = 15;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<AuditLogDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<AuditLogDto>(x))
            };

            return response;
        }
    }
}
