using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Categories;
using PizzaVilla.Application.UseCases.DTO;
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
    public class EfUpdateCategoryCommand : EfUseCase, IUpdateCategoryCommand
    {
        public int Id => 29;
        public string Name => "Update Product Category (Ef)";
        public string Description => "Updates an existing Product Category using Entity Framework.";

        private readonly IMapper _mapper;
        private readonly UpdateCategoryValidator _validator;

        public EfUpdateCategoryCommand(PVDbContext context, IMapper mapper, UpdateCategoryValidator validator)
            : base(context)
        {
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(UpdateProductCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = Context.ProductCategories.Find(request.Id);

            _mapper.Map(request.Data, category);

            Context.SaveChanges();
        }
    }
}
