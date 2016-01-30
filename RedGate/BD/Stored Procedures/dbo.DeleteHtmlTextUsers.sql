SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteHtmlTextUsers]

as

delete
from   HtmlTextUsers
where  HtmlTextUserID in 
  ( select HtmlTextUserID
    from   HtmlTextUsers
    inner join dbo.HtmlText on dbo.HtmlTextUsers.ItemID = dbo.HtmlText.ItemID
    where HtmlTextUsers.ItemID = HtmlText.ItemID
    and HtmlTextUsers.StateID <> HtmlText.StateID )
GO
