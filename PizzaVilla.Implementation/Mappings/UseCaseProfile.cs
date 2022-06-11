using AutoMapper;
using PizzaVilla.Application.UseCases;
using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Mappings
{
    public class UseCaseProfile : Profile
    {
        public UseCaseProfile()
        {
            CreateMap<IUseCase, UseCaseDto>();
        }
    }
}
