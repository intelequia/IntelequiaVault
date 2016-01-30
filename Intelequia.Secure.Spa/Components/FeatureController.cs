using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search.Entities;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Security.Roles;
using Intelequia.Secure.Data;


namespace Intelequia.Secure.Spa.Components
{
    public class FeatureController : ModuleSearchBase, IPortable, IUpgradeable
    {

        #region Optional Interfaces

        ///// -----------------------------------------------------------------------------
        ///// <summary>
        ///// UpgradeModule implements the IUpgradeable Interface
        ///// </summary>
        ///// <param name="Version">The current version of the module</param>
        ///// -----------------------------------------------------------------------------
        public string UpgradeModule(string version)
        {
            try
            {
                // Always check that the role 'Intelequia Secure Administrator' is created in all portals
                foreach (PortalInfo portal in PortalController.Instance.GetPortals())
                {
                    var rIntelequiaSecureAdministratos = RoleController.Instance.GetRoleByName(portal.PortalID,
                        "IntelequiaSecureAdministrator");

                    if (rIntelequiaSecureAdministratos == null)
                        RoleController.Instance.AddRole(new RoleInfo
                        {
                            PortalID = portal.PortalID,
                            RoleName = "IntelequiaSecureAdministrator",
                            Description = "Administrators of IntelequiaSecure",
                            BillingFrequency = "N",
                            TrialPeriod = -1,
                            TrialFrequency = "N",
                            BillingPeriod = -1,
                            IsPublic = false,
                            AutoAssignment = false,
                            Status = RoleStatus.Approved,
                            SecurityMode = 0,
                            IsSystemRole = true,
                            RoleGroupID = -1
                        });
                }

                // Checks depending on version
                switch (version)
                {
                    case "01.00.00":
                        // The task runs only on the machine installation
                        var task =
                            DotNetNuke.Services.Scheduling.SchedulingController.GetSchedule()
                                .FirstOrDefault(x => x.TypeFullName == "Intelequia.Secure.Spa.Task.DeleteMessages,Intelequia.Secure.Spa");
                        if (task != null)
                            DotNetNuke.Services.Scheduling.SchedulingController.UpdateSchedule(task.ScheduleID,
                                task.TypeFullName, task.TimeLapse, task.TimeLapseMeasurement,
                                task.RetryTimeLapse, task.RetryTimeLapseMeasurement, task.RetainHistoryNum,
                                task.AttachToEvent, task.CatchUpEnabled, true, task.ObjectDependencies,
                                "," + Environment.MachineName + ",", task.FriendlyName);

                        return $"Successfully upgraded from version {version}.";

                    default:
                        return $"Version {version} upgrade not supported.";
                }
            }
            catch (Exception ex)
            {
                return $"Upgrade module failed: {ex.Message}";
            }
        }

        /// <summary>
        /// Añade los eventos a la búsqueda de DNN.
        /// </summary>
        /// <param name="moduleInfo">Módulo que se indexa.</param>
        /// <param name="beginDate">Fecha de inicio (última actualización).</param>
        /// <returns></returns>
        public override IList<SearchDocument> GetModifiedSearchDocuments(ModuleInfo moduleInfo, DateTime beginDate)
        {
            throw new NotImplementedException("The method or operation is not implemented.");
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// ExportModule implements the IPortable ExportModule Interface.
        /// </summary>
        /// <param name="moduleId">The Id of the module to be exported.</param>
        /// -----------------------------------------------------------------------------
        public string ExportModule(int moduleId)
        {
            var strXml = string.Empty;

            var groups = GroupRepository.Instance.GetGroups(Data.Common.PortalId);

            if (!groups.Any()) return strXml;

            strXml += "<Groups>";

            foreach (var group in groups)
            {
                //Add groups to the xml
                strXml += "<Group>";
                strXml += "<ResourceGroupId>" + XmlUtils.XMLEncode(@group.ResourceGroupId.ToString()) +
                          "</ResourceGroupId>";
                strXml += "<ResourceName>" + XmlUtils.XMLEncode(@group.ResourceName) + "</ResourceName>";

                // Add the group resources to the xml
                var resources = ResourceRepository.Instance.GetResources(@group.ResourceGroupId);
                strXml += "<Resources>";
                foreach (var resource in resources)
                {
                    strXml += "<Resource>";
                    strXml += "<ResourceGroupId>" + XmlUtils.XMLEncode(@resource.ResourceGroupId.ToString()) +"</ResourceGroupId>";
                    strXml += "<ResourceKey>" + XmlUtils.XMLEncode(@resource.ResourceKey) + "</ResourceKey>";
                    strXml += "<ResourceValue>" + XmlUtils.XMLEncode(@resource.ResourceValue) + "</ResourceValue>";
                    strXml += "</Resource>";
                }
                strXml += "</Resources>";
                strXml += "</Group>";
            }
            strXml += "</Groups>";
            return strXml;
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// ImportModule implements the IPortable ImportModule Interface.
        /// </summary>
        /// <param name="moduleId">The Id of the module to be imported.</param>
        /// <param name="content">The content to be imported.</param>
        /// <param name="version">The version of the module to be imported.</param>
        /// <param name="userId">The Id of the user performing the import.</param>
        /// -----------------------------------------------------------------------------
        public void ImportModule(int moduleId, string content, string version, int userId)
        {
            var groups = new GroupRepository();
            var xmldnngroups = DotNetNuke.Common.Globals.GetContent(content, "Groups");
            var xmlGroupsNodeList = xmldnngroups.SelectNodes("Group");

            if (xmlGroupsNodeList == null) return;

            foreach (XmlNode xmldnngroup in xmlGroupsNodeList)
            {
                //Import a group
                var resourceGroupId = xmldnngroup.SelectSingleNode("ResourceGroupId");
                var resourceName = xmldnngroup.SelectSingleNode("ResourceName");

                if (resourceGroupId == null || resourceName == null) continue;

                var objdnngroup = new Group
                {
                    ResourceGroupId = new Guid(resourceGroupId.InnerText),
                    ResourceName = resourceName.InnerText,
                };

                groups.ImportCreate(objdnngroup);

                var resources = new ResourceRepository();
                var xmlResourcesNodeList = xmldnngroup.SelectNodes("Resources/Resource");

                //Import the resources of this group
                if (xmlResourcesNodeList == null) return;
                foreach (XmlNode xmldnnresource in xmlResourcesNodeList)
                {
                    var rGroupId = xmldnnresource.SelectSingleNode("ResourceGroupId");
                    var resourceKey = xmldnnresource.SelectSingleNode("ResourceKey");
                    var resourceValue = xmldnnresource.SelectSingleNode("ResourceValue");

                    if (rGroupId == null || resourceKey == null || resourceValue == null) continue;

                    var objdnnresource = new Resource
                    {
                        ResourceGroupId = new Guid(rGroupId.InnerText),
                        ResourceKey = resourceKey.InnerText,
                        ResourceValue = resourceValue.InnerText,

                    };

                    resources.Create(objdnnresource);
                }
            }
        }

        #endregion
    }
}


