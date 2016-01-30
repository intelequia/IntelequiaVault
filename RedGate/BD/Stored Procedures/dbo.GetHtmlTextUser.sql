SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetHtmlTextUser]

@UserID int

as

select HtmlTextUsers.*,
       WorkflowStates.StateName
from   dbo.HtmlTextUsers
inner join dbo.WorkflowStates on dbo.HtmlTextUsers.StateID = dbo.WorkflowStates.StateID
where  HtmlTextUsers.UserID = @UserID
order by HtmlTextUsers.CreatedOnDate asc
GO
