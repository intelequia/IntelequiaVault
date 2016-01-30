SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[UpdateHtmlText]

@ItemID          int,
@Content         ntext,
@Summary		 ntext,
@StateID         int,
@IsPublished     bit,
@UserID          int

as

update dbo.HtmlText
set    Content              = @Content,
	   Summary				= @Summary,
       StateID              = @StateID,
       IsPublished          = @IsPublished,
       LastModifiedByUserID = @UserID,
       LastModifiedOnDate   = getdate()
where  ItemID = @ItemID
GO
