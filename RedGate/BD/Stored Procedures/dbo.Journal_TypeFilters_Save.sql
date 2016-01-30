SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_TypeFilters_Save]
@PortalId int,
@ModuleId int,
@JournalTypeId int
AS
INSERT INTO dbo.[Journal_TypeFilters] 
	(PortalId, ModuleId, JournalTypeId)
	VALUES
	(@PortalId, @ModuleId, @JournalTypeId)
GO
