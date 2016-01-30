SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_SaveRedirection]
    @Id INT ,
    @PortalId INT ,
    @Name NVARCHAR(50) ,
    @Type INT ,
    @SortOrder INT ,
    @SourceTabId INT ,
	@IncludeChildTabs BIT ,
    @TargetType INT ,
    @TargetValue NVARCHAR(260) ,
	@Enabled BIT,
    @UserId INT
AS 
    IF ( @Id = -1 ) 
        BEGIN
            INSERT  dbo.Mobile_Redirections
                    ( PortalId ,
                      Name ,
                      Type ,
                      SortOrder ,
                      SourceTabId ,
					  IncludeChildTabs ,
                      TargetType ,
                      TargetValue ,
					  Enabled ,
                      CreatedByUserID ,
                      CreatedOnDate ,
                      LastModifiedByUserID ,
                      LastModifiedOnDate
			        
                    )
            VALUES  ( @PortalId , -- PortalId - int
                      @Name , -- Name - nvarchar(50)
                      @Type , -- Type - int
                      @SortOrder , -- SortOrder - int
                      @SourceTabId , -- SourceTabId - int
					  @IncludeChildTabs ,
                      @TargetType ,
                      @TargetValue ,
					  @Enabled ,
                      @UserId , -- CreatedBy - int
                      GETDATE() , -- CreatedOn - datetime
                      @UserId , -- LastModifiedBy - int
                      GETDATE() -- LastModifiedOn - datetime
			        
                    )
		SELECT  SCOPE_IDENTITY()
        END
    ELSE 
        BEGIN
            UPDATE  dbo.Mobile_Redirections
            SET     Name = @Name ,
                    [Type] = @Type ,
                    SortOrder = @SortOrder ,
                    SourceTabId = @SourceTabId ,
					IncludeChildTabs = @IncludeChildTabs ,
                    TargetType = @TargetType ,
                    TargetValue = @TargetValue ,
					Enabled = @Enabled ,
                    LastModifiedByUserID = @UserId ,
                    LastModifiedOnDate = GETDATE()
            WHERE   Id = @Id
			SELECT @Id
        END
GO
