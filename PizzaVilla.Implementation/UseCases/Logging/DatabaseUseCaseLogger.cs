using PizzaVilla.Application.UseCases.Logging;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.UseCases.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private PVDbContext _context;

        public DatabaseUseCaseLogger(PVDbContext context)
        {
            _context = context;
        }

        public void Log(UseCaseLog log)
        {
            _context.AuditLog.Add(new AuditLog { 
                UserId = log.UserId,
                Identity = log.Identity,
                IsAuthorized = log.IsAuthorized,
                Data = log.Data,
                UseCaseName = log.UseCaseName,
                ExecutionDateTime = log.ExecutionDateTime
            });

            _context.SaveChanges();
        }
    }
}
