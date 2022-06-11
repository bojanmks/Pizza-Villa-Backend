using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Users;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Users
{
    public class EfFindUserQuery : EfUseCase, IFindUserQuery
    {
        public int Id => 19;
        public string Name => "Find User (Ef)";
        public string Description => "Returns a user with the given id using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindUserQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public UserDetailedDto Execute(int id)
        {
            var user = Context.Users.Find(id);

            if(user == null)
            {
                throw new EntityNotFoundException("User", id);
            }

            return _mapper.Map<UserDetailedDto>(user);
        }
    }
}
