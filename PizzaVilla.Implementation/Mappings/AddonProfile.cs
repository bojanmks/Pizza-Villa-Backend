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
    public class AddonProfile : Profile
    {
        public AddonProfile()
        {
            CreateMap<Addon, AddonDto>();
            CreateMap<Addon, AddonAdminDto>();

            CreateMap<CartAddons, AddonDto>()
                .AfterMap((src, dest, context) => context.Mapper.Map(src.Addon, dest));

            CreateMap<CreateAddonDto, Addon>();
        }
    }
}
