SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SaveTabVersion]
    @Id INT,
    @TabId INT,
    @TimeStamp DATETIME,
    @Version INT,
	@IsPublished BIT,
    @CreatedByUserID [INT] = -1,
	@LastModifiedByUserID [INT] = -1
AS
BEGIN
    IF ISNULL(@Id, 0) = 0
    BEGIN
        INSERT INTO dbo.[TabVersions](            
            [TabId],
            [TimeStamp],
            [Version],
			[IsPublished],
            [CreatedByUserID],
            [CreatedOnDate],
            [LastModifiedByUserID],
            [LastModifiedOnDate]
        ) VALUES (
            @TabId,
            @TimeStamp,
            @Version,      
			@IsPublished,      
            @CreatedByUserID,
            GETDATE(),
            @LastModifiedByUserID,
            GETDATE()
        )

        SELECT @Id = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        UPDATE dbo.[TabVersions] SET            
            [TabId] = @TabId,
            [Version] = @Version,
            [TimeStamp] = @TimeStamp,
			[IsPublished] = @IsPublished,
            [LastModifiedByUserID] = @LastModifiedByUserID,
            [LastModifiedOnDate] = GETDATE()
        WHERE TabVersionId = @Id
    END
	SELECT @Id
END
GO
