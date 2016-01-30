SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertOAuthSettings]
@AuthorizationServerPrivateKey nvarchar(max),
@ResourceServerDecryptionKey nvarchar(max),
@AuthorizationServerVerificationKey nvarchar(max)
AS
BEGIN

INSERT INTO dbo.[OAuthSettings] ([AuthorizationServerPrivateKey],[ResourceServerDecryptionKey] ,[AuthorizationServerVerificationKey])
VALUES (@AuthorizationServerPrivateKey,@ResourceServerDecryptionKey,@AuthorizationServerVerificationKey)
END
GO
