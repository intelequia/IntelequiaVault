SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateListSortOrder]
(
	@EntryID	int, 
	@MoveUp		bit
)
AS
	DECLARE @EntryListName nvarchar(50)
	DECLARE @ParentID int
	DECLARE @CurrentSortValue int
	DECLARE @ReplaceSortValue int
	-- Get the current sort order
	SELECT @CurrentSortValue = [SortOrder], @EntryListName = [ListName], @ParentID = [ParentID] 
		FROM dbo.Lists WITH (nolock) 
		WHERE [EntryID] = @EntryID
	-- Move the item up or down?
	IF (@MoveUp = 1)
	  BEGIN
		IF (@CurrentSortValue != 1) -- we rearrange sort order only if list enable sort order - sortorder >= 1
		  BEGIN
			SET @ReplaceSortValue = @CurrentSortValue - 1
			UPDATE dbo.Lists 
				SET [SortOrder] = @CurrentSortValue 
				WHERE [SortOrder] = @ReplaceSortValue And [ListName] = @EntryListName And [ParentID] = @ParentID
			UPDATE dbo.Lists 
				SET [SortOrder] = @ReplaceSortValue 
				WHERE [EntryID] = @EntryID
		  END
	  END
	ELSE
	  BEGIN
		IF (@CurrentSortValue < (SELECT MAX([SortOrder]) FROM dbo.Lists))
		BEGIN
		  SET @ReplaceSortValue = @CurrentSortValue + 1
		  UPDATE dbo.Lists 
			SET [SortOrder] = @CurrentSortValue 
			WHERE SortOrder = @ReplaceSortValue And [ListName] = @EntryListName  And [ParentID] = @ParentID
		  UPDATE dbo.Lists 
			SET [SortOrder] = @ReplaceSortValue 
			WHERE EntryID = @EntryID
		END
	  END
GO
