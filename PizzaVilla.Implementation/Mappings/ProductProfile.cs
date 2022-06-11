using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;

namespace PizzaVilla.Implementation.Mappings
{
    public class ProductProfile : Profile
    {
        public ProductProfile()
        {
            CreateMap<Product, ProductDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredients, dest.Ingredients))
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Category, dest.Category));

            CreateMap<Product, ProductAdminDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredients, dest.Ingredients))
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Category, dest.Category));

            CreateMap<CreateProductDto, Product>()
                .ForMember(
                    dest => dest.Image,
                    opt => opt.MapFrom((src, dest) => {
                        if (src.ImageName != null)
                        {
                            return src.ImageName;
                        }
                        else
                        {
                            return dest.Image;
                        }
                    })
                )
                .ForMember(
                    dest => dest.Ingredients,
                    opt => opt.MapFrom(src => src.IngredientIds.Select(x => new ProductsIngredients { 
                        IngredientId = x
                    }))
                );
        }
    }
}
