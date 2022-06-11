using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Products;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Products
{
    public class EfCreateProductCommand : EfUseCase, ICreateProductCommand
    {
        public int Id => 33;
        public string Name => "Create Product (Ef)";
        public string Description => "Create a new Product using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly CreateProductValidator _validator;

        public EfCreateProductCommand(PVDbContext context, IMapper mapper, CreateProductValidator validator)
            : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(CreateProductDto request)
        {
            request.IngredientIds = request.IngredientIds.Distinct();

            _validator.ValidateAndThrow(request);

            Context.Add(_mapper.Map<Product>(request));

            Context.SaveChanges();
        }
    }
}
