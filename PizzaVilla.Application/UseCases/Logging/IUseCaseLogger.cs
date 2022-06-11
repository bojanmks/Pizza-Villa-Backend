using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Logging
{
    public interface IUseCaseLogger
    {
        public void Log(UseCaseLog log);
    }
}
