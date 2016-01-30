SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CKE_DeleteAllPortalSettings]
  @PortalID varchar
	AS
	SET NOCOUNT ON
	delete from dbo.CKE_Settings where SettingName like 'DNNCKP#' + @PortalID + '%'
GO
