SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SCKRGetKey]
	@Bucket nvarchar(128),
	@Handle nvarchar(max)
AS
BEGIN
	select * from dbo.[OAuthSymmetricCryptoKeys] where [Bucket]=@Bucket AND [Handle]=@Handle
END
GO
