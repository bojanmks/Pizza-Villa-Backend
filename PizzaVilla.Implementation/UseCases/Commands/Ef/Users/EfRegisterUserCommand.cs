using AutoMapper;
using BCrypt.Net;
using FluentValidation;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.Emails;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.Ef.Users
{
    public class EfRegisterUserCommand : EfUseCase, IRegisterUserCommand
    {
        public int Id => 3;
        public string Name => "Register user (Ef)";
        public string Description => "Register user using Entity Framework";

        private readonly IEmailSender _emailSender;
        private readonly RegisterUserValidator _validator;
        private readonly IMapper _mapper;

        public EfRegisterUserCommand(PVDbContext context, RegisterUserValidator validator, IEmailSender emailSender, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _emailSender = emailSender;
            _mapper = mapper;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            request.Password = BCrypt.Net.BCrypt.HashPassword(request.Password);

            var user = _mapper.Map<User>(request);

            user.UseCases = UseCaseConstants.RegularUserUseCaseIds.Select(x => new UsersUseCases { 
                UseCaseId = x
            }).ToList();

            Context.Users.Add(user);
            Context.SaveChanges();

            _emailSender.Send(new MailMessage
            {
                To = request.Email,
                From = "contact@bojanmaksimovic.com",
                Title = "Successful registration.",
                Body = "Dear " + request.Username + "\n\nYour PizzaVilla account was created successfully."
            });
        }
    }
}
