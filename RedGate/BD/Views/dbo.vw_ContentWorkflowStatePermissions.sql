SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_ContentWorkflowStatePermissions]
AS
    SELECT     
	    WSP.WorkflowStatePermissionID, 
	    WSP.StateID, 
	    P.PermissionID, 
	    WSP.RoleID,
	    CASE WSP.RoleID
		    when -1 then 'All Users'
		    when -2 then 'Superuser'
		    when -3 then 'Unauthenticated Users'
		    else 	R.RoleName
	    END AS 'RoleName',
	    WSP.AllowAccess, 
	    WSP.UserID,
	    U.Username,
	    U.DisplayName, 
	    P.PermissionCode, 
	    P.ModuleDefID, 
	    P.PermissionKey, 
	    P.PermissionName, 
        WSP.CreatedByUserID, 
        WSP.CreatedOnDate, 
        WSP.LastModifiedByUserID, 
        WSP.LastModifiedOnDate    
    FROM dbo.ContentWorkflowStatePermission AS WSP 
	    LEFT OUTER JOIN dbo.Permission AS P ON WSP.PermissionID = P.PermissionID 
	    LEFT OUTER JOIN dbo.Roles AS R ON WSP.RoleID = R.RoleID
	    LEFT OUTER JOIN dbo.Users AS U ON WSP.UserID = U.UserID
GO
