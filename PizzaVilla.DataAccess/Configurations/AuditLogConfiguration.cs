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
    public class AuditLogConfiguration : IEntityTypeConfiguration<AuditLog>
    {
        public void Configure(EntityTypeBuilder<AuditLog> builder)
        {
            builder.Property(x => x.Identity).IsRequired().HasMaxLength(50);
            builder.Property(x => x.UseCaseName).IsRequired().HasMaxLength(50);

            builder.HasIndex(x => x.UserId);
            builder.HasIndex(x => x.Identity);
            builder.HasIndex(x => x.ExecutionDateTime);
            builder.HasIndex(x => x.UseCaseName);

            builder.HasOne(x => x.User).WithMany(x => x.AuditLog).HasForeignKey(x => x.UserId);
        }
    }
}
