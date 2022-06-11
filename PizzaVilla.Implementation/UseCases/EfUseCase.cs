using PizzaVilla.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases
{
    public class EfUseCase
    {
        protected EfUseCase(PVDbContext context)
        {
            this.Context = context;
        }

        protected PVDbContext Context { get; set; }
    }
}
