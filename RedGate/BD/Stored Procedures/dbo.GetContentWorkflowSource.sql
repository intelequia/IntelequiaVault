SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowSource]
	@WorkflowID INT,
    @SourceName NVARCHAR(20)
AS
    SELECT 
		[SourceID],
		[WorkflowID],
		[SourceName],
		[SourceType]
	FROM dbo.ContentWorkflowSources
    WHERE WorkflowID = @WorkflowID AND SourceName = @SourceName
GO
