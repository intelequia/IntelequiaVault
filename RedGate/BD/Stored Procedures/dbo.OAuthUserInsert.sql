SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OAuthUserInsert]
	@Id nvarchar(128),
	@CreateDateUtc datetime
AS
BEGIN
	INSERT INTO dbo.[OAuthUsers]
           ([Id]
           ,[CreateDateUtc])
     VALUES (@Id,@CreateDateUtc)
END
GO
