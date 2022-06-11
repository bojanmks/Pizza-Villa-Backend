using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Addons;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Addons
{
    public class EfFindAddonQuery : EfUseCase, IFindAddonQuery
    {
        public int Id => 10;
        public string Name => "Find Addon (Ef)";
        public string Description => "Returns an addon with the given id using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindAddonQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public AddonAdminDto Execute(int id)
        {
            var addon = Context.Addons.Find(id);

            if (addon == null)
            {
                throw new EntityNotFoundException("Addon", id);
            }

            return _mapper.Map<AddonAdminDto>(addon);
        }
    }
}
