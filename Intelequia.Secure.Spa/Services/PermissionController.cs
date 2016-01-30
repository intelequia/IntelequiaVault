using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Common;
using DotNetNuke.Security;
using DotNetNuke.Web.Api;
using Intelequia.Secure.Data;
using Intelequia.Secure.Spa.Services.ViewModels;

namespace Intelequia.Secure.Spa.Services
{

    /// <summary>
    /// ContentTypeController provides the Web Services to manage Data Types
    /// </summary>
    [SupportedModules("Intelequia.Secure.Spa")]
    [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
    public class PermissionController : DnnApiController
    {

        private readonly IPermissionRepository _repository;

        /// <summary>
        /// Default Constructor constructs a new PermissionController
        /// </summary>
        public PermissionController() : this(PermissionRepository.Instance)
        {

        }

        /// <summary>
        /// Constructor constructs a new PermissionController with a passed in repository
        /// </summary>
        public PermissionController(IPermissionRepository repository)
        {
            Requires.NotNull(repository);

            _repository = repository;
        }



        #region Get

        /// <summary>
        /// Gets the permissions assigned to a group of users.
        /// </summary>
        /// <param name="userPermissions">List of users with Permissions for a resource group.</param>
        /// <param name="resourceGroupId">Id of the resource group.</param>
        /// <returns></returns>
        private static IEnumerable<PermissionViewModel> GetGroupUsersPermissions(IEnumerable<Permission> userPermissions, Guid resourceGroupId)
        {
            return userPermissions.Select(userPermission => new PermissionViewModel(userPermission, resourceGroupId)).ToList();
        }

        /// <summary>
        /// Get all system roles and permissions assigned to them in a resource group.
        /// </summary>
        /// <param name="rolePermissions">List of roles with Permissions for a resource group.</param>
        /// <param name="resourceGroupId">Id of the resource group.</param>
        /// <returns></returns>
        private static IEnumerable<PermissionViewModel> GetGroupRolesPermissions(ICollection<Permission> rolePermissions, Guid resourceGroupId)
        {
            var rolePermissionList = new List<PermissionViewModel>();

            foreach (var rol in Common.GetRoles())
            {
                // Check that there is a role in assigning group permissions
                var existsRole = (from r in rolePermissions where r.RolId == rol.RoleID select r).FirstOrDefault();

                // If the role exists adds it, if not, create it with the permissions to "false".
                rolePermissionList.Add(new PermissionViewModel(existsRole, rol, resourceGroupId));
            }

            return rolePermissionList;
        }

        /// <summary>
        /// Returns the permissions of a group.
        /// </summary>
        /// <param name="resourceGroupId">Id of the group which resources are obtained.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetPermissions(Guid resourceGroupId)
        {
            try
            {
                if (!Common.HasGroupWritePermission(resourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized });

                // All the permissions assigned to the group
                var permissions = _repository.GetPermissions(resourceGroupId).ToList();

                // Permissions assigned to users
                var userPermissions = GetGroupUsersPermissions(from p in permissions where p.UserId.HasValue select p, resourceGroupId).ToList();

                // Permissions roles
                var rRolePermissions = GetGroupRolesPermissions((from p in permissions where p.RolId.HasValue select p).ToList(), resourceGroupId);

                return Request.CreateResponse(HttpStatusCode.OK, new { Success = true, RolePermissions = rRolePermissions.OrderBy(x => x.RoleName), UserPermissions = userPermissions.OrderBy(x => x.UserDisplayName) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }


        /// <summary>
        /// Returns a permit.
        /// </summary>
        /// <param name="permissionId">Resource id you obtained.</param>
        /// <param name="resourceGroupId">Group to which it belongs.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetPermission(int permissionId, Guid resourceGroupId)
        {
            try
            {
                return !Common.HasGroupWritePermission(resourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Resource = new PermissionViewModel(_repository.GetPermission(permissionId)) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion



        #region Save

        /// <summary>
        /// Create a permit to insert into the database.
        /// </summary>
        /// <param name="viewModel">New permission to insert.</param>
        /// <returns></returns>
        private static Permission GeneratePermission(Permission viewModel)
        {
            return new Permission
            {
                PermissionId = viewModel.PermissionId,
                ResourceGroupId = viewModel.ResourceGroupId,
                UserId = viewModel.UserId,
                RolId = viewModel.RolId,
                ReadPermission = viewModel.ReadPermission,
                WritePermission = viewModel.WritePermission
            };
        }

        /// <summary>
        /// Save or updated permit a group.
        /// </summary>
        /// <param name="viewModel">Permission which inserted or updated.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Save(Permission viewModel)
        {
            try
            {
                if (!Common.HasGroupWritePermission(viewModel.ResourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new {Message = App_GlobalResources.Errors.ErrorNotAuthorized});

                var permission = viewModel.PermissionId == 0
                    ? _repository.Create(GeneratePermission(viewModel))
                    : _repository.Update(GeneratePermission(viewModel));

                return permission != null
                    ? Request.CreateResponse(HttpStatusCode.OK, new {Success = true, Permission = permission})
                    : Request.CreateResponse(HttpStatusCode.OK, new {Success = false});
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }
        
        public class UserPermission
        {
            public PermissionViewModel permission { get; set; }
            public string userName { get; set; }
        }

        /// <summary>
        /// Save a new record of user permissions for a group.
        /// </summary>
        /// <param name="submitted">Parameters to save.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage SaveUserPermission(UserPermission submitted)
        {
            try
            {
                if (!Common.HasGroupWritePermission(submitted.permission.ResourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized });

                var user = Common.GetUser(submitted.userName);

                if (user == null)
                    return Request.CreateResponse(HttpStatusCode.OK, new { Success = false, Message = App_GlobalResources.Errors.ErrorUserNotFound });

                var userPermissions = _repository.GetUserPermissions(submitted.permission.ResourceGroupId, user.UserID);

                if (userPermissions != null && userPermissions.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, new { Success = false, Message = App_GlobalResources.Errors.ErrorUserAlreadyhasPermission });

                var permission = new Permission
                {
                    ResourceGroupId = submitted.permission.ResourceGroupId,
                    UserId = user.UserID,
                    ReadPermission = submitted.permission.ReadPermission,
                    WritePermission = submitted.permission.WritePermission
                };

                return Request.CreateResponse(HttpStatusCode.OK, new { Success = _repository.Create(permission) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion



        #region Delete

        /// <summary>
        /// Deletes a permission in the database.
        /// </summary>
        /// <param name="viewModel">Permission to be deleted.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Delete(PermissionViewModel viewModel)
        {
            try
            {
                return !Common.HasGroupWritePermission(viewModel.ResourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = _repository.Delete(viewModel.PermissionId) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion



        #region CheckUser

        /// <summary>
        /// Check if a user exists.
        /// </summary>
        /// <param name="userName">User to check.</param>
        /// <param name="resourceGroupId">Id resource group to check if you have write permissions.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage CheckUser(string userName, Guid resourceGroupId)
        {
            try
            {
                return !Common.HasGroupReadPermission(resourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = Common.GetUser(userName) != null });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion

    }
}
