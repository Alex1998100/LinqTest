using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using TT.Lib.Entities;

namespace TT.Lib.ModelConfiguration
{
    public class ProductPropertyConfiguration : IEntityTypeConfiguration<ProductProperty>
    {
        public void Configure(EntityTypeBuilder<ProductProperty> builder)
        {
            builder.ToTable(nameof(ProductProperty), EntityBase.DefaultSchema);

            builder.Property(x => x.Id)
                   .ValueGeneratedOnAdd();

            builder.HasOne(x => x.Product)
               .WithMany(x => x.Properties)
               .HasForeignKey(x => x.ProductId);

            builder.HasOne(x => x.Product);

            builder.HasOne(x => x.Property);
        }
    }
}
