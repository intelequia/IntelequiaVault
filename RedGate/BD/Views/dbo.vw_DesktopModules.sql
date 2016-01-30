SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_DesktopModules]
AS
	SELECT
		DM.DesktopModuleID,
		DM.FriendlyName,
		DM.Description,
		DM.Version,
		DM.IsPremium,
		DM.IsAdmin,
		DM.BusinessControllerClass,
		DM.FolderName,
		DM.ModuleName,
		DM.SupportedFeatures,
		DM.CompatibleVersions,
		DM.Dependencies,
		DM.Permissions,
		DM.PackageID,
		DM.CreatedByUserID,
		DM.CreatedOnDate,
		DM.LastModifiedByUserID,
		DM.LastModifiedOnDate,
		CI.ContentItemID,
		CI.[Content],
		CI.ContentTypeID,
		CI.TabID,
		CI.ModuleID,
		CI.ContentKey,
		CI.Indexed,
		DM.Shareable,
		DM.AdminPage,
		DM.HostPage
	FROM dbo.[DesktopModules] AS DM
		LEFT OUTER JOIN dbo.[ContentItems] AS CI ON DM.ContentItemId = CI.ContentItemID
GO
