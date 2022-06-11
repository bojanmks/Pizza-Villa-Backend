using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.Queries.Responses
{
    public class PagedResponse<T>
        where T : class
    {
        public int TotalCount { get; set; }
        public int Page { get; set; }
        public int PerPage { get; set; }
        public int TotalPages => (int)Math.Ceiling((float)TotalCount / PerPage);
        public IEnumerable<T> Data { get; set; }
    }
}
