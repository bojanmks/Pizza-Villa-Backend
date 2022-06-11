using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace PizzaVilla.Application.UseCases.DTO.Searches
{
    public class BaseSearch
    {
        public string Keyword { get; set; }
    }

    public class PagedSearch
    {
        public int? PerPage { get; set; }
        public int? Page { get; set; }

        [BindNever]
        public int ToSkip { get
            {
                if (Page == null || PerPage == null)
                    return 0;

                return (Page.Value - 1) * PerPage.Value;
            } 
        }
    }

    public class BasePagedSearch : PagedSearch
    {
        public string Keyword { get; set; }
    }
}
