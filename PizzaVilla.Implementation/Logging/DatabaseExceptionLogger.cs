using PizzaVilla.Application.Logging;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Implementation.Logging
{
    public class DatabaseExceptionLogger : IExceptionLogger
    {
        private PVDbContext _context;
        public DatabaseExceptionLogger(PVDbContext context)
        {
            _context = context;
        }

        public void Log(Exception ex)
        {
            _context.ErrorLog.Add(new ErrorLog {
                Message = ex.Message,
                StackTrace = ex.StackTrace
            });

            _context.SaveChanges();
        }
    }
}
