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
    public class EfFindProductQuery : EfUseCase, IFindProductQuery
    {
        public int Id => 47;
        public string Name => "Find Product (Ef)";
        public string Description => "Returns a product using Entity Framework.";

        private readonly IMapper _mapper;

        public EfFindProductQuery(PVDbContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public ProductDto Execute(int id)
        {
            var product = Context.Products.FirstOrDefault(x => x.Id == id && x.IsActive);

            if (product == null)
            {
                throw new EntityNotFoundException("Product", id);
            }

            return _mapper.Map<ProductDto>(product);
        }
    }
}
