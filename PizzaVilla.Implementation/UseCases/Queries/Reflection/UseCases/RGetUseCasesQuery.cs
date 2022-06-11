using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using PizzaVilla.Application.UseCases;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.DTO.Searches;
using PizzaVilla.Application.UseCases.Queries.Responses;
using PizzaVilla.Application.UseCases.Queries.UseCases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Reflection.UseCases
{
    public class RGetUseCasesQuery : IGetUseCasesQuery
    {
        public int Id => 17;
        public string Name => "Get Use Cases (Reflection)";
        public string Description => "Returns Use Cases using reflection.";

        private readonly IServiceProvider _serviceProvider;
        private readonly IMapper _mapper;

        public RGetUseCasesQuery(IServiceProvider serviceProvider, IMapper mapper)
        {
            _serviceProvider = serviceProvider;
            _mapper = mapper;
        }

        public PagedResponse<UseCaseDto> Execute(BasePagedSearch request)
        {
            var query = AppDomain.CurrentDomain.GetAssemblies().SelectMany(x => x.GetTypes())
                .Where(x => typeof(IUseCase).IsAssignableFrom(x) && !x.IsInterface && !x.IsAbstract)
                .Select(x => ((IUseCase)ActivatorUtilities.CreateInstance(_serviceProvider, x)));

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(request.Keyword.ToLower()) 
                                        || x.Description.ToLower().Contains(request.Keyword.ToLower()));
            }

            if (request.PerPage == null)
            {
                request.PerPage = 10;
            }

            if (request.Page == null)
            {
                request.Page = 1;
            }

            var response = new PagedResponse<UseCaseDto>
            {
                TotalCount = query.Count(),
                Page = request.Page.Value,
                PerPage = request.PerPage.Value,
                Data = query.OrderBy(x => x.Name).Skip(request.ToSkip).Take(request.PerPage.Value).Select(x => _mapper.Map<UseCaseDto>(x))
            };

            return response;
        }
    }
}
