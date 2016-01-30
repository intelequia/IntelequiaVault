SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetModuleControls]
AS
    SELECT *
    FROM   dbo.ModuleControls
	ORDER BY  ControlKey, ViewOrder
GO
