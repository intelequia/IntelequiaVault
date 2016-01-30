SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateContentWorkflow]
@WorkflowID int,
@WorkflowName nvarchar(40),
@Description nvarchar(256),
@IsDeleted bit,
@StartAfterCreating bit,
@StartAfterEditing bit,
@DispositionEnabled bit
AS

UPDATE dbo.ContentWorkflows
SET    WorkflowName = @WorkflowName,
       Description = @Description,
       IsDeleted = @IsDeleted,
	   StartAfterCreating = @StartAfterCreating,
	   StartAfterEditing = @StartAfterEditing,
	   DispositionEnabled = @DispositionEnabled
WHERE  WorkflowID = @WorkflowID
GO
