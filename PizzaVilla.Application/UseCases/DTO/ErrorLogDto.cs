using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO
{
    public class ErrorLogDto : BaseDto
    {
        public string Message { get; set; }
        public string StackTrace { get; set; }
        public DateTime OccuredAt { get; set; }
    }
}
