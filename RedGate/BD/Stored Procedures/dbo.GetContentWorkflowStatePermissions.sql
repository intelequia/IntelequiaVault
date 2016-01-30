SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowStatePermissions]
AS
    SELECT *
    FROM dbo.vw_ContentWorkflowStatePermissions
GO
