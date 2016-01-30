using System;
using DotNetNuke.Security.Roles;
using Intelequia.Secure.Data;
using Newtonsoft.Json;

namespace Intelequia.Secure.Spa.Services.ViewModels
{

    /// <summary>
    /// PermissionViewModel represents a Permission object within the Permission Web Service API
    /// </summary>
    [JsonObject(MemberSerialization.OptIn)]
    public class PermissionViewModel
    {
        /// <summary>
        /// Constructs a PermissionViewModel
        /// </summary>
        public PermissionViewModel()
        {
        }

        /// <summary>
        /// Constructs a PermissionViewModel from a Permission (for user) object.
        /// </summary>
        /// <param name="permission">Permiso</param>
        public PermissionViewModel(Permission permission)
        {
            PermissionId = permission.PermissionId;
            ResourceGroupId = permission.ResourceGroupId;
            UserId = permission.UserId;
            UserDisplayName = permission.UserId.HasValue ? Common.GetUserDisplayName(permission.UserId.Value) : string.Empty;
            RolId = permission.RolId;
            RoleName = permission.RolId.HasValue ? Data.Common.GetRoleName (permission.RolId.Value) : string.Empty;
            ReadPermission = permission.ReadPermission;
            WritePermission = permission.WritePermission;
            Cd = permission.Cd;
            Cu = permission.Cu;
            Md = permission.Md;
            Mu = permission.Mu;
        }

        /// <summary>
        /// Constructs a PermissionViewModel from a Permission (for user) object.
        /// </summary>
        /// <param name="permission">Permiso</param>
        /// <param name="resourceGroupId">Grupo al que pertenece.</param>
        public PermissionViewModel(Permission permission, Guid resourceGroupId)
        {
            PermissionId = permission.PermissionId;
            ResourceGroupId = resourceGroupId;
            UserId = permission.UserId;
            UserDisplayName = permission.UserId.HasValue ? Common.GetUserDisplayName(permission.UserId.Value) : string.Empty;
            ReadPermission = permission.ReadPermission;
            WritePermission = permission.WritePermission;
            Cd = permission.Cd;
            Cu = permission.Cu;
            Md = permission.Md;
            Mu = permission.Mu;
        }

        /// <summary>
        /// Constructs a PermissionViewModel from a Permission (for role) object.
        /// </summary>
        /// <param name="permission">Permiso.</param>
        /// <param name="rol">Rol con el que se construye el permiso.</param>
        /// <param name="resourceGroupId">Grupo al que pertenece.</param>
        public PermissionViewModel(Permission permission, RoleInfo rol, Guid resourceGroupId)
        {
            PermissionId = permission?.PermissionId ?? 0;
            ResourceGroupId = resourceGroupId;
            RolId = rol.RoleID;
            RoleName = rol.RoleName;
            ReadPermission = permission != null && permission.ReadPermission;
            WritePermission = permission != null && permission.WritePermission;
            Cd = permission?.Cd ?? DateTime.Now;
            Cu = permission?.Cu ?? Common.CurrentUser.UserID;
            Md = permission?.Md ?? DateTime.Now;
            Mu = permission?.Mu ?? Common.CurrentUser.UserID;
        }


        /// <summary>
        /// Id del permiso
        /// </summary>
        [JsonProperty("PermissionId")]
        public int PermissionId { get; set; }

        ///<summary>
        /// Id del grupo/recurso al que pertenece
        ///</summary>
        [JsonProperty("ResourceGroupId")]
        public Guid ResourceGroupId { get; set; }

        ///<summary>
        /// Usuario al que pertence
        ///</summary>
        [JsonProperty("UserId")]
        public int? UserId { get; set; }

        ///<summary>
        /// Rol al que pertenece
        ///</summary>
        [JsonProperty("RolId")]
        public int? RolId { get; set; }

        ///<summary>
        /// Permiso de lectura
        ///</summary>
        [JsonProperty("ReadPermission")]
        public bool ReadPermission { get; set; }

        ///<summary>
        /// Permiso de escritura
        ///</summary>
        [JsonProperty("WritePermission")]
        public bool WritePermission { get; set; }

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
        /// DisplayName del usuario
        /// </summary>
        [JsonProperty("UserDisplayName")]
        public string UserDisplayName { get; set; }

        /// <summary>
        /// Nombre del rol
        /// </summary>
        [JsonProperty("RoleName")]
        public string RoleName { get; set; }
    }
}
