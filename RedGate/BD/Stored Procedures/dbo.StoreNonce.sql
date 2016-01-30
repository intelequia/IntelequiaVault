SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StoreNonce]
	 @context nvarchar(500),
	 @nonce nvarchar(128),
	 @timestampUtc datetime
AS
BEGIN
	INSERT INTO dbo.[OAuthNonces]
           ([Context]
           ,[Code]
           ,[Timestamp])
     VALUES
           (@context,@nonce,@timestampUtc)
END
GO
