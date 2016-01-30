SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BuildTabLevelAndPath](@TabId INT, @IncludeChild BIT = 0)
	AS
	BEGIN
		DECLARE @ParentId INT, @Level INT, @TabPath NVARCHAR(255), @TabName NVARCHAR(200)
		SELECT @ParentId = ParentId, @TabName = TabName FROM dbo.[Tabs] WHERE TabID = @TabId
		IF @ParentId > 0
		BEGIN
			SELECT 
				@Level = [Level] + 1,
				@TabPath = TabPath + '//' + dbo.[RemoveStringCharacters](@TabName, '&? ./''#:*')
			 FROM dbo.[Tabs] WHERE TabID = @ParentId
		END
		ELSE
		BEGIN
			SELECT @Level = 0, @TabPath = '//' + dbo.[RemoveStringCharacters](@TabName, '&? ./''#:*')
		END
		
		UPDATE dbo.[Tabs] SET [Level] = @Level, TabPath = @TabPath WHERE TabID = @TabId
		
		IF @IncludeChild = 1
		BEGIN
			DECLARE @ChildTabs TABLE(TabID INT)
			DECLARE @ChildID INT
			INSERT INTO @ChildTabs SELECT TabID FROM dbo.[Tabs] WHERE ParentId =  @TabId
			WHILE EXISTS (SELECT TOP 1 TabID FROM @ChildTabs)
				BEGIN
					SET @ChildID = (SELECT TOP 1 TabID FROM @ChildTabs)
					EXEC dbo.[BuildTabLevelAndPath] @ChildID, @IncludeChild
					DELETE FROM @ChildTabs WHERE TabID = @ChildID
				END
		END
	END
GO
