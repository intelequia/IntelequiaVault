SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteTranslatedTabs]
    @PortalID INT ,
    @CultureCode NVARCHAR(10)
AS 
    BEGIN

        SET NOCOUNT ON;
		
        BEGIN TRY

            BEGIN TRANSACTION DeleteTranslatedTabs
		
			-- first store ContentItem records to be deleted
            DECLARE @TempDeleteCI TABLE ( ContentItemId INT )
        
            INSERT  INTO @TempDeleteCI
                    SELECT  ContentItemId
                    FROM    dbo.Tabs
                    WHERE   ( PortalID = @PortalID )
                            AND ( CultureCode = @CultureCode )

		-- delete all tabs in the portal that have been localized to the requested cultureCode
		-- This will also delete related tabmodule records
            DELETE  FROM dbo.Tabs
            WHERE   ( PortalID = @PortalID )
                    AND ( CultureCode = @CultureCode )

		
		-- append ContentItems to be deleted from stale modules
            INSERT  INTO @TempDeleteCI
                    SELECT  ContentItemID
                    FROM    dbo.ContentItems CI
                    WHERE   EXISTS ( SELECT *
                                     FROM   dbo.Modules M
                                     WHERE  ( CI.ModuleID = M.ModuleID )
                                            AND NOT EXISTS ( SELECT
                                                              *
                                                             FROM
                                                              dbo.TabModules TM
                                                             WHERE
                                                              M.ModuleID = TM.ModuleID ) )

		-- delete stale modules (these are modules that do not have a corresponding TabModules record,
		-- in other words: modules that are not placed on any page anymore)
            DELETE  FROM dbo.Modules
            WHERE   NOT EXISTS ( SELECT *
                                 FROM   dbo.TabModules
                                 WHERE  dbo.Modules.ModuleID = dbo.TabModules.ModuleID )

		-- finally delete all corresponding content items
            DELETE  FROM dbo.ContentItems
            WHERE   ContentItemID IN ( SELECT   ContentItemID
                                       FROM     @TempDeleteCI )

            COMMIT TRANSACTION DeleteTranslatedTabs

        END TRY
  
        BEGIN CATCH
            IF @@TRANCOUNT > 0 
                ROLLBACK TRANSACTION DeleteTranslatedTabs


            DECLARE @ErrorMessage NVARCHAR(4000);
            DECLARE @ErrorSeverity INT;

            SELECT  @ErrorMessage = ERROR_MESSAGE() ,
                    @ErrorSeverity = ERROR_SEVERITY();

            RAISERROR (@ErrorMessage, @ErrorSeverity, 1 );			
			
        END CATCH	      

    END
GO
