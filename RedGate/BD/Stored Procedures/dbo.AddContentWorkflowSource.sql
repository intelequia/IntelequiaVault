SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentWorkflowSource]
	@WorkflowID INT,
    @SourceName NVARCHAR(20),
    @SourceType NVARCHAR(250)
AS
    INSERT INTO  dbo.ContentWorkflowSources(
		[WorkflowID],
		[SourceName],
		[SourceType])
    VALUES(
        @WorkflowID,
        @SourceName,
        @SourceType
    )

    SELECT SCOPE_IDENTITY()
GO
