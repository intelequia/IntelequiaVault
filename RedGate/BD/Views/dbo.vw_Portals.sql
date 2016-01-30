SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_Portals]
AS
    SELECT
        P.PortalID,
        P.PortalGroupID,
        PL.PortalName,
        dbo.FilePath(PL.LogoFile) AS LogoFile,
        PL.FooterText,
        P.ExpiryDate,
        P.UserRegistration,
        P.BannerAdvertising,
        P.AdministratorId,
        P.Currency,
        P.HostFee,
        P.HostSpace,
        P.PageQuota,
        P.UserQuota,
        P.AdministratorRoleId,
        P.RegisteredRoleId,
        PL.Description,
        PL.KeyWords,
        dbo.FilePath(PL.BackgroundFile) AS BackgroundFile,
        P.GUID,
        P.PaymentProcessor,
        P.ProcessorUserId,
        P.ProcessorPassword,
        P.SiteLogHistory,
        U.Email,
        P.DefaultLanguage,
        P.TimezoneOffset,
        PL.AdminTabId,
        P.HomeDirectory,
        PL.SplashTabId,
        PL.HomeTabId,
        PL.LoginTabId,
        PL.RegisterTabId,
        PL.UserTabId,
        PL.SearchTabId,
        PL.Custom404TabId,
        PL.Custom500TabId,
        dbo.SuperUserTabID() AS SuperTabId,
        P.CreatedByUserID,
        P.CreatedOnDate,
        P.LastModifiedByUserID,
        P.LastModifiedOnDate,
        PL.CultureCode
    FROM       dbo.Portals            AS P
    INNER JOIN dbo.PortalLocalization AS PL ON P.PortalID = PL.PortalID
    LEFT  JOIN dbo.Users              AS U  ON P.AdministratorId = U.UserID
GO
