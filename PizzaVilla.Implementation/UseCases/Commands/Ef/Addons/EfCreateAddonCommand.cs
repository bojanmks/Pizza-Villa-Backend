using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Addons;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Addons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Addons
{
    public class EfCreateAddonCommand : EfUseCase, ICreateAddonCommand
    {
        public int Id => 12;
        public string Name => "Create Addon (Ef)";
        public string Description => "Creates a new Addon using Entity Framework.";

        private readonly CreateAddonValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateAddonCommand(PVDbContext context, CreateAddonValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(CreateAddonDto request)
        {
            _validator.ValidateAndThrow(request);

            Context.Addons.Add(_mapper.Map<Addon>(request));
            Context.SaveChanges();
        }
    }
}
