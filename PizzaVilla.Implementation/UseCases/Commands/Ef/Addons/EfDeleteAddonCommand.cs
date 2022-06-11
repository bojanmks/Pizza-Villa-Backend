using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Addons;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Addons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Addons
{
    public class EfDeleteAddonCommand : EfUseCase, IDeleteAddonCommand
    {
        public int Id => 14;
        public string Name => "Delete Addon (Ef)";
        public string Description => "Deletes adn Addon with the given id using Entity Framework.";

        private readonly DeleteAddonValidator _validator;

        public EfDeleteAddonCommand(PVDbContext context, DeleteAddonValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var addon = Context.Addons.Find(id);

            Context.Addons.Remove(addon);

            Context.SaveChanges();
        }
    }
}
