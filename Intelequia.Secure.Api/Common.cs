using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;
using DotNetNuke.Services.Cache;
namespace Intelequia.Secure.Data
{
    public class Common
    {


        #region User

        public static UserInfo CurrentUser => UserController.Instance.GetCurrentUserInfo();

        /// <summary>
        /// Obtains a system user.
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static string GetUserDisplayName(int userId)
        {
            var user = UserController.Instance.GetUser(PortalId, userId);

            return user == null ? string.Empty : user.DisplayName;
        }

        /// <summary>
        /// Obtains a system user.
        /// </summary>
        /// <returns></returns>
        public static UserInfo GetUser(string userName)
        {
            return UserController.GetUserByName(PortalId, userName);
        }

        #endregion



        #region Roles

        /// <summary>
        /// Obtains the system roles.
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<RoleInfo> GetRoles()
        {
            var cacheKey = $"Intelequia.Secure.Data.GetRoles|{PortalId}";
            var result = (IList<RoleInfo>)DataCache.GetCache(cacheKey);

            if (result != null) return result;

            result = RoleController.Instance.GetRoles(PortalId);

            if (result.Any())
                DataCache.SetCache(cacheKey, result, (DNNCacheDependency)(null), DateTime.UtcNow.AddDays(15), System.Web.Caching.Cache.NoSlidingExpiration);

            return result;
        }

        /// <summary>
        /// Obtains the name of a role.
        /// </summary>
        /// <param name="rolId">Role Id</param>
        /// <returns></returns>
        public static string GetRoleName(int rolId)
        {
            var rol = (from r in GetRoles() where r.RoleID == rolId select r).FirstOrDefault();

            return rol != null ? rol.RoleName : string.Empty;
        }


        #endregion



        #region Security

        /// <summary>
        /// Check if it has permission to manage the portal (Administrator).
        /// </summary>
        /// <returns></returns>
        public static bool IsAdministrator()
        {
            return (CurrentUser.IsSuperUser || CurrentUser.IsInRole("Administrators") || CurrentUser.IsInRole("IntelequiaSecureAdministrator"));
        }

        /// <summary>
        /// Check if it is a system registered user. 
        /// </summary>
        /// <returns></returns>
        public static bool IsLoggedUser()
        {
            return CurrentUser.UserID != -1;
        }

        /// <summary>
        /// Comprueba si el usuario tiene permisos de lectura en un grupo.
        /// </summary>
        /// <param name="resourceGroupId">Grupo sobre el que se comprueba si tiene permisos.</param>
        /// <returns></returns>
        public static bool HasGroupReadPermission(Guid resourceGroupId)
        {
            var userPermissions = PermissionRepository.GetUserReadPermission(resourceGroupId, CurrentUser.UserID);
            var rolPermissions = PermissionRepository.GetUserReadPermisionByRol(resourceGroupId, CurrentUser.UserID, CurrentUser.Roles);

            return userPermissions.Any() || IsAdministrator() || rolPermissions;
        }

        /// <summary>
        /// Comprueba si el usuario tiene permisos de escritura en un grupo.
        /// </summary>
        /// <param name="resourceGroupId">Grupo sobre el que se comprueba si tiene permisos.</param>
        /// <returns></returns>
        public static bool HasGroupWritePermission(Guid resourceGroupId)
        {
            var userPermissions = PermissionRepository.GetUserWritePermission(resourceGroupId, CurrentUser.UserID);
            var rolPermissions = PermissionRepository.GetUserWritePermisionByRol(resourceGroupId, CurrentUser.UserID, CurrentUser.Roles);

            return userPermissions.Any() || IsAdministrator() || rolPermissions;
        }

        #endregion



        #region Portal

        /// <summary>
        /// Current portal Id.
        /// </summary>
        public static int PortalId => PortalSettings.Current != null ? PortalSettings.Current.PortalId : 0;

        /// <summary>
        /// The key used to encrypt / decrypt parameters.
        /// </summary>
        /// <returns></returns>
        public static string GetDecryptionKey()
        {
            const string cacheKey = "Intelequia.Secure.Data.GetDecryptionKey";
            var result = (string) DataCache.GetCache(cacheKey);

            if (result != null) return result;

            var config = WebConfigurationManager.OpenWebConfiguration("~/Web.config");

            result = ((MachineKeySection) config.GetSection("system.web/machineKey")).DecryptionKey;
            DataCache.SetCache(cacheKey, result, (DNNCacheDependency) (null), DateTime.UtcNow.AddDays(30), System.Web.Caching.Cache.NoSlidingExpiration);

            return result;
        }

        #endregion
        
    }
}

