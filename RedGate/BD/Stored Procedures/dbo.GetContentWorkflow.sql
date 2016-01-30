SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflow]
@WorkflowID int
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
WHERE WorkflowID = @WorkflowID
GO
