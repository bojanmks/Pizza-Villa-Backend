using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PizzaVilla.DataAccess
{
    public class PVDbContext : DbContext
    {
        public IApplicationActor Actor { get; }

        // Uncomment when migrating
        //public PVDbContext()
        //{

        //}

        public PVDbContext(IApplicationActor actor, DbContextOptions options = null)
            : base(options)
        {
            this.Actor = actor;
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);

            modelBuilder.Entity<CartAddons>().HasKey(x => new { x.CartId, x.AddonId });
            modelBuilder.Entity<CartIngredients>().HasKey(x => new { x.CartId, x.IngredientId });
            modelBuilder.Entity<ProductsIngredients>().HasKey(x => new { x.ProductId, x.IngredientId });
            modelBuilder.Entity<UsersUseCases>().HasKey(x => new { x.UserId, x.UseCaseId });
            modelBuilder.Entity<ErrorLog>().Property(x => x.Message).IsRequired();
            modelBuilder.Entity<ErrorLog>().Property(x => x.StackTrace).IsRequired();
            modelBuilder.Entity<ErrorLog>().HasIndex(x => x.OccuredAt);

            // soft delete query filter
            modelBuilder.Model.GetEntityTypes()
                       .Where(entityType => typeof(ISoftDeletable).IsAssignableFrom(entityType.ClrType))
                       .ToList()
                       .ForEach(entityType =>
                       {
                           modelBuilder.Entity(entityType.ClrType)
                           .HasQueryFilter(ConvertFilterExpression<ISoftDeletable>(e => e.DeletedBy == null, entityType.ClrType));
                       });

            base.OnModelCreating(modelBuilder);
        }

        private static LambdaExpression ConvertFilterExpression<TInterface>(
                            Expression<Func<TInterface, bool>> filterExpression,
                            Type entityType)
        {
            var newParam = Expression.Parameter(entityType);
            var newBody = ReplacingExpressionVisitor.Replace(filterExpression.Parameters.Single(), newParam, filterExpression.Body);

            return Expression.Lambda(newBody, newParam);
        }

        // Uncomment when migrating
        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=PizzaVilla;Integrated Security=True")
        //        .UseLazyLoadingProxies();
        //}

        public override int SaveChanges()
        {
            foreach (var entry in this.ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            e.UpdatedBy = Actor?.Identity;
                            break;
                        case EntityState.Deleted:
                            if (entry.Entity is ISoftDeletable sd) {
                                entry.State = EntityState.Modified;
                                sd.DeletedAt = DateTime.UtcNow;
                                sd.DeletedBy = Actor?.Identity;
                            }
                            break;
                    }
                }
                else if (entry.Entity is ErrorLog el && entry.State == EntityState.Added)
                {
                    el.OccuredAt = DateTime.UtcNow;
                }
            }

            return base.SaveChanges();
        }

        public DbSet<Addon> Addons { get; set; }
        public DbSet<AuditLog> AuditLog { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<CartAddons> CartAddons { get; set; }
        public DbSet<CartIngredients> CartIngredients { get; set; }
        public DbSet<ErrorLog> ErrorLog { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductCategory> ProductCategories { get; set; }
        public DbSet<ProductsIngredients> ProductsIngredients { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UsersUseCases> UsersUseCases { get; set; }
    }
}
