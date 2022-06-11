using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.Emails
{
    public interface IEmailSender
    {
        void Send(MailMessage mail);
    }
}
