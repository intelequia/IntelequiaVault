SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddSkinPackage]
	@PackageID  int,
	@PortalID   int,
	@SkinName   nvarchar(50),
	@SkinType   nvarchar(20),
	@CreatedByUserID	int
AS
	INSERT INTO dbo.SkinPackages (
	  PackageID,
	  PortalID,
	  SkinName,
	  SkinType,
	[CreatedByUserID],
	[CreatedOnDate],
	[LastModifiedByUserID],
	[LastModifiedOnDate]
	)
	VALUES (
	  @PackageID,
	  @PortalID,
	  @SkinName,
	  @SkinType,
	  @CreatedByUserID,
	  getdate(),
	  @CreatedByUserID,
	  getdate()
	)
	SELECT SCOPE_IDENTITY()
GO
