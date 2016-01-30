using System;
using System.Collections.Generic;
using DotNetNuke.Common;
using DotNetNuke.Data;
using DotNetNuke.Framework;

namespace Intelequia.Secure.Data
{
    public class ResourceRepository : ServiceLocator<IResourceRepository, ResourceRepository>, IResourceRepository
    {

        protected override Func<IResourceRepository> GetFactory()
        {
            return () => new ResourceRepository();
        }

        /// <summary>
        /// Returns the resources of a group.
        /// </summary>
        /// <param name="resourceGroupId">Group from the resources are obtained.</param>
        /// <returns></returns>
        public IEnumerable<Resource> GetResources(Guid resourceGroupId)
        {
            IEnumerable<Resource> data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Resource>();
                data = rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}'");
            }

            return data;
        }

        /// <summary>
        /// Gets a resource by id.
        /// </summary>
        /// <param name="resourceId">Resource id that is obtained.</param>
        /// <returns></returns>
        public Resource GetResource(Guid resourceId)
        {
            Requires.NotNullOrEmpty("resourceId", resourceId.ToString());

            Resource data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Resource>();
                data = rep.GetById(resourceId);
            }

            return data;
        }

        /// <summary>
        /// Insert a resource in the database.
        /// </summary>
        /// <param name="resource">Resource that is inserted into the database.</param>
        /// <returns></returns>
        public Resource Create(Resource resource)
        {
            Requires.NotNull(resource);
            Requires.PropertyNotEqualTo("ResourceGroupId", "ResourceGroupId", resource.ResourceGroupId, Guid.Empty);
            Requires.PropertyNotNullOrEmpty(resource, "ResourceKey");
            Requires.PropertyNotNullOrEmpty(resource, "ResourceValue");


            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Resource>();

                resource.ResourceId = Guid.NewGuid();
                resource.Cd = DateTime.Now;
                resource.Cu = Common.CurrentUser.UserID;
                resource.Md = DateTime.Now;
                resource.Mu = Common.CurrentUser.UserID;

                rep.Insert(resource);
            }

            return GetResource(resource.ResourceId);
        }

        /// <summary>
        /// Upgrade a resource in the database.
        /// </summary>
        /// <param name="resource">Resource that is inserted into the database.</param>
        public Resource Update(Resource resource)
        {
            Requires.NotNull(resource);
            Requires.PropertyNotEqualTo("ResourceGroupId", "ResourceGroupId", resource.ResourceGroupId, Guid.Empty);
            Requires.PropertyNotNullOrEmpty(resource, "ResourceKey");
            Requires.PropertyNotNullOrEmpty(resource, "ResourceValue");

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Resource>();

                var oldResource = rep.GetById(resource.ResourceId);

                oldResource.ResourceKey = resource.ResourceKey;
                oldResource.ResourceValue = resource.ResourceValue;
                oldResource.Md = DateTime.Now;
                oldResource.Mu = Common.CurrentUser.UserID;

                rep.Update(oldResource);
            }

            return GetResource(resource.ResourceId);
        }

        /// <summary>
        /// Deletes a resource in the database.
        /// </summary>
        /// <param name="resourceId">Resource is deleted in the database.</param>
        public bool Delete(Guid resourceId)
        {
            Requires.NotNullOrEmpty("resourceId", resourceId.ToString());

            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Resource>();

                    var data = rep.GetById(resourceId);
                    rep.Delete(data);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}
