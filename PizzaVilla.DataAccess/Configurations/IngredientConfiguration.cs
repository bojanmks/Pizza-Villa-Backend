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
    public class IngredientConfiguration : EntityConfiguration<Ingredient>
    {
        public override void ConfigureRules(EntityTypeBuilder<Ingredient> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(50);

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.Products).WithOne(x => x.Ingredient).HasForeignKey(x => x.IngredientId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.CartItems).WithOne(x => x.Ingredient).HasForeignKey(x => x.IngredientId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
