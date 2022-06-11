using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Products;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Products
{
    public class EfUpdateProductCommand : EfUseCase, IUpdateProductCommand
    {
        public int Id => 34;
        public string Name => "Update Product (Ef)";
        public string Description => "Update an existing Product using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly UpdateProductValidator _validator;

        public EfUpdateProductCommand(PVDbContext context, IMapper mapper, UpdateProductValidator validator)
            : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(UpdateProductDto request)
        {
            request.Data.IngredientIds = request.Data.IngredientIds.Distinct();

            _validator.ValidateAndThrow(request);

            var product = Context.Products.Find(request.Id);

            _mapper.Map(request.Data, product);

            Context.SaveChanges();
        }
    }
}
