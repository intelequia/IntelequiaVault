SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SaveRelationship]
    @RelationshipID INT,
    @RelationshipTypeID INT,    
    @Name NVARCHAR(50),
    @Description NVARCHAR(500),
	@UserID INT,
	@PortalID INT,
	@DefaultResponse INT,
	@CreateUpdateUserID INT
    
AS 
    IF ( @RelationshipID = -1 ) 
        BEGIN
            INSERT  dbo.Relationships
                    ( RelationshipTypeID,
                      Name ,            
                      Description,					
					  UserID,
					  PortalID,		
					  DefaultResponse,			
                      CreatedByUserID ,
                      CreatedOnDate ,
                      LastModifiedByUserID ,
                      LastModifiedOnDate
			        
                    )
            VALUES  ( @RelationshipTypeID , -- @RelationshipTypeID INT
                      @Name , -- Name - nvarchar(50)
                      @Description , -- @Description NVARCHAR(500)
					  @UserID , -- @UserID int
					  @PortalID , -- @PortalID int
					  @DefaultResponse, -- @DefaultResponse int
                      @CreateUpdateUserID , -- CreatedBy - int
                      GETDATE() , -- CreatedOn - datetime
                      @CreateUpdateUserID , -- LastModifiedBy - int
                      GETDATE() -- LastModifiedOn - datetime
			        
                    )
                    
            SELECT  @RelationshipID = SCOPE_IDENTITY()
        END
    ELSE 
        BEGIN
            UPDATE  dbo.Relationships
            SET     Name = @Name ,                    
                    Description = @Description,
					RelationshipTypeID = @RelationshipTypeID,
					UserID = @UserID,
					PortalID = @PortalID,
					DefaultResponse = @DefaultResponse,
                    LastModifiedByUserID = @CreateUpdateUserID,
                    LastModifiedOnDate = GETDATE()
            WHERE   RelationshipID = @RelationshipID
        END
        
    SELECT  @RelationshipID
GO
