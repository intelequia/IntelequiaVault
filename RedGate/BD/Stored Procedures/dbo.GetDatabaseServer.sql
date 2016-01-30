SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDatabaseServer]
AS
	SELECT ServerProperty('Edition') AS ProductName,
           ServerProperty('ProductVersion') AS Version
GO
