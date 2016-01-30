SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SaveUserRelationshipPreference]
    @PreferenceID INT,
	@UserID INT,	
	@RelationshipID INT,
	@DefaultResponse INT,
	@CreateUpdateUserID INT
    
AS 
    IF ( @PreferenceID = -1 ) 
        BEGIN
            INSERT  dbo.UserRelationshipPreferences
                    ( UserID,					  
					  RelationshipID,
					  DefaultResponse,
                      CreatedByUserID ,
                      CreatedOnDate ,
                      LastModifiedByUserID ,
                      LastModifiedOnDate
			        
                    )
            VALUES  ( @UserID , -- @UserID int					  
					  @RelationshipID, -- @RelationshipID int
					  @DefaultResponse , -- @DefaultResponse int
                      @CreateUpdateUserID , -- CreatedBy - int
                      GETDATE() , -- CreatedOn - datetime
                      @CreateUpdateUserID , -- LastModifiedBy - int
                      GETDATE() -- LastModifiedOn - datetime
			        
                    )
                    
            SELECT  @PreferenceID = SCOPE_IDENTITY()
        END
    ELSE 
        BEGIN
            UPDATE  dbo.UserRelationshipPreferences
            SET     UserID = @UserID,					
					RelationshipID = @RelationshipID,
					DefaultResponse = @DefaultResponse,
                    LastModifiedByUserID = @CreateUpdateUserID,
                    LastModifiedOnDate = GETDATE()
            WHERE   PreferenceID = @PreferenceID
        END
        
    SELECT  @PreferenceID
GO
