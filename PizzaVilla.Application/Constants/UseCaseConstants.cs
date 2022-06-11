using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.Application.Constants
{
    public static class UseCaseConstants
    {
        public static List<int> AnonimousUserUseCaseIds => new List<int> { 2, 47, 9, 1, 25, 24, 3, 23 };
        public static List<int> RegularUserUseCaseIds => new List<int> { 37, 2, 44, 39, 41, 47, 9, 36, 1, 25, 24, 38, 23, 40,  };
        public static List<int> AdminUserUseCaseIds => new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                                                                        21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 
                                                                        39, 40, 41, 42, 43, 44, 45, 46};
    }
}
