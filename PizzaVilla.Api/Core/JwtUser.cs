using PizzaVilla.Application.Constants;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaVilla.Api.Core
{
    public class JwtUser : IApplicationActor
    {
        public int? Id { get; set; }
        public string Identity { get; set; }
        public string Email { get; set; }
        public IEnumerable<int> UseCaseIds { get; set; } = new List<int>();
    }

    public class AnonimousUser : IApplicationActor
    {
        public int? Id => null;
        public string Identity => "Anonymous";
        public string Email => "anonymous@pizzavilla.com";
        public IEnumerable<int> UseCaseIds => UseCaseConstants.AnonimousUserUseCaseIds;
    }
}
