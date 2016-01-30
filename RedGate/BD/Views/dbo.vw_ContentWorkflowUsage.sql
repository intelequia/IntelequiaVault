SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_ContentWorkflowUsage]
AS
    SELECT COALESCE(cm.MetaDataValue, ci.Content) as 'ContentName', ct.ContentType, ws.WorkflowID 
	FROM dbo.[ContentItems] ci
		INNER JOIN dbo.[ContentTypes] ct
			ON ci.ContentTypeID = ct.ContentTypeID
		INNER JOIN dbo.[ContentWorkflowStates] ws 
			ON ci.StateID = ws.StateID
		LEFT JOIN dbo.[ContentItems_MetaData] cm
			ON ci.ContentItemID = cm.ContentItemID 
				AND cm.MetaDataID = (SELECT MetaDataID FROM dbo.[MetaData] WHERE MetaDataName = 'Title')
	WHERE ct.ContentType != 'Tab' -- Tabs will be managed specifically
		AND ct.ContentType != 'File' -- Exclude Files
	UNION ALL
	SELECT t.TabPath, ct.ContentType, ws.WorkflowID 
	FROM dbo.[ContentItems] ci
		INNER JOIN dbo.[ContentTypes] ct
			ON ci.ContentTypeID = ct.ContentTypeID
		INNER JOIN dbo.[Tabs] t
			ON ci.TabID = t.TabID
		INNER JOIN dbo.[ContentWorkflowStates] ws 
			ON ci.StateID = ws.StateID
	WHERE ct.ContentType = 'Tab'
		AND LOWER(t.TabPath) not like '//admin/%'
		AND LOWER(t.TabPath) != '//admin'
		AND t.IsSystem = 0
		AND LOWER(t.TabPath) not like '//host/%'
		AND LOWER(t.TabPath) != '//host'
		AND ci.StateID IS NOT NULL
	UNION ALL
	SELECT t.TabPath, ct.ContentType, 
		(SELECT CAST(ps.SettingValue AS INT) value 
			FROM dbo.[PortalSettings] ps
			WHERE ps.SettingName = 'DefaultTabWorkflowKey' 
			AND ps.PortalID = t.PortalID) as WorkflowID 
	FROM dbo.[ContentItems] ci
		INNER JOIN dbo.[ContentTypes] ct
			ON ci.ContentTypeID = ct.ContentTypeID
		INNER JOIN dbo.[Tabs] t
			ON ci.TabID = t.TabID
	WHERE ct.ContentType = 'Tab'
		AND LOWER(t.TabPath) NOT LIKE '//admin/%'
		AND LOWER(t.TabPath) != '//admin'
		AND t.IsSystem = 0
		AND LOWER(t.TabPath) NOT LIKE '//host/%'
		AND LOWER(t.TabPath) != '//host'
		AND ci.StateID IS NULL
	UNION ALL
	SELECT '/' + f.FolderPath, 'Folder', f.WorkflowID 
	FROM dbo.[Folders] f
	WHERE f.WorkflowID IS NOT NULL
	UNION ALL
	SELECT '/' + f.FolderPath, 'Folder', 
		(SELECT wf.WorkflowID 
			FROM dbo.[ContentWorkflows] wf
			WHERE wf.WorkflowKey = 'DirectPublish' 
			AND wf.PortalID = f.PortalID) AS WorkflowID 
	FROM dbo.[Folders] f
	WHERE f.WorkflowID IS NULL
GO
