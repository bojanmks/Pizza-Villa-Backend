using AutoMapper;
using PizzaVilla.Application.Emails;
using PizzaVilla.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Mappings
{
    public class ContactProfile : Profile
    {
        public ContactProfile()
        {
            CreateMap<ContactDto, MailMessage>()
                .ForMember(
                    dest => dest.Body,
                    opt => opt.MapFrom(src => src.Message)
                );
        }
    }
}
