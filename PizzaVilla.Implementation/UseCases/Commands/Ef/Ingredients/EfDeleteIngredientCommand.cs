using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Ingredients;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Ingredients;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Ingredients
{
    public class EfDeleteIngredientCommand : EfUseCase, IDeleteIngredientCommand
    {
        public int Id => 8;
        public string Name => "Delete Ingredient (Ef)";
        public string Description => "Deletes an ingredient with the given id using Entity Framework.";

        private readonly DeleteIngredientValidator _validator;

        public EfDeleteIngredientCommand(PVDbContext context, DeleteIngredientValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public void Execute(int id)
        {
            _validator.ValidateAndThrow(id);

            var ingredient = Context.Ingredients.Find(id);

            Context.Ingredients.Remove(ingredient);

            Context.SaveChanges();
        }
    }
}
