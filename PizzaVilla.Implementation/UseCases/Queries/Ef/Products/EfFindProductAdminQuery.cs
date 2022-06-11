using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Application.UseCases.Queries.Products;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Queries.Ef.Products
{
    public class EfFindProductAdminQuery : EfUseCase, IFindProductAdminQuery
    {
        public int Id => 32;
        public string Name => "Find Product for Administrators (Ef)";
        public string Description => "Returns a product with information important to administrators using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindProductAdminQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public ProductAdminDto Execute(int id)
        {
            var product = Context.Products.Find(id);

            if (product == null)
            {
                throw new EntityNotFoundException("Product", id);
            }

            return _mapper.Map<ProductAdminDto>(product);
        }
    }
}
