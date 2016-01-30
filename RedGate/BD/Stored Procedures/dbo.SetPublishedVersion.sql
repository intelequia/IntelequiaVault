SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetPublishedVersion] 
	@FileId					int,
	@NewPublishedVersion	int
AS
BEGIN

	-- Insert a new record in the FileVersions table for the old published version
	INSERT dbo.[FileVersions]
				([FileId]
				,[Version]
				,[FileName]
				,[Extension]
				,[Size]
				,[Width]
				,[Height]
				,[ContentType]
				,[Content]
				,[CreatedByUserID]
				,[CreatedOnDate]
				,[LastModifiedByUserID]
				,[LastModifiedOnDate]
				,[SHA1Hash])
	SELECT		[FileId]
				,[PublishedVersion]  [Version]				
				,CONVERT(nvarchar, [FileId]) + '_' + CONVERT(nvarchar, [PublishedVersion]) +'.v.resources' 
				,[Extension]
				,[Size]
				,[Width]
				,[Height]
				,[ContentType]
				,[Content]
				,[CreatedByUserID]
				,[CreatedOnDate]
				,[LastModifiedByUserID]
				,[LastModifiedOnDate]
				,[SHA1Hash]					
	FROM Files
	WHERE FileId = @FileId

	-- Change Files.PublishedVersion to the new version number
	UPDATE dbo.[Files]
	SET	 [PublishedVersion] = @NewPublishedVersion		
		,[Extension] =v.[Extension]
		,[Size] = v.[Size]
		,[Width] = v.[Width]
		,[Height] = v.[Height]
		,[ContentType] = v.[ContentType]
		,[Content] = v.[Content]
		,[CreatedByUserID] = v.[CreatedByUserID]
		,[CreatedOnDate] = v.[CreatedOnDate]
		,[LastModifiedByUserID] = v.[LastModifiedByUserID]
		,[LastModifiedOnDate] = v.[LastModifiedOnDate]
		,[SHA1Hash] = v.[SHA1Hash]
	FROM dbo.[Files] f
		JOIN dbo.[FileVersions] v ON f.FileId = v.FileId
	WHERE f.FileId = @FileId
		AND v.Version = @NewPublishedVersion

    -- Delete the FileVersions entry of the version being published
	DELETE dbo.[FileVersions]
	WHERE FileId = @FileId AND Version = @NewPublishedVersion
END
GO
