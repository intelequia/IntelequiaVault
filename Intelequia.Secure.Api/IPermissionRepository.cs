using System;
using System.Collections.Generic;

namespace Intelequia.Secure.Data
{
    public interface IPermissionRepository
    {

        /// <summary>
        /// Returns the permissions of a group.
        /// </summary>
        /// <param name="resourceGroupId">Resource from which the permits are obtained.</param>
        /// <returns></returns>
        IEnumerable<Permission> GetPermissions(Guid resourceGroupId);

        /// <summary>
        /// Gets a permission by id.
        /// </summary>
        /// <param name="permissionId">Id of the obtained permission.</param>
        /// <returns></returns>
        Permission GetPermission(int permissionId);

        /// <summary>
        /// Get permissions for a user in a group.
        /// </summary>
        /// <param name="resourceGroupId">Resource from which the permits are obtained.</param>
        /// <param name="userId">User of the permissions that will be searched in the resource group.</param>
        /// <returns></returns>
        IEnumerable<Permission> GetUserPermissions(Guid resourceGroupId, int userId);

        /// <summary>
        /// Crea un permiso.
        /// </summary>
        /// <param name="permission">Permiso que se inserta.</param>
        /// <returns></returns>
        Permission Create(Permission permission);

        /// <summary>
        /// Create a permit.
        /// </summary>
        /// <param name="permission">Permiso que se actualiza.</param>
        /// <returns></returns>
        Permission Update(Permission permission);

        /// <summary>
        /// Deletes a permit.
        /// </summary>
        /// <param name="permissionId">Id del permiso que se borra.</param>
        /// <returns></returns>
        bool Delete(int permissionId);

    }
}
