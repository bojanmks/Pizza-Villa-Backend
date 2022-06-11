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
    public class AddonConfiguration : EntityConfiguration<Addon>
    {
        public override void ConfigureRules(EntityTypeBuilder<Addon> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(50);

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.CartItems).WithOne(x => x.Addon).HasForeignKey(x => x.AddonId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
