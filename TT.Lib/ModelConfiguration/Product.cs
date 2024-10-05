using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using TT.Lib.Entities;

namespace TT.Lib.ModelConfiguration
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.ToTable(nameof(Product), EntityBase.DefaultSchema);

            builder.Property(x => x.Id)
                   .ValueGeneratedOnAdd();

            builder.HasMany(x => x.Properties)
                   .WithOne(x => x.Product)
                   .HasForeignKey(x => x.ProductId);
        }
    }
}
