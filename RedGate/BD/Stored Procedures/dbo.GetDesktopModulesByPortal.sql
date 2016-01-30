SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDesktopModulesByPortal]
	@PortalId int 
AS 
	SELECT DISTINCT DM.* 
	FROM dbo.vw_DesktopModules DM 
	WHERE ( IsPremium = 0 ) 
	OR  ( DesktopModuleID IN ( 
		SELECT DesktopModuleID 
		FROM dbo.PortalDesktopModules PDM 
		WHERE PDM.PortalId = @PortalId ) ) 
	ORDER BY FriendlyName
GO
