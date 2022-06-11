using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Ingredients;
using PizzaVilla.Application.UseCases.DTO;
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
    public class EfUpdateIngredientCommand : EfUseCase, IUpdateIngredientCommand
    {
        public int Id => 7;
        public string Name => "Update Ingredient (Ef)";
        public string Description => "Update Ingredient using Entity Framework.";

        private readonly UpdateIngredientValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateIngredientCommand(PVDbContext context, UpdateIngredientValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(UpdateIngredientDto request)
        {
            _validator.ValidateAndThrow(request);

            var ingredient = Context.Ingredients.Find(request.Id);

            _mapper.Map(request.Data, ingredient);

            Context.SaveChanges();
        }
    }
}
