using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using PizzaVilla.Api.Core;
using PizzaVilla.Api.Extensions;
using PizzaVilla.Application.Logging;
using PizzaVilla.Implementation.Logging;
using PizzaVilla.Application.UseCases.Logging;
using PizzaVilla.Implementation.UseCases.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PizzaVilla.Implementation;
using PizzaVilla.Application.UseCases.Queries.Ingredients;
using PizzaVilla.Implementation.UseCases.Queries.Ef;
using System.Reflection;
using System.IO;
using PizzaVilla.Application.UseCases.Commands.InitialData;
using PizzaVilla.Implementation.UseCases.Commands.Ef;
using PizzaVilla.Application.Emails;
using PizzaVilla.Implementation.Emails;
using Microsoft.AspNetCore.Http;
using AutoMapper;

namespace PizzaVilla.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var appSettings = new AppSettings();

            Configuration.Bind(appSettings);

            services.AddSingleton(appSettings);
            services.AddApplicationActor();
            services.AddJwt(appSettings);
            services.AddEmailCredentials(appSettings);
            services.AddTransient<IExceptionLogger, DatabaseExceptionLogger>();
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddUseCases();
            services.AddTransient<UseCaseHandler>();
            services.AddPVDbContext();
            services.AddTransient<IEmailSender, SMTPEmailSender>();
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddControllers();
            services.AddHttpContextAccessor();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "PizzaVilla.Api", Version = "v1" });

                var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
            });

            services.AddCors();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "PizzaVilla.Api v1"));
            }

            app.UseStaticFiles();
            app.UseRouting();
            app.UseCors(options => options.SetIsOriginAllowed((host) => true));
            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
