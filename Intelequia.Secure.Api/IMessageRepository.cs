using System;

namespace Intelequia.Secure.Data
{
    public interface IMessageRepository
    {
        /// <summary>
        /// Gets a message by id.
        /// </summary>
        /// <param name="messageId">Id del mensaje que se obtiene.</param>
        /// <returns></returns>
        Message GetMessage(Guid messageId);

        /// <summary>
        /// Inserts a message in the database.
        /// </summary>
        /// <param name="message">Message that is inserted into the database.</param>
        /// <returns></returns>
        Message Create(Message message);

        /// <summary>
        /// Updates a message in the database.
        /// </summary>
        /// <param name="message">Message to be updated.</param>
        /// <returns></returns>
        Message Update(Message message);

        /// <summary>
        /// Deletes a message from the database.
        /// </summary>
        /// <param name="messageId">Id del mensaje que se borra.</param>
        /// <returns></returns>
        bool Delete(Guid messageId);

        /// <summary>
        /// Deletes expired messages.
        /// </summary>
        /// <returns></returns>
        bool DeleteExpiredMessages();

    }
}
