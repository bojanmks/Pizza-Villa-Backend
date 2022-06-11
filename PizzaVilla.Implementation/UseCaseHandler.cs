using Newtonsoft.Json;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.Logging;
using PizzaVilla.Application.UseCases;
using PizzaVilla.Application.UseCases.Commands;
using PizzaVilla.Application.UseCases.Logging;
using PizzaVilla.Application.UseCases.Queries;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation
{
    public class UseCaseHandler
    {
        private IExceptionLogger _logger;
        private IApplicationActor _user;
        private IUseCaseLogger _useCaseLogger;

        public UseCaseHandler(
            IExceptionLogger logger,
            IApplicationActor user,
            IUseCaseLogger useCaseLogger)
        {
            _logger = logger;
            _user = user;
            _useCaseLogger = useCaseLogger;
        }

        public void HandleCommand<TRequest>(ICommand<TRequest> command, TRequest data)
        {
            HandleLoggingAndAuthorization(command, data);

            command.Execute(data);
            //try
            //{
            //    HandleLoggingAndAuthorization(command, data);

            //    command.Execute(data);
            //}
            //catch (Exception ex)
            //{
            //    _logger.Log(ex);
            //    throw;
            //}
        }

        public TResponse HandleQuery<TRequest, TResponse>(IQuery<TRequest, TResponse> query, TRequest data)
        {
            //try
            //{
            //    HandleLoggingAndAuthorization(query, data);

            //    var response = query.Execute(data);

            //    return response;
            //}
            //catch (Exception ex)
            //{
            //    _logger.Log(ex);
            //    throw;
            //}

            HandleLoggingAndAuthorization(query, data);

            var response = query.Execute(data);

            return response;
        }

        private void HandleLoggingAndAuthorization<TRequest>(IUseCase useCase, TRequest data)
        {
            var isAuthorized = _user.UseCaseIds.Contains(useCase.Id);

            var log = new UseCaseLog
            {
                Identity = _user.Identity,
                ExecutionDateTime = DateTime.UtcNow,
                UseCaseName = useCase.Name,
                UserId = _user.Id,
                Data = JsonConvert.SerializeObject(data),
                IsAuthorized = isAuthorized
            };

            _useCaseLogger.Log(log);

            if (!isAuthorized)
            {
                throw new ForbiddenUseCaseException(useCase.Name, _user.Identity);
            }
        }
    }
}
