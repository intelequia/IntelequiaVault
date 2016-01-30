using System;
using DotNetNuke.ComponentModel.DataAnnotations;

namespace Intelequia.Secure.Data
{

    [TableName("iss_IntelequiaSecure_Group")]
    [PrimaryKey("ResourceGroupId", AutoIncrement = false)]
    [Scope("PortalId")]
    public class Group
    {
        public Group()
        {
            ResourceGroupId = Guid.NewGuid();
        }

        ///<summary>
        /// The Group Id
        ///</summary>
        public Guid ResourceGroupId { get; set; }

        ///<summary>
        /// The group name
        ///</summary>
        public string ResourceName { get; set; }

        /// <summary>
        /// Portal to which the group belongs
        /// </summary>
        public int PortalId { get; set; }

        ///<summary>
        /// Creation date
        ///</summary>
        public DateTime Cd { get; set; }

        ///<summary>
        /// User who created the group
        ///</summary>
        public int Cu { get; set; }

        ///<summary>
        /// Date of last modification
        ///</summary>
        public DateTime Md { get; set; }

        ///<summary>
        /// The user who made last modification
        ///</summary>
        public int Mu { get; set; }
    }


}
