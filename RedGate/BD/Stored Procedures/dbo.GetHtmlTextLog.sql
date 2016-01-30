SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetHtmlTextLog]

@ItemID int

as

select HtmlTextLog.ItemID,
       HtmlTextLog.StateID,
       WorkflowStates.StateName,
       HtmlTextLog.Comment,
       HtmlTextLog.Approved,
       HtmlTextLog.CreatedByUserID,
       Users.DisplayName,
       HtmlTextLog.CreatedOnDate
from dbo.HtmlTextLog
inner join dbo.WorkflowStates on dbo.HtmlTextLog.StateID = dbo.WorkflowStates.StateID
left outer join dbo.Users on dbo.HtmlTextLog.CreatedByUserID = dbo.Users.UserID
where ItemID = @ItemID
order by HtmlTextLog.CreatedOnDate desc
GO
