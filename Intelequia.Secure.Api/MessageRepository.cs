using System;
using System.Collections.Generic;
using System.ComponentModel;
using DotNetNuke.Common;
using DotNetNuke.Data;
using DotNetNuke.Framework;

namespace Intelequia.Secure.Data
{
    public class MessageRepository : ServiceLocator<IMessageRepository, MessageRepository>, IMessageRepository
    {

        protected override Func<IMessageRepository> GetFactory()
        {
            return () => new MessageRepository();
        }


        /// <summary>
        /// Get a message.
        /// </summary>
        /// <param name="messageId">Message id to be obtained.</param>
        /// <returns></returns>
        public Message GetMessage(Guid messageId)
        {
            Requires.PropertyNotEqualTo("messageId", "messageId", messageId, Guid.Empty);
            Message data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Message>();
                data = rep.GetById(messageId);
            }

            return data;
        }

        /// <summary>
        /// Insert a message in the database.
        /// </summary>
        /// <param name="message">Message that is inserted into the database.</param>
        /// <returns></returns>
        public Message Create(Message message)
        {
            Requires.NotNull(message);
            Requires.PropertyNotNullOrEmpty(message, "MessageFrom");
            Requires.PropertyNotNullOrEmpty(message, "Subject");
            Requires.PropertyNotNullOrEmpty(message, "Body");

            using (var ctx = DataContext.Instance())
            {
                message.MessageId = Guid.NewGuid();
                message.Cd = DateTime.Now;
                message.Cu = Common.CurrentUser.UserID;
                message.Md = DateTime.Now;
                message.Mu = Common.CurrentUser.UserID;

                var rep = ctx.GetRepository<Message>();
                rep.Insert(message);
            }

            return GetMessage(message.MessageId);
        }

        /// <summary>
        /// Upgrade a message.
        /// </summary>
        /// <param name="message">Message to be updated.</param>
        /// <returns></returns>
        public Message Update(Message message)
        {
            Requires.NotNull(message);
            Requires.PropertyNotNullOrEmpty(message, "MessageFrom");
            Requires.PropertyNotNullOrEmpty(message, "Subject");
            Requires.PropertyNotNullOrEmpty(message, "Body");
            Requires.PropertyNotEqualTo("ExpireDate", "ExpireDate", message.ExpireDate, DateTime.MinValue);

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Message>();

                var m = rep.GetById(message.MessageId);

                m.MessageFrom = message.MessageFrom;
                m.MessageTo = message.MessageTo;
                m.MessageCc = message.MessageCc;
                m.MessageCco = message.MessageCco;
                m.Subject = message.Subject;
                m.Body = message.Body;
                m.ExpireDate = message.ExpireDate;
                m.Md = DateTime.Now;
                m.Mu = Common.CurrentUser.UserID;

                rep.Update(m);
            }

            return GetMessage(message.MessageId);
        }

        /// <summary>
        /// Delete a record from the database.
        /// </summary>
        /// <param name="messageId">Id of the record that is deleted.</param>
        /// <returns></returns>
        public bool Delete(Guid messageId)
        {
            try
            {
                Requires.PropertyNotEqualTo("messageId", "messageId", messageId, Guid.Empty);

                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Message>();
                    var data = rep.GetById(messageId);

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
        /// Deletes expired messages.
        /// </summary>
        /// <returns></returns>
        public bool DeleteExpiredMessages()
        {
            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Message>();

                    // Gets the expired messages.
                    var data = rep.Find($"WHERE ExpireDate < '{DateTime.UtcNow.ToString("yyyy/MM/dd HH:mm:ss")}'");

                    // And then deletes them
                    foreach (var message in data)
                        rep.Delete(message);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
