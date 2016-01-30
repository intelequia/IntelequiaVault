SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_DeleteAllChildPageSettings]
  @TabID int
	AS
	SET NOCOUNT ON
	DELETE  hs
  FROM dbo.CKE_Settings hs
  INNER JOIN	
		dbo.Tabs t  ON t.ParentId = @TabID
  Where SettingName like 'DNNCKT#%' AND t.TabID  = t.TabID
GO
