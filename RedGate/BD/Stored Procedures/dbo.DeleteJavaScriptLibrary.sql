SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteJavaScriptLibrary]
	@JavaScriptLibraryID INT
AS
	DELETE FROM dbo.[JavaScriptLibraries]
	WHERE JavaScriptLibraryID = @JavaScriptLibraryID
GO
