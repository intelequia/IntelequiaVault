SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_ExtensionUrlProviders]
AS
	SELECT     
		P.ExtensionUrlProviderID, 
		PC.PortalID, 
		P.ProviderName, 
		P.IsActive, 
		P.RewriteAllUrls, 
		P.RedirectAllUrls, 
		P.ReplaceAllUrls, 
		P.DesktopModuleId
	FROM    dbo.ExtensionUrlProviderConfiguration PC
		RIGHT OUTER JOIN dbo.ExtensionUrlProviders P ON PC.ExtensionUrlProviderID = P.ExtensionUrlProviderID
GO
