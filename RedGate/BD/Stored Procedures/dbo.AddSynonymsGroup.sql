SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddSynonymsGroup]
	@SynonymsTags 			nvarchar(MAX),
	@CreatedByUserID 		int,
	@PortalID				int,
	@CultureCode            nvarchar(50)
AS
BEGIN	
	INSERT INTO dbo.[SynonymsGroups](
		[SynonymsTags],  
		[CreatedByUserID],  
		[CreatedOnDate],  
		[LastModifiedByUserID],  
		[LastModifiedOnDate],
		[PortalID],
		[CultureCode]
	) VALUES (
		@SynonymsTags,
		@CreatedByUserID,
	    GETUTCDATE(),
		@CreatedByUserID,
		GETUTCDATE(),
		@PortalID,
		@CultureCode
	)	

	SELECT SCOPE_IDENTITY()
END
GO
