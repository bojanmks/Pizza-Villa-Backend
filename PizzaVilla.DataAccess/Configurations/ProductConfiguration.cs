using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.DataAccess.Configurations
{
    public class ProductConfiguration : EntityConfiguration<Product>
    {
        public override void ConfigureRules(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(50);
            builder.Property(x => x.Image).IsRequired().HasMaxLength(100);

            builder.HasIndex(x => x.Name);
            builder.HasIndex(x => x.Price);
            builder.HasIndex(x => x.CategoryId);
            //builder.HasIndex(x => new { x.Name, x.CategoryId }).IsUnique();

            builder.HasOne(x => x.Category).WithMany(x => x.Products).HasForeignKey(x => x.CategoryId);
            builder.HasMany(x => x.Ingredients).WithOne(x => x.Product).HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Cascade);
            builder.HasMany(x => x.CartItems).WithOne(x => x.Product).HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
