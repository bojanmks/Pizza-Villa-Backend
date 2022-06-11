using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using PizzaVilla.Api.Core;
using PizzaVilla.Application.Emails;
using PizzaVilla.Implementation.Mappings;
using PizzaVilla.Application.UseCases.Commands.Addons;
using PizzaVilla.Application.UseCases.Commands.Ingredients;
using PizzaVilla.Application.UseCases.Commands.InitialData;
using PizzaVilla.Application.UseCases.Commands.Users;
using PizzaVilla.Application.UseCases.Queries.Addons;
using PizzaVilla.Application.UseCases.Queries.AuditLog;
using PizzaVilla.Application.UseCases.Queries.ErrorLog;
using PizzaVilla.Application.UseCases.Queries.Ingredients;
using PizzaVilla.Application.UseCases.Queries.UseCases;
using PizzaVilla.Application.UseCases.Queries.Users;
using PizzaVilla.DataAccess;
using PizzaVilla.Domain;
using PizzaVilla.Implementation.UseCases.Commands.Ef;
using PizzaVilla.Implementation.UseCases.Queries;
using PizzaVilla.Implementation.UseCases.Queries.Ef;
using PizzaVilla.Implementation.UseCases.Queries.Reflection;
using PizzaVilla.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PizzaVilla.Application.UseCases.Commands.Contact;
using PizzaVilla.Implementation.UseCases.Commands.SMTP;
using PizzaVilla.Application.UseCases.Queries.Products;
using PizzaVilla.Application.UseCases.Queries.Categories;
using PizzaVilla.Application.UseCases.Commands.Categories;
using PizzaVilla.Application.UseCases.Commands.Products;
using PizzaVilla.Application.UseCases.Queries.Cart;
using PizzaVilla.Application.UseCases.Commands.Cart;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Cart;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Addons;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Categories;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Ingredients;
using PizzaVilla.Implementation.UseCases.Commands.Ef.InitialData;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Products;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Users;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Categories;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Addons;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Ingredients;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Users;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Products;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Cart;
using PizzaVilla.Implementation.UseCases.Queries.Ef.AuditLog;
using PizzaVilla.Implementation.UseCases.Queries.Ef.ErrorLog;
using PizzaVilla.Implementation.UseCases.Queries.Reflection.UseCases;
using PizzaVilla.Implementation.Validators.Cart;
using PizzaVilla.Implementation.Validators.Contact;
using PizzaVilla.Implementation.Validators.Addons;
using PizzaVilla.Implementation.Validators.Categories;
using PizzaVilla.Implementation.Validators.Ingredients;
using PizzaVilla.Implementation.Validators.Products;
using PizzaVilla.Implementation.Validators.Users;
using PizzaVilla.Implementation.UseCases.Commands.SMTP.Contact;
using PizzaVilla.Application.UseCases.Queries.Orders;
using PizzaVilla.Implementation.UseCases.Queries.Ef.Orders;
using PizzaVilla.Application.UseCases.Commands.Orders;
using PizzaVilla.Implementation.UseCases.Commands.Ef.Orders;
using PizzaVilla.Implementation.Validators.Orders;

namespace PizzaVilla.Api.Extensions
{
    public static class ContainerExtensions
    {
        public static void AddPVDbContext(this IServiceCollection services)
        {
            services.AddTransient(x => {
                var optionsBuilder = new DbContextOptionsBuilder();

                optionsBuilder.UseSqlServer(x.GetService<AppSettings>().ConnString).UseLazyLoadingProxies();

                var options = optionsBuilder.Options;

                var actor = x.GetService<IApplicationActor>();

                return new PVDbContext(actor, options);
            });
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x => {
                var accessor = x.GetService<IHttpContextAccessor>();
                //var header = accessor.HttpContext.Request.Headers["Authorization"];

                var claims = accessor.HttpContext?.User;

                if (claims == null || claims.FindFirst("UserId") == null)
                {
                    return new AnonimousUser();
                }

                var actor = new JwtUser
                {
                    Email = claims.FindFirst("Email").Value,
                    Id = Int32.Parse(claims.FindFirst("UserId").Value),
                    Identity = claims.FindFirst("Username").Value,
                    UseCaseIds = JsonConvert.DeserializeObject<List<int>>(claims.FindFirst("UseCases").Value)
                };

                return actor;
            });
        }

        public static void AddJwt(this IServiceCollection services, AppSettings settings)
        {
            services.AddTransient(x =>
            {
                var context = x.GetService<PVDbContext>();

                return new JwtManager(context, settings.JwtSettings);
            });


            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = settings.JwtSettings.Issuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(settings.JwtSettings.SecretKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddEmailCredentials(this IServiceCollection services, AppSettings settings)
        {
            services.AddTransient(x =>
            {
                var emailCredentials = new EmailCredentials();

                emailCredentials.Email = settings.EmailCredentials.Email;
                emailCredentials.Password = settings.EmailCredentials.Password;

                return emailCredentials;
            });
        }

        public static void AddUseCases(this IServiceCollection services)
        {
            #region Initial Data
            services.AddTransient<ICreateInitialDataCommand, EfCreateInitialDataCommand>();
            #endregion

            #region Ingredients
            services.AddTransient<IGetIngredientsQuery, EfGetIngredientsQuery>();
            services.AddTransient<IGetIngredientsAdminQuery, EfGetIngredientsAdminQuery>();
            services.AddTransient<IFindIngredientQuery, EfFindIngredientQuery>();
            services.AddTransient<ICreateIngredientCommand, EfCreateIngredientCommand>();
            services.AddTransient<IUpdateIngredientCommand, EfUpdateIngredientCommand>();
            services.AddTransient<IDeleteIngredientCommand, EfDeleteIngredientCommand>();
            #endregion

            #region Users
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IFindUserQuery, EfFindUserQuery>();
            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            #endregion

            #region Contact
            services.AddTransient<ISendContactMessageCommand, SMTPSendContactMessageCommand>();
            #endregion

            #region Products
            services.AddTransient<IGetProductsQuery, EfGetProductsQuery>();
            services.AddTransient<IGetProductsAdminQuery, EfGetProductsAdminQuery>();
            services.AddTransient<IFindProductAdminQuery, EfFindProductAdminQuery>();
            services.AddTransient<IFindProductQuery, EfFindProductQuery>();
            services.AddTransient<ICreateProductCommand, EfCreateProductCommand>();
            services.AddTransient<IUpdateProductCommand, EfUpdateProductCommand>();
            services.AddTransient<IDeleteProductCommand, EfDeleteProductCommand>();
            #endregion

            #region Cart
            services.AddTransient<IGetCartQuery, EfGetCartQuery>();
            services.AddTransient<IAddItemToCartCommand, EfAddItemToCartCommand>();
            services.AddTransient<IIncreaseCartAmountCommand, EfIncreaseCartAmount>();
            services.AddTransient<IDecreaseCartAmountCommand, EfDecreaseCartAmountCommand>();
            services.AddTransient<ISetCartAmountCommand, EfSetCartAmountCommand>();
            services.AddTransient<IDeleteCartItemCommand, EfDeleteCartItemCommand>();
            #endregion

            #region Orders
            services.AddTransient<IGetOrdersQuery, EfGetOrdersQuery>();
            services.AddTransient<IFindOrderQuery, EfFindOrderQuery>();
            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>();
            services.AddTransient<IMarkOrderAsDeliveredCommand, EfMarkOrderAsDeliveredCommand>();
            services.AddTransient<IDeleteOrderCommand, EfDeleteOrderCommand>();
            #endregion

            #region Categories
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetCategoriesAdminQuery, EfGetCategoriesAdminQuery>();
            services.AddTransient<IFindCategoryQuery, EfFindCategoryQuery>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            #endregion

            #region Addons
            services.AddTransient<IGetAddonsQuery, EfGetAddonsQuery>();
            services.AddTransient<IGetAddonsAdminQuery, EfGetAddonsAdminQuery>();
            services.AddTransient<IFindAddonQuery, EfFindAddonQuery>();
            services.AddTransient<ICreateAddonCommand, EfCreateAddonCommand>();
            services.AddTransient<IUpdateAddonCommand, EfUpdateAddonCommand>();
            services.AddTransient<IDeleteAddonCommand, EfDeleteAddonCommand>();
            #endregion

            #region AuditLog
            services.AddTransient<IGetAuditLogQuery, EfGetAuditLogQuery>();
            #endregion

            #region ErrorLog
            services.AddTransient<IGetErrorLogQuery, EfGetErrorLogQuery>();
            #endregion

            #region UseCases
            services.AddTransient<IGetUseCasesQuery, RGetUseCasesQuery>();
            #endregion

            #region Validators
            services.AddTransient<CreateIngredientValidator>(); 
            services.AddTransient<UpdateIngredientValidator>(); 
            services.AddTransient<DeleteIngredientValidator>();

            services.AddTransient<CreateAddonValidator>();
            services.AddTransient<UpdateAddonValidator>();
            services.AddTransient<DeleteAddonValidator>();

            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<DeleteUserValidator>();

            services.AddTransient<ContactMessageValidator>();

            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<DeleteCategoryValidator>();

            services.AddTransient<CreateProductValidator>();
            services.AddTransient<UpdateProductValidator>();
            services.AddTransient<DeleteProductValidator>();

            services.AddTransient<AddItemToCartValidator>();
            services.AddTransient<SetCartAmountValidator>();
            services.AddTransient<IncreaseCartAmountValidator>();
            services.AddTransient<DecreaseCartAmountValidator>();
            services.AddTransient<DeleteCartItemValidator>();

            services.AddTransient<CreateOrderValidator>();
            services.AddTransient<DeleteOrderValidator>();
            services.AddTransient<MarkOrderAsDeliveredValidator>();
            #endregion
        }
    }
}
