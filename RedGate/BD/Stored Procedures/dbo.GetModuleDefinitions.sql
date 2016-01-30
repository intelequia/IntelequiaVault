SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleDefinitions]
AS
    SELECT *
    FROM   dbo.ModuleDefinitions
GO
