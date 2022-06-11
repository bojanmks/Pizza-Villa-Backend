using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.InitialData;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.InitialData
{
    public class EfCreateInitialDataCommand : EfUseCase, ICreateInitialDataCommand
    {
        public int Id => 2;
        public string Name => "Create initial data (Ef)";
        public string Description => "Inserts initial data into the database using Entity Framework.";

        public EfCreateInitialDataCommand(PVDbContext context)
            : base(context)
        {

        }

        public void Execute(InitialDataDto request)
        {
            if(Context.Products.Any())
            {
                throw new UseCaseConflictException("Database already has data.");
            }

            Context.Ingredients.AddRange(request.Ingredients);
            Context.ProductCategories.AddRange(request.Categories);
            Context.Products.AddRange(request.Products);
            Context.ProductsIngredients.AddRange(request.ProductsIngredients);
            Context.Addons.AddRange(request.Addons);
            Context.Users.AddRange(request.Users);

            Context.SaveChanges();
        }
    }
}
