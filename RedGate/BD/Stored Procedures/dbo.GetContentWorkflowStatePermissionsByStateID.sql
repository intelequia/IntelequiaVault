SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowStatePermissionsByStateID]
	@StateID int
AS
    SELECT *
    FROM dbo.vw_ContentWorkflowStatePermissions
	WHERE StateID = @StateID
GO
