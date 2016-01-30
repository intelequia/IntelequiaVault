using System;
using DotNetNuke.ComponentModel.DataAnnotations;

namespace Intelequia.Secure.Data
{
    [TableName("iss_IntelequiaSecure_Resource")]
    [PrimaryKey("ResourceId", AutoIncrement = false)]
    [Scope("PortalId")]
    public class Resource
    {
        public Resource()
        {
            ResourceId = Guid.NewGuid();
        }

        ///<summary>
        /// Resource id
        ///</summary>
        public Guid ResourceId { get; set; }

        ///<summary>
        /// Id of the group it belongs to
        ///</summary>
        public Guid ResourceGroupId { get; set; }

        ///<summary>
        /// Resource Name
        ///</summary>
        public string ResourceKey { get; set; }

        ///<summary>
        /// Resource value
        ///</summary>
        public string ResourceValue { get; set; }

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
        /// Last modification user
        ///</summary>
        public int Mu { get; set; }
        
    }

}
