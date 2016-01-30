SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_DeleteAllModuleSettingsByTab]
  @TabID int
	AS
	SET NOCOUNT ON
	Delete ms
  FROM dbo.ModuleSettings ms
  INNER JOIN	
		dbo.TabModules tm  ON tm.TabID = @TabID
  Where SettingName like 'DNNCKMI#%' AND ms.ModuleID  = tm.ModuleID
GO
