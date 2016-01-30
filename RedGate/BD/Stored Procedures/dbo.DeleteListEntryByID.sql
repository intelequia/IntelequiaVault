SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[DeleteListEntryByID]

@EntryId   int,
@DeleteChild bit

as

Delete
From dbo.Lists
Where  [EntryID] = @EntryID

If @DeleteChild = 1
Begin
	Delete 
	From dbo.Lists
	Where [ParentID] = @EntryID
End
GO
