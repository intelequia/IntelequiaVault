SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StoreKey]
	@Bucket nvarchar(128),
	@Handle nvarchar(max),
	@ExpiresUtc datetime,
	@Secret varbinary(max)
AS
BEGIN
INSERT INTO dbo.[OAuthSymmetricCryptoKeys]
           ([Bucket]
           ,[Handle]
           ,[ExpiresUtc]
           ,[Secret])
     VALUES
           (@Bucket,@Handle,@ExpiresUtc,@Secret)
END
GO
