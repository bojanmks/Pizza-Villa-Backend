using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.UseCases.Commands.Addons;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Addons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Addons
{
    public class EfUpdateAddonCommand : EfUseCase, IUpdateAddonCommand
    {
        public int Id => 13;
        public string Name => "Update Addon (Ef)";
        public string Description => "Update an Addon using Entity Framework.";

        private readonly UpdateAddonValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateAddonCommand(PVDbContext context, UpdateAddonValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(UpdateAddonDto request)
        {
            _validator.ValidateAndThrow(request);

            var addon = Context.Addons.Find(request.Id);

            _mapper.Map(request.Data, addon);

            Context.SaveChanges();
        }
    }
}
