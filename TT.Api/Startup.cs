using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TT.Api.Extensions;
using TT.Lib;
using TT.Lib.Configuration;
using TT.Lib.DataAccess;
using TT.Lib.Entities;
using TT.Lib.Extensions;

namespace TT.Api
{
    public class Startup
    {
        protected readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddSqlServerDb<TTDbContext, TTDbContext>()
                .AddMvc();

            var cfg = this.Configuration.GetConfig<TTConfig>();

            services
                .AddCors(options => options.AddPolicy(name: MyAllowSpecificOrigins,
                                  builder =>
                                  {
                                      builder.AllowAnyHeader()
                                             .AllowAnyMethod()
                                             .WithOrigins(cfg.Cors.Origins.ToArray())
                                             .SetIsOriginAllowed((host) => true)
                                             .AllowCredentials();
                                  })) // TODO from config
                .AddHttpContextAccessor()
                .AddControllers(options =>
                {
                    //options.Filters.Add(new AuthorizeFilter());
                })
                .AddControllersAsServices()
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                    options.SerializerSettings.DefaultValueHandling = DefaultValueHandling.Ignore;
                    options.SerializerSettings.Formatting = Formatting.Indented;
                });

            services
                .AddScoped<IBrandRepository<Brand>, BrandRepository>()
                .AddScoped<IBrandService, BrandService>()
                .AddScoped<IProductRepository<Product>, ProductRepository>()
                .AddScoped<IProductService, ProductService>()
                .AddScoped<IPropertyRepository<Property>, PropertyRepository>()
                .AddScoped<IPropertyService, PropertyService>()
                .AddScoped<IProductPropertyRepository<ProductProperty>, ProductPropertyRepository>()
                .AddScoped<IProductPropertyService, ProductPropertyService>();
            services
                .AddEndpointsApiExplorer()
                .AddSwaggerGen();

        }



        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            var cfg = this.Configuration.GetConfig<TTConfig>();

            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().WithOrigins(cfg.Cors.Origins.ToArray()).AllowCredentials());

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();


            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
