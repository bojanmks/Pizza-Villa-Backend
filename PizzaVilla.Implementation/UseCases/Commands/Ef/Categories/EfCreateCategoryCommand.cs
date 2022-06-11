using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Categories;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Categories
{
    public class EfCreateCategoryCommand : EfUseCase, ICreateCategoryCommand
    {
        public int Id => 28;
        public string Name => "Create Product Category (Ef)";
        public string Description => "Creates a new Product Category using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly CreateCategoryValidator _validator;

        public EfCreateCategoryCommand(PVDbContext context, IMapper mapper, CreateCategoryValidator validator)
            : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(CreateProductCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            Context.Add(_mapper.Map<ProductCategory>(request));

            Context.SaveChanges();
        }
    }
}
