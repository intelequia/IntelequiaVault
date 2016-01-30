using System;
using DotNetNuke.Common.Utilities;
using Newtonsoft.Json;
using Intelequia.Secure.Data;

namespace Intelequia.Secure.Spa.Services.ViewModels
{

    /// <summary>
    /// MessageViewModel represents a Message object within the Message Web Service API
    /// </summary>
    [JsonObject(MemberSerialization.OptIn)]
    public class MessageViewModel
    {
        /// <summary>
        /// Constructs a MessageViewModel
        /// </summary>
        public MessageViewModel()
        {
        }

        /// <summary>
        /// Constructs a MessageViewModel from a Message object
        /// </summary>
        /// <param name="message"></param>
        /// <param name="decrypt"></param>
        public MessageViewModel(Message message, bool decrypt = false)
        {
            MessageId = message.MessageId;
            MessageFrom = string.IsNullOrEmpty(message.MessageFrom) ? Common.CurrentUser.Email : message.MessageFrom;
            MessageTo = string.IsNullOrEmpty(message.MessageTo) ? string.Empty : message.MessageTo;
            MessageCc = string.IsNullOrEmpty(message.MessageCc) ? string.Empty : message.MessageCc;
            MessageCco = string.IsNullOrEmpty(message.MessageCco) ? string.Empty : message.MessageCco;
            Subject = decrypt ? UrlUtils.DecryptParameter(message.Subject, Common.GetDecryptionKey()): message.Subject;
            Body = decrypt ? UrlUtils.DecryptParameter(message.Body, Common.GetDecryptionKey()) : message.Body;
            ExpireDate = message.ExpireDate;
            Cd = message.Cd;
            Cu = message.Cu;
            Md = message.Md;
            Mu = message.Mu;
        }

        ///<summary>
        /// Message Id
        ///</summary>
        [JsonProperty("MessageId")]
        public Guid MessageId { get; set; }

        ///<summary>
        /// Quien envía el mensaje
        ///</summary>
        [JsonProperty("MessageFrom")]
        public string MessageFrom { get; set; }

        ///<summary>
        /// A quién envía el mensaje
        ///</summary>
        [JsonProperty("MessageTo")]
        public string MessageTo { get; set; }

        ///<summary>
        /// Copia del mensaje
        ///</summary>
        [JsonProperty("MessageCc")]
        public string MessageCc { get; set; }

        ///<summary>
        /// Copia oculta del mensaje
        ///</summary>
        [JsonProperty("MessageCco")]
        public string MessageCco { get; set; }

        ///<summary>
        /// Asunto del mensaje
        ///</summary>
        [JsonProperty("Subject")]
        public string Subject { get; set; }

        ///<summary>
        /// Cuerpo del mensaje
        ///</summary>
        [JsonProperty("Body")]
        public string Body { get; set; }

        ///<summary>
        /// Fecha en la que es destruido el mensaje
        ///</summary>
        [JsonProperty("ExpireDate")]
        public DateTime ExpireDate { get; set; }

        ///<summary>
        /// Fecha de creación
        ///</summary>
        [JsonProperty("Cd")]
        public DateTime Cd { get; set; }

        ///<summary>
        /// Usuario de creación
        ///</summary>
        [JsonProperty("Cu")]
        public int Cu { get; set; }

        ///<summary>
        /// Fecha de última modificación
        ///</summary>
        [JsonProperty("Md")]
        public DateTime Md { get; set; }

        ///<summary>
        /// Usuario de última modificación
        ///</summary>
        [JsonProperty("Mu")]
        public int Mu { get; set; }
    }
}
