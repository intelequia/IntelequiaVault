SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_DeleteRedirection] @Id INT
AS 
    DELETE  FROM dbo.Mobile_RedirectionRules
    WHERE   RedirectionId = @id
		
    DELETE  FROM dbo.Mobile_Redirections
    WHERE   Id = @Id
GO
