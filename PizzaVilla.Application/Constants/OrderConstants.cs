using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.Constants
{
    public static class OrderConstants
    {
        public static decimal CustomOrderPrice => 25M;
        public static int MinIngredients => 2;
        public static int MaxIngredients => 10;
        public static int MaxAddons => 10;
    }
}
