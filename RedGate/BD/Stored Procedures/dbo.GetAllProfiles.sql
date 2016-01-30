SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[GetAllProfiles]
AS
SELECT * FROM dbo.Profile
GO
