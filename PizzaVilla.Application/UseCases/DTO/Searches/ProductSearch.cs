using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO.Searches
{
    public class ProductSearch : BasePagedSearch
    {
        public IEnumerable<int> CategoryIds { get; set; }
        public ProductsOrder? SortOrder { get; set; }

    }

    public enum ProductsOrder
    {
        NameAsc,
        NameDesc,
        PriceAsc,
        PriceDesc
    }
}
