SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_GetRedirectionRules] @RedirectionId INT
AS 
    SELECT  Id ,
            RedirectionId ,
            Capability ,
            Expression
    FROM    Mobile_RedirectionRules
    WHERE RedirectionId = @RedirectionId
GO
