SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ResourceRepositoryFindWithSupportedScopes]
	@scope nvarchar(256)
AS
BEGIN
	select * from dbo.OAuthResources -- where id=@id
END
GO
