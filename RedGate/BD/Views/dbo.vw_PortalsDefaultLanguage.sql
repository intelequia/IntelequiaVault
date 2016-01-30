SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_PortalsDefaultLanguage]
AS
    SELECT * FROM dbo.[vw_Portals] WHERE CultureCode = DefaultLanguage
GO
