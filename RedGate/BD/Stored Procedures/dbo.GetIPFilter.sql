SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetIPFilter]
@InputFilter int
AS 
	SELECT * FROM dbo.IPFilter where IPFilterID=@InputFilter
GO
