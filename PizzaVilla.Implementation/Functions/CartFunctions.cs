using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using PizzaVilla.Domain;

namespace PizzaVilla.Implementation.Functions
{
    public static class CartFunctions
    {
        public static IQueryable<Cart> GetUsersCart(PVDbContext context, int userId)
        {
            return context.Cart.Where(x =>
                    ((x.Ingredients.Any() && x.Ingredients.All(i => i.Ingredient.IsActive.Value))
                    || (x.Product != null && x.Product.IsActive.Value))
                    && x.UserId == userId
                    && x.OrderId == null
                    && x.IsActive.Value
                );
        }

        public static Cart GetUnorderedCartItem(PVDbContext context, int cartId, int userId)
        {
            return context.Cart.FirstOrDefault(x => x.Id == cartId 
                                                    && x.UserId == userId 
                                                    && x.OrderId == null 
                                                    && x.IsActive.Value
                                              );
        }
    }
}
