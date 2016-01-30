SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_DeleteAllModuleSettings]
  @PortalID varchar
	AS
	SET NOCOUNT ON
	Delete ms
  FROM dbo.ModuleSettings ms
  INNER JOIN	
		dbo.Modules m  ON m.PortalID = @PortalID
   Where SettingName like 'DNNCKMI#%' AND ms.ModuleID  = m.ModuleID
GO
