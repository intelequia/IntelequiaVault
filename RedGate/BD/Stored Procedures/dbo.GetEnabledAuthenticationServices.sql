SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEnabledAuthenticationServices]
AS
	SELECT *
		FROM   dbo.Authentication
		WHERE  IsEnabled = 1
GO
