using System;
using DotNetNuke.ComponentModel.DataAnnotations;

namespace Intelequia.Secure.Data
{
    [TableName("iss_IntelequiaSecure_Message")]
    [PrimaryKey("MessageId", AutoIncrement = false)]
    [Scope("PortalId")]
    public class Message
    {
        ///<summary>
        /// Id of the message
        ///</summary>
        public Guid MessageId { get; set; }

        ///<summary>
        /// Who sends the message
        ///</summary>
        public string MessageFrom { get; set; }

        ///<summary>
        /// The message recipient
        ///</summary>
        public string MessageTo { get; set; }

        ///<summary>
        /// Copy of the message
        ///</summary>
        public string MessageCc { get; set; }

        ///<summary>
        /// Blind carbon copy of the message
        ///</summary>
        public string MessageCco { get; set; }

        ///<summary>
        /// Message Subject
        ///</summary>
        public string Subject { get; set; }

        ///<summary>
        /// Message Body
        ///</summary>
        public string Body { get; set; }

        ///<summary>
        /// Date when the message is destroyed
        ///</summary>
        public DateTime ExpireDate { get; set; }

        ///<summary>
        /// Creation date
        ///</summary>
        public DateTime Cd { get; set; }

        ///<summary>
        /// Creation user
        ///</summary>
        public int Cu { get; set; }

        ///<summary>
        /// Date of last modification
        ///</summary>
        public DateTime Md { get; set; }

        ///<summary>
        /// Last Modified User
        ///</summary>
        public int Mu { get; set; }
    }


}
