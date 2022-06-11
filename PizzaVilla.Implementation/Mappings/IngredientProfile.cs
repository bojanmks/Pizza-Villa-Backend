using AutoMapper;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Mappings
{
    public class IngredientProfile : Profile
    {
        public IngredientProfile()
        {
            CreateMap<Ingredient, IngredientDto>();
            CreateMap<Ingredient, IngredientAdminDto>();

            CreateMap<ProductsIngredients, IngredientDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredient, dest));

            CreateMap<ProductsIngredients, IngredientAdminDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredient, dest));

            CreateMap<CartIngredients, IngredientOrderedDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Ingredient, dest));

            CreateMap<CreateIngredientDto, Ingredient>();
            
        }
    }
}
