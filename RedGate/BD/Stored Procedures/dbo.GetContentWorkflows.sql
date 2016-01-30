SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflows]
	@PortalID int
AS

SELECT
	[WorkflowID],
	[PortalID],
	[WorkflowName],
	[Description],
	[IsDeleted],
	[StartAfterCreating],
	[StartAfterEditing],
	[DispositionEnabled]
FROM dbo.ContentWorkflows
WHERE (PortalID = @PortalID OR PortalID IS null)
GO
