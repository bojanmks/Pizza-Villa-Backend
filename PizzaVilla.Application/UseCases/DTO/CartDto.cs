using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class CartDto : BaseDto
    {
        public ProductDto Product { get; set; }
        public IEnumerable<IngredientOrderedDto> Ingredients { get; set; }
        public IEnumerable<AddonOrderedDto> Addons { get; set; }
        public int Amount { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal? ProductPriceWhenOrdered { get; set; }
    }

    public class AddItemToCartDto
    {
        public int? ProductId { get; set; }
        public IEnumerable<int> IngredientsIds { get; set; }
        public IEnumerable<int> AddonsIds { get; set; }
    }

    public class SetCartAmountDto : BaseDto
    {
        public int Amount { get; set; }
    }
}
