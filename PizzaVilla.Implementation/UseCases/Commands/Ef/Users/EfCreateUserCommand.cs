using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Users
{
    public class EfCreateUserCommand : EfUseCase, ICreateUserCommand
    {
        public int Id => 20;
        public string Name => "Create User (Ef)";
        public string Description => "Creates a new using using Entity Framework.";

        private readonly CreateUserValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateUserCommand(PVDbContext context, CreateUserValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(CreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            request.Password = BCrypt.Net.BCrypt.HashPassword(request.Password);
            request.UseCaseIds = request.UseCaseIds.Distinct();

            var user = _mapper.Map<User>(request);

            Context.Users.Add(user);

            Context.SaveChanges();
        }
    }
}
