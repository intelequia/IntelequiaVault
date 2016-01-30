SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_DeleteAllPageSettings]
  @PortalID varchar
	AS
	SET NOCOUNT ON
	DELETE  hs
  FROM dbo.CKE_Settings hs
  INNER JOIN	
		dbo.Tabs t  ON t.PortalID = @PortalID
   Where SettingName like 'DNNCKT#%' AND t.TabID  = t.TabID
GO
