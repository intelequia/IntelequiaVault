SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFileVersion] 
	@FileId int,
	@Version int
AS
BEGIN
	DECLARE @PublishedVersion int

	-- Check there is at least one version
	IF NOT EXISTS(SELECT FileID FROM FileVersions WHERE FileId = @FileId)
	BEGIN
		SELECT NULL
		RETURN
	END
		
	SELECT @PublishedVersion = PublishedVersion
	FROM dbo.Files
	WHERE FileId = @FileId

	IF @PublishedVersion = @Version 
	BEGIN
		-- Get the previous version
		SELECT @PublishedVersion = MAX(Version)
		FROM dbo.FileVersions 
		WHERE FileId = @FileId
			AND Version < @Version

		-- If there is no previous version, get the min exsisting version
		IF @PublishedVersion IS NULL 
			SELECT @PublishedVersion = MIN(Version)
			FROM dbo.FileVersions 
			WHERE FileId = @FileId

		-- Update the published version
		IF @PublishedVersion IS NOT NULL 
		BEGIN
			UPDATE dbo.Files
			SET [PublishedVersion] = @PublishedVersion,
				[Extension] = v.[Extension],
				[Size] = v.[Size],
				[Width] = v.Width,		
				[Height] = v.Height,
				[ContentType] = v.ContentType,
				[Content] = v.Content,
				[LastModifiedByUserID] = v.LastModifiedByUserID,
				[LastModifiedOnDate] = v.LastModifiedOnDate,
				[SHA1Hash] = v.SHA1Hash
			FROM dbo.files AS f
				INNER JOIN dbo.FileVersions AS v
				ON ( f.FileId = v.FileId AND v.Version = @PublishedVersion)		
			WHERE f.FileId = @FileId

			DELETE FROM dbo.FileVersions
			WHERE FileId = @FileId 
			AND Version = @PublishedVersion
		END
	END

	DELETE FROM dbo.FileVersions
	WHERE FileId = @FileId 
	  AND Version = @Version

	SELECT @PublishedVersion
END
GO
