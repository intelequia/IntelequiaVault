SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPasswordHistory]
    @UserId			int,
    @Password			nvarchar(128),
    @PasswordSalt		nvarchar(128),
	@Retained			int,
    @CreatedByUserID  	int
AS

        BEGIN
		
          INSERT INTO dbo.PasswordHistory (
            UserId,
            [Password],
            PasswordSalt,
			CreatedByUserID,
			CreatedOnDate,
			LastModifiedByUserID,
			LastModifiedOnDate
          )
          VALUES (
            @UserId,
            @Password,
            @PasswordSalt,
            
			@CreatedByUserID,
			getdate(),
			@CreatedByUserID,
			getdate()
          )

		  DELETE FROM dbo.PasswordHistory where UserID=@UserId and PasswordHistoryID NOT IN (
					SELECT TOP (@Retained) PasswordHistoryID from dbo.PasswordHistory
					WHERE UserID=@UserId order by CreatedOnDate desc
					)

        END
GO
