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
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<User, UserDetailedDto>()
                .ForMember(
                    dest => dest.UseCaseIds,
                    opt => opt.MapFrom(src => src.UseCases.Select(uc => uc.UseCaseId))
                );
            CreateMap<CreateUserDto, User>()
                .ForMember(
                    dest => dest.UseCases,
                    opt => opt.MapFrom(src => src.UseCaseIds.Select(x => new UsersUseCases {
                        UseCaseId = x
                    }))
                )
                .ForMember(
                    dest => dest.Password,
                    opt => opt.Ignore()
                )
                .AfterMap(
                    (src, dest) =>
                    {
                        if (!string.IsNullOrEmpty(src.Password))
                        {
                            dest.Password = src.Password;
                        }
                    }
                 );
            CreateMap<RegisterUserDto, User>();
        }
    }
}
