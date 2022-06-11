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
    public class OrderConfiguration : EntityConfiguration<Order>
    {
        public override void ConfigureRules(EntityTypeBuilder<Order> builder)
        {
            builder.HasIndex(x => x.UserId);
            builder.HasIndex(x => x.TotalPrice);

            builder.HasOne(x => x.User).WithMany(x => x.Orders).HasForeignKey(x => x.UserId);
            builder.HasMany(x => x.CartItems).WithOne(x => x.Order).HasForeignKey(x => x.OrderId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
