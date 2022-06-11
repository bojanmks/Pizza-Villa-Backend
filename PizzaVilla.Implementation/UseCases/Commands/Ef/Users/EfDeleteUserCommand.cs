using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Users
{
    public class EfDeleteUserCommand : EfUseCase, IDeleteUserCommand
    {
        public int Id => 22;
        public string Name => "Delete User (Ef)";
        public string Description => "Deletes a User with the given id using Entity Framework.";

        private readonly DeleteUserValidator _validator;

        public EfDeleteUserCommand(PVDbContext context, DeleteUserValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var user = Context.Users.Find(id);

            Context.Users.Remove(user);

            Context.SaveChanges();
        }
    }
}
