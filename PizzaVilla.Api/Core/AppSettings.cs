using PizzaVilla.Application.Emails;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaVilla.Api.Core
{
    public class AppSettings
    {
        public string ConnString { get; set; }
        public JwtSettings JwtSettings { get; set; }
        public EmailCredentials EmailCredentials { get; set; }
    }
}
