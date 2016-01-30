SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAuthenticationServices]
AS
	SELECT *
		FROM   dbo.Authentication
GO
