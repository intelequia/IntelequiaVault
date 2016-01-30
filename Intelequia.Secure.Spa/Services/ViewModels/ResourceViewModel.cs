using System;
using DotNetNuke.Common.Utilities;
using Intelequia.Secure.Data;
using Newtonsoft.Json;

namespace Intelequia.Secure.Spa.Services.ViewModels
{

    /// <summary>
    /// ResourceViewModel represents a Resource object within the Resource Web Service API
    /// </summary>
    [JsonObject(MemberSerialization.OptIn)]
    public class ResourceViewModel
    {

        /// <summary>
        /// Constructs a ResourceViewModel
        /// </summary>
        public ResourceViewModel()
        {
        }

        /// <summary>
        /// Constructs a ResourceViewModel from a Resource object
        /// </summary>
        /// <param name="resource"></param>
        /// <param name="moduleId">ActiveModuleId</param>
        /// <param name="viewValue">Indica si se desencripta la clave.</param>
        public ResourceViewModel(Resource resource, int moduleId, bool viewValue = false)
        {
            ResourceId = resource.ResourceId;
            ResourceGroupId = resource.ResourceGroupId;
            ResourceGroupName = GroupRepository.Instance.GetGroup(resource.ResourceGroupId).ResourceName;
            ResourceKey = UrlUtils.DecryptParameter(resource.ResourceKey, Common.GetDecryptionKey());
            ResourceValue = viewValue ? (string.IsNullOrEmpty(resource.ResourceValue) ? string.Empty : UrlUtils.DecryptParameter(resource.ResourceValue, Common.GetDecryptionKey())) : resource.ResourceValue;
            Cd = resource.Cd;
            Cu = resource.Cu;
            Md = resource.Md;
            Mu = resource.Mu;
            EditResourceUrl = Components.Common.ResourceEditUrl(moduleId, resource.ResourceGroupId, resource.ResourceId);
        }
        
        ///<summary>
        /// Id del grupo
        ///</summary>
        [JsonProperty("ResourceId")]
        public Guid ResourceId { get; set; }

        ///<summary>
        /// Id del grupo al que pertenece
        ///</summary>
        [JsonProperty("ResourceGroupId")]
        public Guid ResourceGroupId { get; set; }

        ///// <summary>
        ///// Nombre del grupo al que pertenece.
        ///// </summary>
        [JsonProperty("ResourceGroupName")]
        public string ResourceGroupName { get; set; }

        ///<summary>
        /// Nombre del recurso
        ///</summary>
        [JsonProperty("ResourceKey")]
        public string ResourceKey { get; set; }

        ///<summary>
        /// Valor del recurso
        ///</summary>
        [JsonProperty("ResourceValue")]
        public string ResourceValue { get; set; }

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

        /// <summary>
        /// Url de edición del recurso
        /// </summary>
        [JsonProperty("EditResourceUrl")]
        public string EditResourceUrl { get; set; }
    }
}
