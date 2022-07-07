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
    public abstract class EntityConfiguration<T> : IEntityTypeConfiguration<T>
        where T : Entity
    {
        public void Configure(EntityTypeBuilder<T> builder)
        {
            builder.Property(x => x.IsActive).HasDefaultValue(false);
            builder.Property(x => x.UpdatedBy).HasMaxLength(50);

            builder.HasIndex(x => x.IsActive);

            this.ConfigureRules(builder);
        }

        public abstract void ConfigureRules(EntityTypeBuilder<T> builder);
    }
}
