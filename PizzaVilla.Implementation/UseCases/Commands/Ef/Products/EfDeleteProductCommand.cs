using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Products;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Products
{
    public class EfDeleteProductCommand : EfUseCase, IDeleteProductCommand
    {
        public int Id => 35;
        public string Name => "Delete Product (Ef)";
        public string Description => "Deletes a Product using Entity Framework.";

        private readonly DeleteProductValidator _validator;

        public EfDeleteProductCommand(PVDbContext context, DeleteProductValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var product = Context.Products.Find(id);

            Context.Remove(product);

            Context.SaveChanges();
        }
    }
}
