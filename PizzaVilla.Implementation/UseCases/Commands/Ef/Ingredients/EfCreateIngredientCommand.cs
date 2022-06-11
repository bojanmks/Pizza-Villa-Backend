using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Ingredients;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Ingredients;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Ingredients
{
    public class EfCreateIngredientCommand : EfUseCase, ICreateIngredientCommand
    {
        public int Id => 6;
        public string Name => "Create new Ingredient (Ef)";
        public string Description => "Creates new ingredient using Entity Framework.";

        private readonly CreateIngredientValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateIngredientCommand(PVDbContext context, CreateIngredientValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(CreateIngredientDto request)
        {
            _validator.ValidateAndThrow(request);

            Context.Ingredients.Add(_mapper.Map<Ingredient>(request));
            Context.SaveChanges();
        }
    }
}
