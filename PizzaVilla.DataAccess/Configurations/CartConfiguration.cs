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
    public class CartConfiguration : EntityConfiguration<Cart>
    {
        public override void ConfigureRules(EntityTypeBuilder<Cart> builder)
        {
            builder.Property(x => x.Amount).HasDefaultValue(1);

            builder.HasIndex(x => x.UserId);

            builder.HasOne(x => x.User).WithMany(x => x.CartItems).HasForeignKey(x => x.UserId);
            builder.HasOne(x => x.Product).WithMany(x => x.CartItems).HasForeignKey(x => x.ProductId);
            builder.HasOne(x => x.Order).WithMany(x => x.CartItems).HasForeignKey(x => x.OrderId);
            builder.HasMany(x => x.Ingredients).WithOne(x => x.CartItem).HasForeignKey(x => x.CartId).OnDelete(DeleteBehavior.Cascade);
            builder.HasMany(x => x.Addons).WithOne(x => x.CartItem).HasForeignKey(x => x.CartId).OnDelete(DeleteBehavior.Cascade);
        }
    }
}
