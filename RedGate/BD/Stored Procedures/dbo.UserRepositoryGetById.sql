SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserRepositoryGetById]
	@id [nvarchar](128) 
AS
BEGIN
	select * from dbo.OAuthUsers where [Id]=@id
END
GO
