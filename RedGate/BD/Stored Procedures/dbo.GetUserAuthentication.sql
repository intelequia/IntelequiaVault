SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserAuthentication]
  @UserID          int

AS
  select * from dbo.UserAuthentication
     where UserId = @UserID
GO
