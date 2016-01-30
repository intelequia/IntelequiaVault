SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPortalInfo]
	@PortalName         nvarchar(128),
	@Currency           char(3),
	@ExpiryDate         datetime,
	@HostFee            money,
	@HostSpace          int,
	@PageQuota          int,
	@UserQuota          int,
	@SiteLogHistory     int,
	@HomeDirectory		varchar(100),
	@CultureCode		nvarchar(50),
	@CreatedByUserID	int
AS

DECLARE @PortalID int

insert into dbo.Portals (
  ExpiryDate,
  UserRegistration,
  BannerAdvertising,
  Currency,
  HostFee,
  HostSpace,
  PageQuota,
  UserQuota,
  SiteLogHistory,
  DefaultLanguage,
  HomeDirectory,
  CreatedByUserID,
  CreatedOnDate,
  LastModifiedByUserID,
  LastModifiedOnDate
)
values (
  @ExpiryDate,
  0,
  0,
  @Currency,
  @HostFee,
  @HostSpace,
  @PageQuota,
  @UserQuota,
  @SiteLogHistory,
  @CultureCode,
  @HomeDirectory,
  @CreatedByUserID,
  getdate(),
  @CreatedByUserID,
  getdate()
)

SET @PortalID = SCOPE_IDENTITY()

IF @HomeDirectory = ''
BEGIN
	UPDATE dbo.Portals SET HomeDirectory = 'Portals/' + convert(varchar(10), @PortalID) WHERE PortalID = @PortalID
END

insert into dbo.PortalLocalization (PortalID,CultureCode,PortalName,Description,KeyWords)
			values (@PortalID,@CultureCode,@PortalName,@PortalName,@PortalName)
           
  
SELECT @PortalID
GO
