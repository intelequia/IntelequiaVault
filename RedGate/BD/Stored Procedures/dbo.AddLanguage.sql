SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddLanguage]

	@CultureCode		    nvarchar(50),
	@CultureName            nvarchar(200),
	@FallbackCulture        nvarchar(50),
	@CreatedByUserID	int

AS
	INSERT INTO dbo.Languages (
		CultureCode,
		CultureName,
		FallbackCulture,
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES (
		@CultureCode,
		@CultureName,
		@FallbackCulture,
		@CreatedByUserID,
	  	getdate(),
	  	@CreatedByUserID,
	  	getdate()
	)
	SELECT SCOPE_IDENTITY()
GO
