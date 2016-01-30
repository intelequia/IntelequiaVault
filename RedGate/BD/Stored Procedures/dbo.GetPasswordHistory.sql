SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPasswordHistory]
    @UserID			int
AS
        SELECT * from dbo.PasswordHistory where UserID=@UserID
GO
