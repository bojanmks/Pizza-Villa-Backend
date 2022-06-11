using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.Exceptions
{
    public class ForbiddenUseCaseException : Exception
    {
        public ForbiddenUseCaseException(string useCaseName, string identity) :
            base($"User {identity} has tried to execute {useCaseName} without authorization.")
        {

        }
    }
}
