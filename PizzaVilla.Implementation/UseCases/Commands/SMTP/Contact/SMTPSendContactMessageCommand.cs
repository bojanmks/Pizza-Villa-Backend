using AutoMapper;
using FluentValidation;
using PizzaVilla.Application.Emails;
using PizzaVilla.Application.UseCases.Commands.Contact;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Implementation.Validators;
using PizzaVilla.Implementation.Validators.Contact;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Commands.SMTP.Contact
{
    public class SMTPSendContactMessageCommand : ISendContactMessageCommand
    {
        public int Id => 23;
        public string Name => "Send Contact Message (SMTP)";
        public string Description => "Sends a Contact Message to the administrator using SMTP.";

        private readonly IEmailSender _emailSender;
        private readonly ContactMessageValidator _validator;
        private readonly IMapper _mapper;

        public SMTPSendContactMessageCommand(IEmailSender emailSender, ContactMessageValidator validator, IMapper mapper)
        {
            _emailSender = emailSender;
            _validator = validator;
            _mapper = mapper;
        }

        public void Execute(ContactDto request)
        {
            _validator.ValidateAndThrow(request);

            var mailMessage = _mapper.Map<MailMessage>(request);

            mailMessage.To = "bojanm245@gmail.com";
            mailMessage.From = "contact@bojanmaksimovic.com";
            mailMessage.Body += "\n\nSent from: " + request.Email;

            _emailSender.Send(mailMessage);
        }
    }
}
