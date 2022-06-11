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
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, OrderDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.User, dest.User));

            CreateMap<Order, OrderDetailedDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.User, dest.User))
                .AfterMap((src, dest, context) => dest.Items = src.CartItems.Select(x => context.Mapper.Map<CartDto>(x)));

            CreateMap<CreateOrderDto, Order>();
        }
    }
}
