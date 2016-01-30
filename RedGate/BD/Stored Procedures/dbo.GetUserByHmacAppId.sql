SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserByHmacAppId]
(
	@HmacAppId nvarchar(256)
)

AS
	SELECT top 1 * FROM dbo.vw_Users
	WHERE  HmacAppId=@HmacAppId
GO
