using System;
using System.Collections.Generic;

namespace Intelequia.Secure.Data
{
    public interface IResourceRepository
    {

        /// <summary>
        /// Returns the resources of a group.
        /// </summary>
        /// <param name="resourceGroupId">Group from which the resources are obtained.</param>
        /// <returns></returns>
        IEnumerable<Resource> GetResources(Guid resourceGroupId);

        /// <summary>
        /// Gets a resource by id.
        /// </summary>
        /// <param name="resourceId">Resource id that is obtained.</param>
        /// <returns></returns>
        Resource GetResource(Guid resourceId);

        /// <summary>
        /// Insert a resource in the database.
        /// </summary>
        /// <param name="resource">Resource that is inserted into the database.</param>
        /// <returns></returns>
        Resource Create(Resource resource);

        /// <summary>
        /// Upgrade a resource in the database.
        /// </summary>
        /// <param name="resource">Resource that is updated in the database.</param>
        Resource Update(Resource resource);

        /// <summary>
        /// Deletes a resource in the database.
        /// </summary>
        /// <param name="resourceId">Resource which is deleted in the database.</param>
        bool Delete(Guid resourceId);

    }
}
