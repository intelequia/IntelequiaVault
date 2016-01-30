SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabOrder] 
	@TabId					int,
	@TabOrder				int,
	@ParentId				int,
	@LastModifiedByUserID	int
AS
	DECLARE @OldParentId INT
	SELECT @OldParentId = ParentId FROM dbo.Tabs WHERE TabID = @TabId
	UPDATE Tabs
		SET
			TabOrder				= @TabOrder,
			ParentId				= @ParentId,
			LastModifiedByUserID	= @LastModifiedByUserID,
			LastModifiedOnDate		= GETDATE()
	WHERE  TabId = @TabId
	IF @OldParentId <> @ParentId
		BEGIN
			EXEC dbo.BuildTabLevelAndPath @TabId, 1
		END
	ELSE
		BEGIN
			EXEC dbo.BuildTabLevelAndPath @TabId
		END
GO
