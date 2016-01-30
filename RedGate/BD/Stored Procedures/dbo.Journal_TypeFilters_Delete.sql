SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_TypeFilters_Delete]
@PortalId int,
@ModuleId int
AS
DELETE FROM dbo.[Journal_TypeFilters] WHERE PortalId = @PortalId AND ModuleId=@ModuleId
GO
