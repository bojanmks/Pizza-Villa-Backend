using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Categories;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Categories
{
    public class EfDeleteCategoryCommand : EfUseCase, IDeleteCategoryCommand
    {
        public int Id => 30;
        public string Name => "Delete Category (Ef)";
        public string Description => "Deletes a Product Category with the given id using Entity Framework.";

        private readonly DeleteCategoryValidator _validator;

        public EfDeleteCategoryCommand(PVDbContext context, DeleteCategoryValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var category = Context.ProductCategories.Find(id);

            Context.ProductCategories.Remove(category);

            Context.SaveChanges();
        }
    }
}
