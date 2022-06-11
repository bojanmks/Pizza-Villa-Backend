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
    public class ErrorLogProfile : Profile
    {
        public ErrorLogProfile()
        {
            CreateMap<ErrorLog, ErrorLogDto>();
        }
    }
}
