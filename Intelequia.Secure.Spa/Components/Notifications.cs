using System;
using System.Text;
using System.Threading;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Mail;

namespace Intelequia.Secure.Spa.Components
{
    public class Notifications

    {
        #region public

        /// <summary>
        /// Send a email.
        /// </summary>
        /// <remarks></remarks>
        public static void SendMessage(string viewMessageUrl, DateTime expDate, int portalId, string messsageTo = null, string messageCo = null, string messsageCco = null)
        {
            try
            {
                var subject = App_GlobalResources.Errors.NotificationSubject;
                var body = $"{App_GlobalResources.Errors.NotificationBody} {viewMessageUrl} {App_GlobalResources.Errors.NotificationBody2} {expDate.ToLongDateString()}, {expDate.ToShortTimeString()}";

                var notificacionInfoAdmins = new NotificationInfo(messsageTo,messageCo, messsageCco, subject, body, portalId);
                ThreadPool.QueueUserWorkItem(o => SendMail(notificacionInfoAdmins));
            }
            catch (Exception ex)
            {
                Exceptions.LogException(ex);
            }
        }
        #endregion

        #region  SendEmail

        /// <summary>
        /// Object with the email's parameters.
        /// </summary>
        public class NotificationInfo
        {
            public string MessageTo;
            public string MessageCo;
            public string MessageCco;
            public string Subject;
            public string Body;
            public int PortalId;

            /// <summary>
            /// Public constructor provides an easy way to supply all the information needed for the task. 
            /// </summary>
            /// <param name="messageTo">To.</param>
            /// <param name="messageCo">Co.</param>
            /// <param name="messageCco">Coo.</param>
            /// <param name="subject">Subject.</param>
            /// <param name="body">Body</param>
            /// <param name="portalId">Portal ID</param>
            public NotificationInfo(string messageTo, string messageCo, string messageCco,string subject, string body, int portalId)
            {
                MessageTo = messageTo;
                MessageCo = messageCo;
                MessageCco = messageCco;
                Subject = subject;
                Body = body;
                PortalId = portalId;

            }
        }

        /// <summary>
        /// Send the email asynchronous
        /// </summary>
        /// <param name="pNotificationInfo">Object with the parameters</param>
        public static void SendMail(Object pNotificationInfo)
        {
            var notificationInfo = (NotificationInfo)pNotificationInfo;

            SendMail(notificationInfo.MessageTo,notificationInfo.MessageCo, notificationInfo.MessageCco, notificationInfo.Subject, notificationInfo.Body, notificationInfo.PortalId);
        }

        /// <summary>
        /// Send a email.
        /// </summary>
        /// <param name="messageTo">To.</param>
        /// <param name="messageCo">Co.</param>
        /// <param name="messageCco">Cco.</param>
        /// <param name="subject">Subject.</param>
        /// <param name="body">Body.</param>
        /// <param name="portalId">Portal Id.</param>

        private static void SendMail(string messageTo, string messageCo, string messageCco, string subject, string body, int portalId)
        {
            try
            {
                var email = new PortalSettings(portalId).Email;

                Mail.SendMail(email, messageTo, messageCo, messageCco, MailPriority.Normal, subject, MailFormat.Html, Encoding.ASCII, body, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);
            }
            catch (Exception ex)
            {
                Exceptions.LogException(ex);
            }
        }

        #endregion
    }
}