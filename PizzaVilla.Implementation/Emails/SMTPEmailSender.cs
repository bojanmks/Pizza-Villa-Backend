using PizzaVilla.Application.Emails;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Emails
{
    public class SMTPEmailSender : IEmailSender
    {
        private readonly EmailCredentials _credentials;

        public SMTPEmailSender(EmailCredentials credentials)
        {
            _credentials = credentials;
        }

        public void Send(Application.Emails.MailMessage mail)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential(_credentials.Email, _credentials.Password);
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;

            var mailMessage = new System.Net.Mail.MailMessage(mail.From, mail.To, mail.Title, mail.Body);

            smtpClient.Send(mailMessage);
        }
    }
}
