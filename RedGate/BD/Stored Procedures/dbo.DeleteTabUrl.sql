SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTabUrl] 
	@TabID				int,
	@SeqNum				int
AS
	DELETE FROM dbo.TabUrls
	WHERE TabId = @TabID AND SeqNum = @SeqNum
GO
