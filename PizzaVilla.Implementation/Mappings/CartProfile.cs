using AutoMapper;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Mappings
{
    public class CartProfile : Profile
    {
        public CartProfile()
        {
            CreateMap<Cart, CartDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredients, dest.Ingredients))
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Addons, dest.Addons))
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Product, dest.Product))
                .AfterMap((src, dest) =>
                {
                    if (src.Product == null)
                    {
                        dest.TotalPrice = src.Ingredients.Sum(x => x.Ingredient.Price) + (src.Addons != null && src.Addons.Any() ? src.Addons.Sum(x => x.Addon.Price) : 0) + OrderConstants.CustomOrderPrice;
                    }
                    else
                    {
                        dest.TotalPrice = src.Product.Price + (src.Addons != null && src.Addons.Any() ? src.Addons.Sum(x => x.Addon.Price) : 0);
                    }
                });

            CreateMap<AddItemToCartDto, Cart>()
                .ForMember(
                    dest => dest.Ingredients,
                    opt => opt.MapFrom(src => src.IngredientIds.Select(x => new CartIngredients
                    {
                        IngredientId = x
                    }))
                )
                .ForMember(
                    dest => dest.Addons,
                    opt => opt.MapFrom(src => src.AddonIds.Select(x => new CartAddons
                    {
                        AddonId = x
                    }))
                );
        }
    }
}
