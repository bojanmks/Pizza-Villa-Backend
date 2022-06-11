using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Categories;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Categories
{
    public class EfFindCategoryQuery : EfUseCase, IFindCategoryQuery
    {
        public int Id => 27;
        public string Name => "Find Product Category (Ef)";
        public string Description => "Returns a Product Category with the given id using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindCategoryQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public ProductCategoryAdminDto Execute(int id)
        {
            var category = Context.ProductCategories.Find(id);

            if(category == null)
            {
                throw new EntityNotFoundException("Product Category", id);
            }

            return _mapper.Map<ProductCategoryAdminDto>(category);
        }
    }
}
