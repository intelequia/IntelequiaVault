SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OAuthAuthorizationInsert]
@ClientId [nvarchar](128) ,
@UserId [nvarchar](128) ,
@ResourceId [int]  ,
@Scope [nvarchar] ,
@CreatedOnUtc [datetime]  ,
@ExpirationDateUtc [datetime] 
AS
BEGIN

INSERT dbo.[OAuthAuthorizations]([ClientId], [UserId], [ResourceId], [Scope], [CreatedOnUtc], [ExpirationDateUtc])
VALUES (@ClientId, @UserId, @ResourceId, @Scope, @CreatedOnUtc, NULL)
END
GO
