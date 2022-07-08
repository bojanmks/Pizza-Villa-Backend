using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Users
{
    public class EfUpdateUserCommand : EfUseCase, IUpdateUserCommand
    {
        public int Id => 21;
        public string Name => "Update User (Ef)";
        public string Description => "Update User using Entity Framework.";

        private readonly UpdateUserValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateUserCommand(PVDbContext context, UpdateUserValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(UpdateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = Context.Users.Find(request.Id);

            if(!string.IsNullOrEmpty(request.Data.Password))
            {
                request.Data.Password = BCrypt.Net.BCrypt.HashPassword(request.Data.Password);
            }
            
            request.Data.UseCaseIds = request.Data.UseCaseIds.Distinct();

            _mapper.Map(request.Data, user);

            Context.SaveChanges();
        }
    }
}
