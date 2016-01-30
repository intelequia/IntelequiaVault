using System;
using DotNetNuke.Common;
using DotNetNuke.Services.Log.EventLog;

namespace Intelequia.Secure.Spa.Components
{
    public class Common
    {


        #region Urls

        /// <summary>
        /// Returns the URL of the page resources.
        /// </summary>
        /// <param name="moduleId">Active Module Id.</param>
        /// <returns></returns>
        public static string GroupsUrl(int moduleId)
        {
            return Globals.NavigateURL(string.Empty, $"mid={moduleId}");
        }

        /// <summary>
        /// Returns the url to create a resource group.
        /// </summary>
        /// <param name="moduleId">Active Module Id.</param>
        /// <returns></returns>
        public static string NewGroupUrl(int moduleId)
        {
            return Data.Common.IsAdministrator() ? GroupEditUrl(moduleId, Guid.Empty) : string.Empty;
        }

        /// <summary>
        /// Returns the edit url of a resource group.
        /// </summary>
        /// <param name="moduleId">ActiveModuleId.</param>
        /// <param name="resourceGroupId">Id of the resource group.</param>
        /// <returns></returns>
        public static string GroupEditUrl(int moduleId, Guid resourceGroupId)
        {
            return Globals.NavigateURL("GroupEdit", $"mid={moduleId}", $"rgid={ resourceGroupId }");
        }

        /// <summary>
        /// Returns the edit url of a resource group.
        /// </summary>
        /// <param name="moduleId">ActiveModuleId.</param>
        /// <param name="resourceGroupId">Id of the resource group to which the resource belongs.</param>
        /// <param name="resourceId">Id of the resource editing</param>
        /// <returns></returns>
        public static string ResourceEditUrl(int moduleId, Guid resourceGroupId, Guid resourceId)
        {
            return Globals.NavigateURL("ResourceEdit", $"mid={moduleId}", $"rgid={resourceGroupId}", $"rid={resourceId}");
        }

        /// <summary>
        /// Url to send an email With the selected resources.
        /// </summary>
        /// <param name="moduleId">ActiveModuleId.</param>
        /// <param name="resourceGroupId">Group id that owns the resource.</param>
        /// <param name="messageId">Id of the message that is sent.</param>
        /// <returns></returns>
        public static string SendMailUrl(int moduleId, Guid resourceGroupId, Guid messageId)
        {
            return Globals.NavigateURL("SendMessage", $"mid={moduleId}", $"rgid={resourceGroupId}", $"msgid={messageId}");
        }

        /// <summary>
        /// Url para enviar un email con los recursos seleccionados.
        /// </summary>
        /// <param name="moduleId">ActiveModuleId.</param>
        /// <param name="messageId">Id del mensaje que se envía.</param>
        /// <returns></returns>
        public static string ViewMailUrl(int moduleId, Guid messageId)
        {
            return Globals.NavigateURL("ViewMessage", $"mid={moduleId}",  $"msgid={messageId}");
        }


        #endregion


        #region Security

        public static void WritteEventLog(string message, EventLogController.EventLogType type)
        {
            var eventLog = new EventLogController();

            var logInfo = new LogInfo
            {
                LogUserID = Data.Common.CurrentUser.UserID,
                LogPortalID = Data.Common.PortalId,
                LogTypeKey = type.ToString()
            };

            logInfo.AddProperty("PortalId:", Data.Common.PortalId.ToString());
            logInfo.AddProperty("UserId:", Data.Common.CurrentUser.UserID.ToString());
            logInfo.AddProperty("User:", Data.Common.CurrentUser.Username);
            logInfo.AddProperty("Message:", message.Trim());

            eventLog.AddLog(logInfo);
        }

        #endregion
    }
}