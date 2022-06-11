using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using PizzaVilla.DataAccess.Exceptions;
using PizzaVilla.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PizzaVilla.DataAccess.Extensions
{
    public static class DbSetExtensions
    {
        public static void Deactivate(this DbContext context, Entity entity)
        {
            entity.IsActive = false;
            context.Entry(entity).State = EntityState.Modified;
        }

        public static void Deactivate<T>(this DbContext context, int id)
            where T : Entity
        {
            var entity = context.Set<T>().Find(id);

            if (entity == null)
            {
                throw new EntityNotFoundException();
            }

            entity.IsActive = false;
            context.Entry(entity).State = EntityState.Modified;
        }

        public static void Deactivate<T>(this DbContext context, IEnumerable<int> ids)
            where T : Entity
        {
            var entities = context.Set<T>().Where(x => ids.Contains(x.Id));

            foreach (var entity in entities)
            {
                entity.IsActive = false;
                context.Entry(entity).State = EntityState.Modified;
            }
        }
    }
}
