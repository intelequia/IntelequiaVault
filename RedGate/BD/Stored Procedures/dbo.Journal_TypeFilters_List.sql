SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_TypeFilters_List]
@PortalId int,
@ModuleId int
AS
SELECT jt.JournalTypeId, jt.JournalType from dbo.[Journal_Types] as jt INNER JOIN
	dbo.[Journal_TypeFilters] as jf ON jf.JournalTypeId = jt.JournalTypeId
WHERE jt.PortalId = @PortalId AND jf.ModuleId = @ModuleId
GO
