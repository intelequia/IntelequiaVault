SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetListEntry]

	@ListName nvarchar(50),
	@Value nvarchar(200),
	@EntryID int

AS
	SELECT *
	FROM dbo.vw_Lists
	WHERE ([ListName] = @ListName OR @ListName='')
		AND ([EntryID]=@EntryID OR @EntryID = -1)
		AND ([Value]=@Value OR @Value = '')
GO
