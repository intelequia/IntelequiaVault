using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Security;
using DotNetNuke.Web.Api;
using Intelequia.Secure.Data;
using Intelequia.Secure.Spa.Services.ViewModels;
using System.Text.RegularExpressions;
using DotNetNuke.Services.Log.EventLog;

namespace Intelequia.Secure.Spa.Services
{

    /// <summary>
    /// ContentTypeController provides the Web Services to manage Data Types
    /// </summary>
    [SupportedModules("Intelequia.Secure.Spa")]
    [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
    public class ResourceController : DnnApiController
    {

        private readonly IResourceRepository _repository;

        /// <summary>
        /// Default Constructor constructs a new ContactController
        /// </summary>
        public ResourceController() : this(ResourceRepository.Instance)
        {

        }

        /// <summary>
        /// Constructor constructs a new ContactController with a passed in repository
        /// </summary>
        public ResourceController(IResourceRepository repository)
        {
            Requires.NotNull(repository);

            _repository = repository;
        }



        #region Get

        /// <summary>
        /// Returns the resources of a group.
        /// </summary>
        /// <param name="resourceGroupId">Group from which resources are obtained.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetResources(Guid resourceGroupId)
        {
            try
            {
                if (!Common.HasGroupReadPermission(resourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message =App_GlobalResources.Errors.ErrorNotAuthorized });

                var resourceList = _repository.GetResources(resourceGroupId);

                return Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Resources = resourceList.Select(resource => new ResourceViewModel(resource, ActiveModule.ModuleID)).OrderBy(x => x.ResourceKey).ToList() });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        /// <summary>
        /// Returns a resource by id.
        /// </summary>
        /// <param name="resourceId">Resource id to be obtained.</param>
        /// <param name="resourceGroupId">Group to which it belongs.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetResource(Guid resourceId, Guid resourceGroupId)
        {
            try
            {
                if (!Common.HasGroupReadPermission(resourceGroupId))
                    Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message =App_GlobalResources.Errors.ErrorNotAuthorized });

                ResourceViewModel resource;

                if (resourceId.Equals(Guid.Empty))
                    resource = new ResourceViewModel
                    {
                        ResourceId = resourceId,
                        ResourceGroupId = resourceGroupId,
                        ResourceGroupName = GroupRepository.Instance.GetGroup(resourceGroupId).ResourceName,
                        ResourceKey = string.Empty,
                        ResourceValue = string.Empty
                    };
                else
                {
                    resource = new ResourceViewModel(_repository.GetResource(resourceId), ActiveModule.ModuleID, true);

                    Components.Common.WritteEventLog($"{App_GlobalResources.Errors.Decrypted} '{resource.ResourceKey}' {App_GlobalResources.Errors.By} {Common.CurrentUser.Username} ({Common.CurrentUser.DisplayName})", EventLogController.EventLogType.ADMIN_ALERT);
                }

                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Success = true,
                    Resource = resource,
                    ResourceEncriptedValue = UrlUtils.EncryptParameter(resource.ResourceValue, Common.GetDecryptionKey()),
                    PostBackUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID)
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
        /// Create a resource to insert into the database.
        /// </summary>
        /// <param name="viewModel">New resource to insert.</param>
        /// <returns></returns>
        private static Resource CreateResource(ResourceViewModel viewModel)
        {
            return new Resource
            {
                ResourceGroupId = viewModel.ResourceGroupId,
                ResourceKey = UrlUtils.EncryptParameter(viewModel.ResourceKey, Common.GetDecryptionKey()),
                ResourceValue = string.IsNullOrEmpty(viewModel.ResourceValue) ? string.Empty : UrlUtils.EncryptParameter(viewModel.ResourceValue, Common.GetDecryptionKey())
            };
        }

        /// <summary>
        /// Upgrade a resource of resources.
        /// </summary>
        /// <param name="viewModel">Upgrade a resource of resources.</param>
        /// <returns></returns>
        private static Resource UpdateResource(ResourceViewModel viewModel)
        {
            return new Resource
            {
                ResourceId = viewModel.ResourceId,
                ResourceGroupId = viewModel.ResourceGroupId,
                ResourceKey = UrlUtils.EncryptParameter(viewModel.ResourceKey, Common.GetDecryptionKey()),
                ResourceValue = string.IsNullOrEmpty(viewModel.ResourceValue) ? string.Empty : UrlUtils.EncryptParameter(viewModel.ResourceValue, Common.GetDecryptionKey())
            };
        }

        /// <summary>
        /// Save or update a resource.
        /// </summary>
        /// <param name="viewModel">Resource that is inserted or updated.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Save(ResourceViewModel viewModel)
        {
            try
            {
                if (!Common.HasGroupWritePermission(viewModel.ResourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message =App_GlobalResources.Errors.ErrorNotAuthorized });

                var reg = new Regex(@"<script[^>]*>[\s\S]*?</script>");

                viewModel.ResourceValue = reg.Replace(viewModel.ResourceValue, "");

                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Success = true,
                    Resource = viewModel.ResourceId.Equals(Guid.Empty)
                    ? new ResourceViewModel(_repository.GetResource(_repository.Create(CreateResource(viewModel)).ResourceId), ActiveModule.ModuleID, true)
                    : new ResourceViewModel(_repository.GetResource(_repository.Update(UpdateResource(viewModel)).ResourceId), ActiveModule.ModuleID, true)
                });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion



        #region Delete

        /// <summary>
        /// Deletes a resource database.
        /// </summary>
        /// <param name="viewModel">Resource cleared.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Delete(ResourceViewModel viewModel)
        {
            try
            {
                return !Common.HasGroupWritePermission(viewModel.ResourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = _repository.Delete(viewModel.ResourceId) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion

    }
}
