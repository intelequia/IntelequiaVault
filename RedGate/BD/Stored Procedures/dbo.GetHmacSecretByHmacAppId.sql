SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetHmacSecretByHmacAppId]
(
	@HmacAppId nvarchar(256)
)

AS
	SELECT top 1 HmacAppSecret FROM dbo.vw_Users
	WHERE  HmacAppId=@HmacAppId
GO
