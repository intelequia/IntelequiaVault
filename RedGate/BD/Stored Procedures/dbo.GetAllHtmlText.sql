SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetAllHtmlText]

@ModuleID int

as

select dbo.HtmlText.*,
       dbo.WorkflowStates.*,
       dbo.Workflow.WorkflowName,
       dbo.Users.DisplayName,
       dbo.Modules.PortalID
from   dbo.HtmlText
inner join dbo.Modules on dbo.Modules.ModuleID = dbo.HtmlText.ModuleID
inner join dbo.WorkflowStates on dbo.WorkflowStates.StateID = dbo.HtmlText.StateID
inner join dbo.Workflow on dbo.WorkflowStates.WorkflowID = dbo.Workflow.WorkflowID
left outer join dbo.Users on dbo.HtmlText.LastModifiedByUserID = dbo.Users.UserID
where  dbo.HtmlText.ModuleID = @ModuleID
order by dbo.HtmlText.LastModifiedOnDate desc
GO
