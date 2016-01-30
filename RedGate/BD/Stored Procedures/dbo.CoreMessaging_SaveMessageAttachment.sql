SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_SaveMessageAttachment]
    @MessageAttachmentID int,
    @MessageID int,
    @FileID int,
	@CreateUpdateUserID INT
AS
    IF ( @MessageAttachmentID = -1 )
        BEGIN
            INSERT dbo.CoreMessaging_MessageAttachments(
					[FileID],
					[MessageID],
                    [CreatedByUserID],
                    [CreatedOnDate],
                    [LastModifiedByUserID],
                    [LastModifiedOnDate]
                    )
            VALUES  (
					@FileID,
					@MessageID,
                    @CreateUpdateUserID , -- CreatedBy - int
                    GETDATE() , -- CreatedOn - datetime
                    @CreateUpdateUserID , -- LastModifiedBy - int
                    GETDATE() -- LastModifiedOn - datetime
                    )

            SELECT  @MessageAttachmentID = SCOPE_IDENTITY()
        END
    ELSE
        BEGIN
            UPDATE  dbo.CoreMessaging_MessageAttachments
            SET     [FileID] = @FileID,
					[MessageID] = @MessageID,
                    LastModifiedByUserID = @CreateUpdateUserID,
                    LastModifiedOnDate = GETDATE()
            WHERE   MessageAttachmentID = @MessageAttachmentID
        END

    SELECT  @MessageAttachmentID
GO
