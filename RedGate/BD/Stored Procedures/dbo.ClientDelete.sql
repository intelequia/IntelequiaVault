SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientDelete]
@ClientId [nvarchar](128) 
AS
BEGIN

delete from dbo.[OAuthClients] where Id=@ClientId
END
GO
