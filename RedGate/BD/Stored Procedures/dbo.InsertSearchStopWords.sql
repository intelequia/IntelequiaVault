SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertSearchStopWords]
	@StopWords 			nvarchar(MAX),
	@CreatedByUserID 		int,
	@PortalID				int,
	@CultureCode		nvarchar(50)
AS
BEGIN	
	INSERT INTO dbo.[SearchStopWords](
		[StopWords],  
		[CreatedByUserID],  
		[CreatedOnDate],  
		[LastModifiedByUserID],  
		[LastModifiedOnDate],
		[PortalID],
		[CultureCode]
	) VALUES (
		@StopWords,
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
