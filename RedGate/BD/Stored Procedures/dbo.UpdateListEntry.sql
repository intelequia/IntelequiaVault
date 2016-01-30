SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[UpdateListEntry]
	
	@EntryID int, 
	@Value nvarchar(100), 
	@Text nvarchar(150), 
	@Description nvarchar(500),
	@LastModifiedByUserID	int

AS
	UPDATE dbo.Lists
		SET	
			[Value] = @Value,
			[Text] = @Text,	
			[Description] = @Description,
			[LastModifiedByUserID] = @LastModifiedByUserID,	
			[LastModifiedOnDate] = getdate()
		WHERE 	[EntryID] = @EntryID
GO
