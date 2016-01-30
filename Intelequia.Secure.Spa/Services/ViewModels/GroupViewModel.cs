using System;
using Intelequia.Secure.Data;
using Newtonsoft.Json;

namespace Intelequia.Secure.Spa.Services.ViewModels
{

    /// <summary>
    /// GroupViewModel represents a Group object within the Group Web Service API
    /// </summary>
    [JsonObject(MemberSerialization.OptIn)]
    public class GroupViewModel
    {
        /// <summary>
        /// Constructs a GroupViewModel
        /// </summary>
        public GroupViewModel()
        {
        }

        /// <summary>
        /// Constructs a GroupViewModel from a Group object
        /// </summary>
        /// <param name="group">Resource Group</param>
        /// <param name="moduleId">ActiveModuleId.</param>
        public GroupViewModel(Group group, int moduleId)
        {
            ResourceGroupId = group.ResourceGroupId;
            ResourceName = group.ResourceName;
            PortalId = group.PortalId;
            Cd = group.Cd;
            Cu = group.Cu;
            Md = group.Md;
            Mu = group.Mu;
            EditGroupUrl = Components.Common.GroupEditUrl(moduleId, group.ResourceGroupId);
            AddResourceUrl = Components.Common.ResourceEditUrl(moduleId, group.ResourceGroupId, Guid.Empty);
        }

        ///<summary>
        /// Id del grupo
        ///</summary>
        [JsonProperty("ResourceGroupId")]
        public Guid ResourceGroupId { get; set; }

        ///<summary>
        /// Nombre del grupo
        ///</summary>
        [JsonProperty("ResourceName")]
        public string ResourceName { get; set; }

        /// <summary>
        /// Portal al que pertenece el grupo 
        /// </summary>
        [JsonProperty("PortalId")]
        public int PortalId { get; set; }
        
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
        public DateTime Md{ get; set; }

        ///<summary>
        /// Usuario de última modificación
        ///</summary>
        [JsonProperty("Mu")]
        public int Mu { get; set; }

        /// <summary>
        /// Ruta para la edición del grupo
        /// </summary>
        [JsonProperty("EditGroupUrl")]
        public string EditGroupUrl { get; set; }

        /// <summary>
        /// Ruta para crear un nuevo grupo
        /// </summary>
        [JsonProperty("AddResourceUrl")]
        public string AddResourceUrl { get; set; }
        
    }


}
