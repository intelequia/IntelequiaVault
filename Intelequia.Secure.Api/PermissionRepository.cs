using System;
using System.Collections.Generic;
using DotNetNuke.Common;
using DotNetNuke.Data;
using DotNetNuke.Framework;

namespace Intelequia.Secure.Data
{
    public class PermissionRepository : ServiceLocator<IPermissionRepository, PermissionRepository>, IPermissionRepository
    {

        protected override Func<IPermissionRepository> GetFactory()
        {
            return () => new PermissionRepository();
        }


        /// <summary>
        /// Returns the permissions of a group.
        /// </summary>
        /// <param name="resourceGroupId">Resource from where permits are collected.</param>
        /// <returns></returns>
        public IEnumerable<Permission> GetPermissions(Guid resourceGroupId)
        {
            Requires.NotNullOrEmpty("resourceGroupId", resourceGroupId.ToString());

            IEnumerable<Permission> data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();

                data = rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}'");
            }

            return data;
        }

        /// <summary>
        /// Gets a resource by id.
        /// </summary>
        /// <param name="permissionId">Id of the obtained permission..</param>
        /// <returns></returns>
        public Permission GetPermission(int permissionId)
        {
            Requires.NotNegative("permissionId", permissionId);

            Permission permission;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                permission = rep.GetById(permissionId);
            }

            return permission;
        }

        /// <summary>
        /// Get permissions for a user in a group
        /// </summary>
        /// <param name="resourceGroupId">Id of the obtained permission.</param>
        /// <param name="userId">It indicates from which user permissions are sought in a resource group.</param>
        /// <returns></returns>
        public IEnumerable<Permission> GetUserPermissions(Guid resourceGroupId, int userId)
        {
            Requires.NotNullOrEmpty("resourceGroupId", resourceGroupId.ToString());
            Requires.NotNegative("userId", userId);

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                return rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}' AND UserId = {userId}");
            }
        }

        /// <summary>
        /// Insert a permit
        /// </summary>
        /// <param name="permission">Permission to be inserted.</param>
        /// <returns></returns>
        public Permission Create(Permission permission)
        {
            Requires.NotNull(permission);
            Requires.NotNullOrEmpty("resourceGroupId", permission.ResourceGroupId.ToString());

            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Permission>();

                    permission.Cd = DateTime.Now;
                    permission.Cu = Common.CurrentUser.UserID;
                    permission.Md = DateTime.Now;
                    permission.Mu = Common.CurrentUser.UserID;

                    rep.Insert(permission);
                }

                return GetPermission(permission.PermissionId);
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Upgrade permission.
        /// </summary>
        /// <param name="permission">Permission that is updated.</param>
        /// <returns></returns>
        public Permission Update(Permission permission)
        {
            Requires.NotNull(permission);
            Requires.NotNullOrEmpty("resourceGroupId", permission.ResourceGroupId.ToString());

            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Permission>();

                    var oldPermission = rep.GetById(permission.PermissionId);

                    oldPermission.ReadPermission = permission.ReadPermission;
                    oldPermission.WritePermission = permission.WritePermission;
                    oldPermission.Md = DateTime.Now;
                    oldPermission.Mu = Common.CurrentUser.UserID;

                    rep.Update(oldPermission);
                }

                return GetPermission(permission.PermissionId); 
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Deletes a permit.
        /// </summary>
        /// <param name="permissionId">Id of the deleted permission.</param>
        /// <returns></returns>
        public bool Delete(int permissionId)
        {
            Requires.NotNegative("permissionId", permissionId);

            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Permission>();
                    var data = rep.GetById(permissionId);

                    if (data == null) return false;

                    rep.Delete(data);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Obtiene si el usuario tiene permiso de lectura para un grupo de recursos
        /// </summary>
        /// <param name="resourceGroupId">Id del permiso que se obtiene.</param>
        /// <param name="userId">Usuario del que se buscan permisos en un grupo de recursos.</param>
        /// <returns></returns>
        public static IEnumerable<Permission> GetUserReadPermission(Guid resourceGroupId, int userId)
        {
            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                return rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}' AND UserId = {userId} AND ReadPermission = 1");
            }
        }

        /// <summary>
        /// Obtiene si el usuario tiene permiso de lectura para un grupo de recursos
        /// </summary>
        /// <param name="resourceGroupId">Id del permiso que se obtiene.</param>
        /// <param name="userId">Usuario del que se buscan permisos en un grupo de recursos.</param>
        /// <returns></returns>
        public static IEnumerable<Permission> GetUserWritePermission(Guid resourceGroupId, int userId)
        {
            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                return rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}' AND UserId = {userId} AND WritePermission = 1");
            }
        }

        /// <summary>
        /// Obtiene si el usuario pertenece a un grupo con permiso de lectura para un grupo de recursos
        /// </summary>
        /// <param name="resourceGroupId">Id del permiso que se obtiene.</param>
        /// <param name="userId">Usuario del que se buscan permisos en un grupo de recursos.</param>
        /// <param name="userRoles">Roles del current user</param>
        /// <returns></returns>
        public static bool GetUserReadPermisionByRol(Guid resourceGroupId, int userId, string[] userRoles)
        {
            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                var data = rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}' AND ReadPermission = 1");
                foreach (var permission in data)
                {
                    if (permission.RolId == null) continue;

                    foreach (var rol in userRoles)
                    {
                        var rolPermission = Common.GetRoleName(permission.RolId.Value);
                        if (rolPermission == rol)
                            return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// Obtiene si el usuario pertenece a un grupo con permiso de escritura para un grupo de recursos
        /// </summary>
        /// <param name="resourceGroupId">Id del permiso que se obtiene.</param>
        /// <param name="userId">Usuario del que se buscan permisos en un grupo de recursos.</param>
        /// <returns></returns>
        public static bool GetUserWritePermisionByRol(Guid resourceGroupId, int userId, string[] userRoles)
        {
            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Permission>();
                var data = rep.Find($"WHERE ResourceGroupId = '{resourceGroupId}' AND WritePermission = 1");

                foreach (var permission in data)
                {
                    if (permission.RolId == null) continue;

                    foreach (var rol in userRoles)
                    {
                        var rolPermission = Common.GetRoleName(permission.RolId.Value);
                        if (rolPermission == rol)
                            return true;
                    }
                }
            }

            return false;
        }
    }
}
