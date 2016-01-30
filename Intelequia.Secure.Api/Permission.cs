using System;
using DotNetNuke.ComponentModel.DataAnnotations;

namespace Intelequia.Secure.Data
{

    [TableName("iss_IntelequiaSecure_Permission")]
    [PrimaryKey("PermissionId", AutoIncrement = true)]
    [Scope("PortalId")]
    public class Permission
    {
        /// <summary>
        /// Id of the permission
        /// </summary>
        public int PermissionId { get; set; }

        ///<summary>
        /// Id of the group it belongs
        ///</summary>
        public Guid ResourceGroupId { get; set; }

        ///<summary>
        /// User belongs
        ///</summary>
        public int? UserId { get; set; }

        ///<summary>
        /// Role to which it belongs
        ///</summary>
        public int? RolId { get; set; }

        ///<summary>
        /// Read permission
        ///</summary>
        public bool ReadPermission { get; set; }

        ///<summary>
        /// Write permission
        ///</summary>
        public bool WritePermission { get; set; }

        ///<summary>
        /// Creation date
        ///</summary>
        public DateTime Cd { get; set; }

        ///<summary>
        /// Creation user
        ///</summary>
        public int Cu { get; set; }

        ///<summary>
        /// Last modification date
        ///</summary>
        public DateTime Md { get; set; }

        ///<summary>
        /// User last modification
        ///</summary>
        public int Mu { get; set; }

    }


}
