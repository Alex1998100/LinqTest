using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using TT.Lib.Entities;
using System.IO;
using Microsoft.Extensions.Configuration.Json;

namespace TT.Lib
{
    public class TTDbContext : DbContext
    {
        string connectionString;

        public DbSet<Hardware> Hardware { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<Property> Properties { get; set; }

        public DbSet<ProductProperty> ProductProperties { get; set; }

        //public string MigrationsAssembly => "TT.Api";

        public TTDbContext(IConfiguration configuration)  
        {
            this.connectionString = configuration.GetConnectionString(typeof(TTDbContext).Name);
        }

        public TTDbContext()
        {
        }

        public string ConnectionString
        {
            get
            {
                return this.connectionString;
            }
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            bool manual = false;

            if (manual)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Directory.GetCurrentDirectory())
                   .AddJsonFile("appsettings.json")
                   .Build();
                var connectionString = "Server=localhost;Initial Catalog=tt;Integrated Security=True;TrustServerCertificate=True;";
                optionsBuilder.UseSqlServer(connectionString);
            }
            else
            {
                optionsBuilder.UseSqlServer(this.ConnectionString, sqlOptions => sqlOptions
                               .EnableRetryOnFailure(
                                   maxRetryCount: 10,
                                   maxRetryDelay: TimeSpan.FromSeconds(30),
                                   errorNumbersToAdd: null));
            }

            base.OnConfiguring(optionsBuilder);
        }
    }
}
