SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CountLegacyMessages]    
AS
	--Return total records
	SELECT COUNT(*) AS TotalRecords
	FROM dbo.[Messaging_Messages]
GO
