SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetWorkflowStates]
	@WorkflowID int

as

select *
from   dbo.WorkflowStates
inner join dbo.Workflow on dbo.WorkflowStates.WorkflowID = dbo.Workflow.WorkflowID
where dbo.WorkflowStates.WorkflowID = @WorkflowID
order by [Order]
GO
