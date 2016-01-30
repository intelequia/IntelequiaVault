SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AuthorizationRepositoryFindCurrent]
	 @clientIdentifier nvarchar(256),
	 @userIdentifier nvarchar(256),
	 @afterUtc datetime
AS
BEGIN
	select * from dbo.OAuthAuthorizations where ClientId=@clientIdentifier and CreatedOnUtc<=@afterUtc
END
GO
