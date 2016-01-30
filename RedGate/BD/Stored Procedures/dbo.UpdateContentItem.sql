SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateContentItem] 
	@ContentItemID			int,
	@Content				nvarchar(max),
	@ContentTypeID			int,
	@TabID					int,
	@ModuleID				int, 
	@ContentKey				nvarchar(250),
	@Indexed				bit,
	@LastModifiedByUserID	int,
	@StateID				int = NULL
AS
	UPDATE dbo.[ContentItems] 
		SET 
			Content = @Content,
			ContentTypeID = @ContentTypeID,
			TabID = @TabID,
			ModuleID = @ModuleID,
			ContentKey = @ContentKey,
			Indexed = @Indexed,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate(),
			StateID = @StateID
	WHERE ContentItemId = @ContentItemId
GO
