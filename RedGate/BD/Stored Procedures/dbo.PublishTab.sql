SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PublishTab]
	@TabID INT
AS
BEGIN 
        UPDATE dbo.[Tabs] SET            
            [HasBeenPublished] = 1
        WHERE TabID = @TabID
END
GO
