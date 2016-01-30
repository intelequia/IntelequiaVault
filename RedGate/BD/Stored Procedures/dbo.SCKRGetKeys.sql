SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SCKRGetKeys]
	@Bucket nvarchar(128)
AS
BEGIN
	select * from dbo.[OAuthSymmetricCryptoKeys] where [Bucket]=@Bucket 
END
GO
