using System;
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
    public class GroupController : DnnApiController
    {

        private readonly IGroupRepository _repository;

        /// <summary>
        /// Default Constructor constructs a new ContactController
        /// </summary>
        public GroupController() : this(GroupRepository.Instance)
        {

        }

        /// <summary>
        /// Constructor constructs a new ContactController with a passed in repository
        /// </summary>
        public GroupController(IGroupRepository repository)
        {
            Requires.NotNull(repository);

            _repository = repository;
        }



        # region Get

        /// <summary>
        /// Returns resource groups found.
        /// </summary>
        /// <param name="tags">Search parameters.</param>
        /// <param name="sortField">Sort field.</param>
        /// <param name="sortOrder">Address management.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetGroups(string tags, string sortField, string sortOrder)
        {
            try
            {
                if (!Common.IsLoggedUser())
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized });

                var groupsList = _repository.GetGroups(tags, sortField, sortOrder);

                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Success = true,
                    Groups = groupsList.Select(group => new GroupViewModel(group, ActiveModule.ModuleID)).ToList(),
                    AddGroupUrl = Components.Common.NewGroupUrl(ActiveModule.ModuleID),
                    CurrentUserIsAdministrator = Common.IsAdministrator()
                });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        /// <summary>
        /// Returns a group.
        /// </summary>
        /// <param name="resourceGroupId">Group Id.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetGroup(Guid resourceGroupId)
        {
            try
            {
                return !Common.HasGroupReadPermission(resourceGroupId)
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized, PostBackUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID) })
                    : Request.CreateResponse(HttpStatusCode.OK, new {
                        Success = true,
                        Group = resourceGroupId.Equals(Guid.Empty) 
                            ? new GroupViewModel {
                                ResourceGroupId = resourceGroupId,
                                ResourceName = string.Empty
                            } 
                            : new GroupViewModel(_repository.GetGroup(resourceGroupId), ActiveModule.ModuleID),
                        PostBackUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID),
                        CurrentUserIsAdministrator = Common.IsAdministrator()
                    });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }


        #endregion


        #region Save

        /// <summary>
        /// Create a group to insert into the database.
        /// </summary>
        /// <param name="viewModel">New group to insert.</param>
        /// <returns></returns>
        private static Group CreateGroup(GroupViewModel viewModel)
        {
            return new Group
            {
                ResourceName = viewModel.ResourceName
            };
        }

        /// <summary>
        /// Upgrade a resource group.
        /// </summary>
        /// <param name="viewModel">Group is updated.</param>
        /// <returns></returns>
        private static Group UpdateGroup(GroupViewModel viewModel)
        {
            return new Group
            {
                ResourceGroupId = viewModel.ResourceGroupId,
                ResourceName = viewModel.ResourceName
            };
        }

        /// <summary>
        /// Insert / update a group in the database.
        /// </summary>
        /// <param name="viewModel">Group saved.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Save(GroupViewModel viewModel)
        {
            try
            {
                // New group
                if (viewModel.ResourceGroupId.Equals(Guid.Empty))
                {
                    return !Common.IsAdministrator()
                        ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized })
                        : Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Group = _repository.Create(CreateGroup(viewModel)) });
                }

                // Update group
                return !Common.HasGroupWritePermission(viewModel.ResourceGroupId)
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized })
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Group = _repository.Update(UpdateGroup(viewModel)) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion


        #region Delete

        /// <summary>
        /// Deletes a group in the database.
        /// </summary>
        /// <param name="viewModel">Group to be deleted.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Delete(GroupViewModel viewModel)
        {
            try
            {
                return !Common.HasGroupWritePermission(viewModel.ResourceGroupId)
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized })
                    : Request.CreateResponse(HttpStatusCode.OK, new {
                        Success = _repository.Delete(viewModel.ResourceGroupId),
                        PostBackUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID)
                    });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion

    }
}
