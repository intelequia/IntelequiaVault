SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientInsert]
@ClientId [nvarchar](128) ,
@ClientSecret nvarchar(max) ,
@Callback nvarchar(max)  ,
@Name nvarchar(max) ,
@ClientType [int]  
AS
BEGIN

INSERT dbo.[OAuthClients]([Id],[ClientSecret],[Callback],[Name],[ClientType])
VALUES (@ClientId, @ClientSecret, null, @Name, @ClientType)
END
GO
