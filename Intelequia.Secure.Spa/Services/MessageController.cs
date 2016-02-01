using System;
using System.Collections.Generic;
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

namespace Intelequia.Secure.Spa.Services
{

    /// <summary>
    /// ContentTypeController provides the Web Services to manage Data Types
    /// </summary>
    [SupportedModules("Intelequia.Secure.Spa")]
    [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
    public class MessageController : DnnApiController
    {

        private readonly IMessageRepository _repository;

        /// <summary>
        /// Default Constructor constructs a new ContactController
        /// </summary>
        public MessageController() : this(MessageRepository.Instance)
        {

        }

        /// <summary>
        /// Constructor constructs a new ContactController with a passed in repository
        /// </summary>
        public MessageController(IMessageRepository repository)
        {
            Requires.NotNull(repository);

            _repository = repository;
        }

        

        #region Get
        
        /// <summary>
        /// Returns a message.
        /// </summary>
        /// <param name="resourceGroupId">Group from which the message is obtained.</param>
        /// <param name="messageId">Id of the message returned.</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetMessage(Guid resourceGroupId, Guid messageId)
        {
            try
            {
                return !Common.HasGroupReadPermission(resourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { MessageError = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Message = new MessageViewModel(_repository.GetMessage(messageId), true) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        /// <summary>
        /// Return a Message
        /// </summary>
        /// <param name="messageId">Message's ID</param>
        /// <returns></returns>
        [HttpGet]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage GetEncryptMessage(Guid messageId)
        {
            try
            {
                if (Common.CurrentUser.UserID == -1)
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new {MessageError = App_GlobalResources.Errors.ErrorNotAuthorized});

                var message = _repository.GetMessage(messageId);

                MessageViewModel messageView = null;

                if (message != null)
                {
                    messageView = new MessageViewModel(message, true);
                    if (messageView.MessageCc.IndexOf(Common.CurrentUser.Email, StringComparison.OrdinalIgnoreCase) == -1 &&
                        messageView.MessageCco.IndexOf(Common.CurrentUser.Email, StringComparison.OrdinalIgnoreCase) == -1 &&
                        messageView.MessageTo.IndexOf(Common.CurrentUser.Email, StringComparison.OrdinalIgnoreCase) == -1)
                    {
                        messageView = null;
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK, new { Success = messageView != null, Message = messageView });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion




        #region Create

        /// <summary>
        /// Creates the message body.
        /// </summary>
        /// <param name="resourcesId">Id of resources that are sent in the message.</param>
        /// <returns></returns>
        private static string CreateMessageBody(IEnumerable<Guid> resourcesId)
        {
            try
            {
                var message = "<br/><br/>";

                foreach (var resourceId in resourcesId)
                {
                    var data = ResourceRepository.Instance.GetResource(resourceId);

                    if (data != null)
                        message += $"{UrlUtils.DecryptParameter(data.ResourceKey, Common.GetDecryptionKey())}: {UrlUtils.DecryptParameter(data.ResourceValue, Common.GetDecryptionKey())}<br/>";
                }

                return message+"<br/>";
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Insert a message in the database.
        /// </summary>
        /// <param name="resourceGroupId">Id resource group to which the message belongs.</param>
        /// <param name="messageBody">Message body.</param>
        /// <returns></returns>
        private static Message CreateMessage(Guid resourceGroupId, string messageBody)
        {
            try
            {
                var group = GroupRepository.Instance.GetGroup(resourceGroupId);

                if (group == null)
                    return null;

                return new Message
                {
                    MessageFrom = Common.CurrentUser.Email,
                    Subject = UrlUtils.EncryptParameter($"{App_GlobalResources.Errors.MessageSubject} [{group.ResourceName}]", Common.GetDecryptionKey()),
                    Body = UrlUtils.EncryptParameter(messageBody, Common.GetDecryptionKey()),
                    ExpireDate = DateTime.Now.AddDays(2).ToUniversalTime(),
                    Cd = DateTime.Now,
                    Cu = Common.CurrentUser.UserID,
                    Md = DateTime.Now,
                    Mu = Common.CurrentUser.UserID
                };
            }
            catch (Exception)
            {
                return null;
            }
        }


        public class CreateParams
        {
            public Guid ResourceGroupId { get; set; }
            public List<Guid> ResourcesIds{ get; set; }
        }

        /// <summary>
        /// Creates a message with a list of resources.
        /// </summary>
        /// <param name="submitted">Group of Id from the resources with which the message is generated.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Create(CreateParams submitted)
        {
            try
            {
                if (!Common.HasGroupReadPermission(submitted.ResourceGroupId))
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, new { MessageError = App_GlobalResources.Errors.ErrorNotAuthorized });

                if (!submitted.ResourcesIds.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, new { Success = false, MessageError = App_GlobalResources.Errors.ErrorBodyMessage });

                var messageBody = CreateMessageBody(submitted.ResourcesIds);

                if (string.IsNullOrEmpty(messageBody))
                    return Request.CreateResponse(HttpStatusCode.OK, new { Success = false, MessageError = App_GlobalResources.Errors.ErrorBodyMessage });

                var message = _repository.Create(CreateMessage(submitted.ResourceGroupId, messageBody));

                return message != null
                    ? Request.CreateResponse(HttpStatusCode.OK, new { Success = true, SendMailUrl = Components.Common.SendMailUrl(ActiveModule.ModuleID, submitted.ResourceGroupId, message.MessageId) })
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = false, MessageError = App_GlobalResources.Errors.ErrorMessage });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion



        #region Update

        /// <summary>
        /// Creates a Message object to update the database.
        /// </summary>
        /// <param name="viewModel">Message to be updated.</param>
        /// <returns></returns>
        private static Message UpdateMessage(MessageViewModel viewModel)
        {

            return new Message
            {
                MessageId = viewModel.MessageId,
                MessageFrom = viewModel.MessageFrom,
                MessageTo = viewModel.MessageTo,
                MessageCc = viewModel.MessageCc,
                MessageCco = viewModel.MessageCco,
                Subject = UrlUtils.EncryptParameter(viewModel.Subject, Common.GetDecryptionKey()),
                Body = UrlUtils.EncryptParameter(viewModel.Body, Common.GetDecryptionKey()),
                ExpireDate = viewModel.ExpireDate.ToUniversalTime()
            };
        }

        public class UpdateParams
        {
            public Message Message { get; set; }
            public Guid ResourceGroupId { get; set; }
        }

        /// <summary>
        /// Upgrade a message and returns.
        /// </summary>
        /// <param name="submitted"></param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Update(UpdateParams submitted)
        {
            try
            {
                return !Common.HasGroupReadPermission(submitted.ResourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = true, Message = _repository.Update(UpdateMessage(new MessageViewModel(submitted.Message))) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion




        #region SendMessage

        public class SendMessageParams
        {
            public Message Message { get; set; }
            public Guid ResourceGroupId { get; set; }
        }

        /// <summary>
        /// Upgrade a group in the database and returns.
        /// </summary>
        /// <param name="submitted">Message send parameters.</param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage SendMessage(SendMessageParams submitted)
        {
            try
            {
                if (!Common.HasGroupReadPermission(submitted.ResourceGroupId))
                    Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized });

                var message = _repository.Update(UpdateMessage(new MessageViewModel(submitted.Message)));
                
                Components.Notifications.SendMessage(Components.Common.ViewMailUrl(ActiveModule.ModuleID, message.MessageId),message.ExpireDate,ActiveModule.PortalID,message.MessageTo,message.MessageCc,message.MessageCco);

                return Request.CreateResponse(HttpStatusCode.OK, new
                {
                    Success = true,
                    PostBackUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID)
                });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion




        #region Delete

        public class DeleteParams
        {
            public Guid ResourceGroupId { get; set; }
            public Guid MessageId { get; set; }
        }

        /// <summary>
        /// Delete a message on the database.
        /// </summary>
        /// <param name="submitted"></param>
        /// <returns></returns>
        [HttpPost]
        [DnnAuthorize]
        [ValidateAntiForgeryToken]
        public HttpResponseMessage Delete(DeleteParams submitted)
        {
            try
            {
                return !Common.HasGroupReadPermission(submitted.ResourceGroupId) 
                    ? Request.CreateResponse(HttpStatusCode.Unauthorized, new { Message = App_GlobalResources.Errors.ErrorNotAuthorized }) 
                    : Request.CreateResponse(HttpStatusCode.OK, new { Success = _repository.Delete(submitted.MessageId), ResourceGroupUrl = Components.Common.GroupsUrl(ActiveModule.ModuleID) });
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, App_GlobalResources.Errors.ErrorGeneric);
            }
        }

        #endregion

    }
}
