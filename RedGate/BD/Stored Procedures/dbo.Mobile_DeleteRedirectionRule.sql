SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_DeleteRedirectionRule] @Id INT
AS 
    DELETE  FROM dbo.Mobile_RedirectionRules
    WHERE   Id = @id
GO
