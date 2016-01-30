SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientRepositoryGetById]
	@id nvarchar(256)
AS
BEGIN
	select * from dbo.OAuthClients where id=@id
END
GO
