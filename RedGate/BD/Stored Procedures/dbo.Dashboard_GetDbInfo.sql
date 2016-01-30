SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[Dashboard_GetDbInfo]
AS
	
	SELECT
		ServerProperty('ProductVersion') AS ProductVersion, 
		ServerProperty('ProductLevel') AS ServicePack, 
		ServerProperty('Edition') AS ProductEdition, 
		@@VERSION AS SoftwarePlatform
GO
