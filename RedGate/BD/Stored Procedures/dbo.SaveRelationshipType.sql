SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SaveRelationshipType]
    @RelationshipTypeID INT ,
    @Direction INT ,
    @Name NVARCHAR(50) ,
    @Description NVARCHAR(500) ,
    @UserID INT
AS 
    IF ( @RelationshipTypeID = -1 ) 
        BEGIN
            INSERT  dbo.RelationshipTypes
                    ( Direction,
                      Name ,            
                      Description,					
                      CreatedByUserID ,
                      CreatedOnDate ,
                      LastModifiedByUserID ,
                      LastModifiedOnDate
			        
                    )
            VALUES  ( @Direction , --  @Direction INT 
                      @Name , -- Name - nvarchar(50)
                      @Description , -- @Description NVARCHAR(500)
                      @UserID , -- CreatedBy - int
                      GETDATE() , -- CreatedOn - datetime
                      @UserID , -- LastModifiedBy - int
                      GETDATE() -- LastModifiedOn - datetime
			        
                    )
                    
            SELECT  @RelationshipTypeID = SCOPE_IDENTITY()
        END
    ELSE 
        BEGIN
            UPDATE  dbo.RelationshipTypes
            SET     Name = @Name ,
                    Direction = @Direction ,
                    Description = @Description ,
                    LastModifiedByUserID = @UserID ,
                    LastModifiedOnDate = GETDATE()
            WHERE   RelationshipTypeID = @RelationshipTypeID
        END
        
    SELECT  @RelationshipTypeID
GO
