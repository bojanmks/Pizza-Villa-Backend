using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries
{
    public interface IQuery<TRequest, TResult> : IUseCase
    {
        public TResult Execute(TRequest request);
    }
}
