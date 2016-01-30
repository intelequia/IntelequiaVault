using System;
using System.Collections.Generic;

namespace Intelequia.Secure.Data
{
    public interface IGroupRepository
    {

        /// <summary>
        /// Returns resource groups found..
        /// </summary>
        /// <param name="tags">Texto para buscar en el nombre de los recursos.</param>
        /// <param name="sortField">Campo de ordenación.</param>
        /// <param name="sortOrder">Dirección de la ordenación.</param>
        /// <returns></returns> 
        IEnumerable<Group> GetGroups(string tags, string sortField, string sortOrder);

        /// <summary>
        /// Returns resource groups found for a portal (used in data export).
        /// </summary>
        /// <param name="portalId">The portal Id.</param>
        /// <returns></returns>
        IEnumerable<Group> GetGroups(int portalId);

        /// <summary>
        /// Gets a resource group by id.
        /// </summary>
        /// <param name="resourceGroupId">Id of the resource group that is obtained.</param>
        /// <returns></returns>
        Group GetGroup(Guid resourceGroupId);

        /// <summary>
        /// Insert a group in the database
        /// </summary>
        /// <param name="group">New group to insert.</param>
        /// <returns></returns>
        Group Create(Group group);

        /// <summary>
        /// Upgrade a resource group.
        /// </summary>
        /// <param name="group">Group that is updated.</param>
        /// <returns></returns>
        Group Update(Group group);

        /// <summary>
        /// Delete a record from the database.
        /// </summary>
        /// <param name="groupId">Id of the record that is deleted.</param>
        /// <returns></returns>
        bool Delete(Guid groupId);

        /// <summary>
        /// Create an imported record in the database.
        /// </summary>
        /// <param name="group">Group that is imported.</param>
        /// <returns></returns>
        Group ImportCreate(Group group);
    }
}