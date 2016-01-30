SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTabVersionDetail]
    @Id INT
AS
BEGIN
    DELETE FROM dbo.[TabVersionDetails] WHERE TabVersionDetailId = @Id
END
GO
