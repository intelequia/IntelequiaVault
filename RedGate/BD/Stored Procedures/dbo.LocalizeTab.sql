SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LocalizeTab] 
	@TabId					int,
	@CultureCode			nvarchar(10),
	@LastModifiedByUserID	int
AS
	BEGIN
		UPDATE dbo.Tabs
			SET 
				CultureCode				= @CultureCode,
				LastModifiedByUserID	= @LastModifiedByUserID,
				LastModifiedOnDate		= getdate()					
			WHERE TabID = @TabId
			
		UPDATE dbo.TabModules
			SET 
				CultureCode				= @CultureCode,
				LastModifiedByUserID	= @LastModifiedByUserID,
				LastModifiedOnDate		= getdate()					
			WHERE TabID = @TabId
	END
GO
