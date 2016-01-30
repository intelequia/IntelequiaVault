SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[UpdateFileContent]

@FileId      int,
@Content     image

as

update dbo.Files
set    Content = @Content
where  FileId = @FileId
GO
