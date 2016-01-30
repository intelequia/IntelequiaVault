SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteHtmlText]

@ModuleID int,
@ItemID int

as

delete
from   dbo.HtmlText
where  ModuleID = @ModuleID
and ItemID = @ItemID
GO
