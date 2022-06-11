using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PizzaVilla.Application.Constants;
using PizzaVilla.Application.Exceptions;
using PizzaVilla.Application.UseCases.Commands.InitialData;
using PizzaVilla.Application.UseCases.DTO;
using PizzaVilla.Domain;
using PizzaVilla.Implementation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PizzaVilla.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InitialDataController : ControllerBase
    {
        private UseCaseHandler _handler;

        public InitialDataController(UseCaseHandler handler)
        {
            _handler = handler;
        }

        /// <summary>
        /// Inserts initial data into the database.
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        /// <response code="201">Successfull creation.</response>
        /// <response code="409">Data already exists in database.</response>
        /// <response code="500">Internal server error.</response>
        [AllowAnonymous]
        [HttpPost]
        public IActionResult Post([FromServices] ICreateInitialDataCommand command)
        {
            var data = new InitialDataDto();

            data.Categories = new List<ProductCategory> { 
                new ProductCategory
                {
                    Name = "Neapolitan pizza"
                },
                new ProductCategory
                {
                    Name = "Italian pizza"
                },
                new ProductCategory
                {
                    Name = "American pizza"
                },
                new ProductCategory
                {
                    Name = "Canadian pizza"
                },
                new ProductCategory
                {
                    Name = "Mexican pizza"
                },
                new ProductCategory
                {
                    Name = "Argentinean pizza"
                },
                new ProductCategory
                {
                    Name = "Brazilian pizza"
                }
            };

            data.Ingredients = new List<Ingredient> { 
                new Ingredient
                {
                    Name = "Marinara sauce",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Garlic",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Olive oil",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Basil",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Oregano",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "San Marzano tomato sauce",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mozzarella di bufala",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Tomato sauce",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mozzarella",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Onions",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Spinach",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Salt",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Pepper",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Egg",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Riccota",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Red peppers",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mustard",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Pat",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Salami",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Meatballs",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Cheese",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Spicy tomato sauce",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Pepperoni",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Green chili pepper slices",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mushrooms",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mozzarella cheese",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Bacon",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Basil oil",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Tomatoes",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Avocado slices",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Mexican cheese",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Ground beef",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Black beans",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Corn",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Hot chili peppers",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Sour cream",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Refried beans",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Cumin",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Cheddar cheese",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Green peppers",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Gilantro",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Taco seasoning",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Red sauce",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Red chili peppers",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Longaniza (Spanish sausage)",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Chili peppers",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Condensed milk",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Chocolate powder",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Strawberry slices",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "White cheese",
                    Price = 0.99M
                },
                new Ingredient
                {
                    Name = "Guava marmalade",
                    Price = 0.99M
                }
            };

            data.Products = new List<Product> { 
                new Product
                {
                    Name = "Marinara",
                    Image = "marinara.webp",
                    Category = data.Categories.ElementAt(0),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "Margherita",
                    Image = "margherita.webp",
                    Category = data.Categories.ElementAt(0),
                    Price = 15.99M
                },
                new Product
                {
                    Name = "Aglio e olio",
                    Image = "aglio_e_olio.webp",
                    Category = data.Categories.ElementAt(1),
                    Price = 20.99M
                },
                new Product
                {
                    Name = "Cipolla",
                    Image = "cipolla.webp",
                    Category = data.Categories.ElementAt(1),
                    Price = 21.99M
                },
                new Product
                {
                    Name = "Spinaci e Uovo",
                    Image = "spinaci_e_uovo.webp",
                    Category = data.Categories.ElementAt(1),
                    Price = 17.99M
                },
                new Product
                {
                    Name = "California Style",
                    Image = "california.webp",
                    Category = data.Categories.ElementAt(2),
                    Price = 16.99M
                },
                new Product
                {
                    Name = "Meatball",
                    Image = "meatball.webp",
                    Category = data.Categories.ElementAt(2),
                    Price = 23.99M
                },
                new Product
                {
                    Name = "Sicilian",
                    Image = "sicilian.webp",
                    Category = data.Categories.ElementAt(2),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "All-dressed",
                    Image = "all_dressed.webp",
                    Category = data.Categories.ElementAt(3),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "Canadian Pizza",
                    Image = "canadian.webp",
                    Category = data.Categories.ElementAt(3),
                    Price = 17.99M
                },
                new Product
                {
                    Name = "Toronto Style",
                    Image = "toronto_style.webp",
                    Category = data.Categories.ElementAt(3),
                    Price = 19.99M
                },
                new Product
                {
                    Name = "Avocado",
                    Image = "avocado.webp",
                    Category = data.Categories.ElementAt(4),
                    Price = 20.99M
                },
                new Product
                {
                    Name = "Chili con Carne Style",
                    Image = "chili_con_carne_style.webp",
                    Category = data.Categories.ElementAt(4),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "Taco Style",
                    Image = "taco_style.webp",
                    Category = data.Categories.ElementAt(4),
                    Price = 17.99M
                },
                new Product
                {
                    Name = "A la Parrilla",
                    Image = "a_la_parilla.webp",
                    Category = data.Categories.ElementAt(5),
                    Price = 20.99M
                },
                new Product
                {
                    Name = "Canchera",
                    Image = "canchera.webp",
                    Category = data.Categories.ElementAt(5),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "Longaniza",
                    Image = "longaniza.webp",
                    Category = data.Categories.ElementAt(5),
                    Price = 19.99M
                },
                new Product
                {
                    Name = "Brigadeiro",
                    Image = "brigadeiro.webp",
                    Category = data.Categories.ElementAt(6),
                    Price = 17.99M
                },
                new Product
                {
                    Name = "Mussarela",
                    Image = "mussarela.webp",
                    Category = data.Categories.ElementAt(6),
                    Price = 18.99M
                },
                new Product
                {
                    Name = "Romeu e Julieta",
                    Image = "romeu_e_julieta.webp",
                    Category = data.Categories.ElementAt(6),
                    Price = 20.99M
                }
            };

            data.ProductsIngredients = new List<ProductsIngredients> {
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(0),
                    Ingredient = data.Ingredients.ElementAt(0)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(0),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(0),
                    Ingredient = data.Ingredients.ElementAt(2)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(0),
                    Ingredient = data.Ingredients.ElementAt(3)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(0),
                    Ingredient = data.Ingredients.ElementAt(4)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(1),
                    Ingredient = data.Ingredients.ElementAt(2)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(1),
                    Ingredient = data.Ingredients.ElementAt(5)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(1),
                    Ingredient = data.Ingredients.ElementAt(6)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(2),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(2),
                    Ingredient = data.Ingredients.ElementAt(2)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(2),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(3),
                    Ingredient = data.Ingredients.ElementAt(4)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(3),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(3),
                    Ingredient = data.Ingredients.ElementAt(8)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(3),
                    Ingredient = data.Ingredients.ElementAt(9)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(10)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(11)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(12)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(8)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(13)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(4),
                    Ingredient = data.Ingredients.ElementAt(2)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(5),
                    Ingredient = data.Ingredients.ElementAt(14)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(5),
                    Ingredient = data.Ingredients.ElementAt(15)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(5),
                    Ingredient = data.Ingredients.ElementAt(16)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(5),
                    Ingredient = data.Ingredients.ElementAt(17)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(6),
                    Ingredient = data.Ingredients.ElementAt(17)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(6),
                    Ingredient = data.Ingredients.ElementAt(18)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(6),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(6),
                    Ingredient = data.Ingredients.ElementAt(20)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(7),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(7),
                    Ingredient = data.Ingredients.ElementAt(20)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(8),
                    Ingredient = data.Ingredients.ElementAt(21)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(8),
                    Ingredient = data.Ingredients.ElementAt(9)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(8),
                    Ingredient = data.Ingredients.ElementAt(22)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(8),
                    Ingredient = data.Ingredients.ElementAt(23)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(8),
                    Ingredient = data.Ingredients.ElementAt(24)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(9),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(9),
                    Ingredient = data.Ingredients.ElementAt(25)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(9),
                    Ingredient = data.Ingredients.ElementAt(22)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(9),
                    Ingredient = data.Ingredients.ElementAt(24)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(9),
                    Ingredient = data.Ingredients.ElementAt(26)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(10),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(10),
                    Ingredient = data.Ingredients.ElementAt(8)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(10),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(10),
                    Ingredient = data.Ingredients.ElementAt(27)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(11),
                    Ingredient = data.Ingredients.ElementAt(28)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(11),
                    Ingredient = data.Ingredients.ElementAt(29)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(11),
                    Ingredient = data.Ingredients.ElementAt(30)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(28)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(31)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(32)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(33)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(34)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(9)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(12)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(11)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(12),
                    Ingredient = data.Ingredients.ElementAt(35)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(31)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(28)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(36)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(37)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(45)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(35)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(38)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(9)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(39)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(40)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(29)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(41)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(13),
                    Ingredient = data.Ingredients.ElementAt(11)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(14),
                    Ingredient = data.Ingredients.ElementAt(42)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(14),
                    Ingredient = data.Ingredients.ElementAt(20)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(15),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(15),
                    Ingredient = data.Ingredients.ElementAt(1)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(15),
                    Ingredient = data.Ingredients.ElementAt(15)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(16),
                    Ingredient = data.Ingredients.ElementAt(28)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(16),
                    Ingredient = data.Ingredients.ElementAt(43)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(16),
                    Ingredient = data.Ingredients.ElementAt(44)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(17),
                    Ingredient = data.Ingredients.ElementAt(46)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(17),
                    Ingredient = data.Ingredients.ElementAt(47)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(17),
                    Ingredient = data.Ingredients.ElementAt(48)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(18),
                    Ingredient = data.Ingredients.ElementAt(7)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(18),
                    Ingredient = data.Ingredients.ElementAt(8)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(18),
                    Ingredient = data.Ingredients.ElementAt(4)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(19),
                    Ingredient = data.Ingredients.ElementAt(49)
                },
                new ProductsIngredients
                {
                    Product = data.Products.ElementAt(10),
                    Ingredient = data.Ingredients.ElementAt(50)
                }
            };

            data.Addons = new List<Addon> { 
                new Addon
                {
                    Name = "Ketchup",
                    Price = 0M
                },
                new Addon
                {
                    Name = "Mayonnaise",
                    Price = 0M
                },
                new Addon
                {
                    Name = "Pineapple",
                    Price = 1.49M
                },
                new Addon
                {
                    Name = "Eggs",
                    Price = 0.99M
                },
                new Addon
                {
                    Name = "Pepperoni",
                    Price = 0.99M
                },
                new Addon
                {
                    Name = "Mustard",
                    Price = 0M
                },
                new Addon
                {
                    Name = "Oregano",
                    Price = 0.99M
                },
                new Addon
                {
                    Name = "Mushrooms",
                    Price = 0.99M
                }
            };

            data.Users = new List<User>
            {
                new User
                {
                    Email = "admin@gmail.com",
                    Username = "admin01",
                    Password = BCrypt.Net.BCrypt.HashPassword("Admin123!"),
                    UseCases = UseCaseConstants.AdminUserUseCaseIds.Select(x => new UsersUseCases {
                        UseCaseId = x
                    }).ToList()
                },
                new User
                {
                    Email = "user@gmail.com",
                    Username = "user01",
                    Password = BCrypt.Net.BCrypt.HashPassword("User123!"),
                    UseCases = UseCaseConstants.RegularUserUseCaseIds.Select(x => new UsersUseCases {
                        UseCaseId = x
                    }).ToList()
                }
            };

            _handler.HandleCommand(command, data);

            return StatusCode(StatusCodes.Status201Created);
        }
    }
}
