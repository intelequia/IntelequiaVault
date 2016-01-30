SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetWorkflows]
	@PortalID int
as
	select *
	from   dbo.Workflow
	where (PortalID = @PortalID or PortalID is null)
	order by WorkflowName
GO
