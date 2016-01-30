SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[Mobile_SaveRedirectionRule]
    @Id INT ,
    @RedirectionId INT ,
    @Capbility NVARCHAR(50) ,
    @Expression NVARCHAR(50)
AS 
    IF @Id = -1 
        BEGIN
            INSERT  INTO dbo.Mobile_RedirectionRules
                    ( RedirectionId ,
                      Capability ,
                      Expression
		        )
            VALUES  ( @RedirectionId , -- RedirectionId - int
                      @Capbility , -- Capability - nvarchar(50)
                      @Expression  -- Expression - nvarchar(50)
		        )
        END
    ELSE 
        BEGIN
            UPDATE  dbo.Mobile_RedirectionRules
            SET     Capability = @Capbility ,
                    Expression = @Expression
            WHERE   Id = @Id
        END
GO
