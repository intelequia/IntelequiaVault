using System;
using System.Collections.Generic;
using DotNetNuke.Common;
using DotNetNuke.Data;
using DotNetNuke.Framework;
using System.Linq;

namespace Intelequia.Secure.Data
{
    public class GroupRepository : ServiceLocator<IGroupRepository, GroupRepository>, IGroupRepository
    {

        protected override Func<IGroupRepository> GetFactory()
        {
            return () => new GroupRepository();
        }

        /// <summary>
        /// Returns resource groups found.
        /// </summary>
        /// <param name="tags">Text to search the name of resources.</param>
        /// <param name="sortField">Sort field.</param>
        /// <param name="sortOrder">Sort direction.</param>
        /// <returns></returns>
        public IEnumerable<Group> GetGroups(string tags, string sortField, string sortOrder)
        {
            Requires.NotNullOrEmpty("sortField", sortField);
            Requires.NotNullOrEmpty("sortOrder", sortOrder);

            var validgroups = new List<Group>();

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();

                var filter = string.IsNullOrEmpty(tags)
                    ? $"WHERE PortalId = {Common.PortalId} ORDER BY {sortField} {sortOrder}"
                    : $"WHERE PortalId = {Common.PortalId} AND ResourceName LIKE '%{tags}%' ORDER BY {sortField} {sortOrder}";

                var data = rep.Find(filter);
                foreach (var group in data)
                {
                    var userPermissions = PermissionRepository.GetUserReadPermission(group.ResourceGroupId, Common.CurrentUser.UserID); 
                    var rolPermissions = PermissionRepository.GetUserReadPermisionByRol(group.ResourceGroupId, Common.CurrentUser.UserID, Common.CurrentUser.Roles);
                    if (userPermissions.Any() || Common.IsAdministrator() || rolPermissions)
                    {
                        validgroups.Add(group);
                    }
                }
            }

            return validgroups;
        }

        /// <summary>
        /// Returns resource groups found for a portal (used in data export).
        /// </summary>
        /// <param name="portalId">The id of the Portal</param>
        /// <returns></returns>
        public IEnumerable<Group> GetGroups(int portalId)
        {
            Requires.NotNegative("portalId", portalId);

            IEnumerable<Group> data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();

                data = rep.Find($"WHERE PortalId = {portalId}");
            }

            return data;
        }

        /// <summary>
        /// Gets a resource group by id.
        /// </summary>
        /// <param name="resourceGroupId">Id of the resource group that is obtained.</param>
        /// <returns></returns>
        public Group GetGroup(Guid resourceGroupId)
        {
            Requires.NotNull("resourceGroupId");

            Group data;

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();
                data = rep.GetById(resourceGroupId);
            }

            return data;
        }

        /// <summary>
        /// Insert a group in the database
        /// </summary>
        /// <param name="group">New group to insert.</param>
        /// <returns></returns>
        public Group Create(Group group)
        {
            Requires.NotNull(group);
            Requires.PropertyNotNegative(group, "PortalId");
            Requires.PropertyNotNullOrEmpty(group, "ResourceName");

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();

                group.ResourceGroupId = Guid.NewGuid();
                group.PortalId = Common.PortalId;
                group.Cd = DateTime.Now;
                group.Cu = Common.CurrentUser.UserID;
                group.Md = DateTime.Now;
                group.Mu = Common.CurrentUser.UserID;

                rep.Insert(group);
            }

            return GetGroup(group.ResourceGroupId);
        }

        /// <summary>
        /// Upgrade a resource group.
        /// </summary>
        /// <param name="group">Group that is updated.</param>
        /// <returns></returns>
        public Group Update(Group group)
        {
            Requires.NotNull(group);
            Requires.PropertyNotNullOrEmpty(group, "ResourceName");

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();

                var g = rep.GetById(group.ResourceGroupId);

                g.ResourceName = group.ResourceName;
                g.Md = DateTime.Now;
                g.Mu = Common.CurrentUser.UserID;

                rep.Update(g);
            }

            return GetGroup(group.ResourceGroupId);
        }

        /// <summary>
        /// Delete a record from the database.
        /// </summary>
        /// <param name="groupId">Id of the record that is deleted.</param>
        /// <returns></returns>
        public bool Delete(Guid groupId)
        {
            Requires.NotNull("groupId");


            try
            {
                using (var ctx = DataContext.Instance())
                {
                    var rep = ctx.GetRepository<Group>();
                    var data = rep.GetById(groupId);

                    if (data == null) return false;

                    rep.Delete(data);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Create an imported record in the database.
        /// </summary>
        /// <param name="group">Group that is imported.</param>
        /// <returns></returns>
        public Group ImportCreate(Group group)
        {
            Requires.NotNull(group);
            Requires.PropertyNotNegative(group, "PortalId");
            Requires.PropertyNotEqualTo("ResourceGroupId", "ResourceGroupId", group.ResourceGroupId, Guid.Empty);
            Requires.PropertyNotNullOrEmpty(group, "ResourceName");

            using (var ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Group>();

                group.PortalId = Common.PortalId;
                group.Cd = DateTime.Now;
                group.Cu = Common.CurrentUser.UserID;
                group.Md = DateTime.Now;
                group.Mu = Common.CurrentUser.UserID;

                rep.Insert(group);
            }

            return GetGroup(group.ResourceGroupId);
        }

    }
}