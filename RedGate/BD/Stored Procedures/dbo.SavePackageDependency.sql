SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SavePackageDependency]
	@PackageDependencyID INT,
	@PackageID INT,
	@PackageName NVARCHAR(128),
	@Version NVARCHAR(50)
AS
	IF EXISTS (SELECT PackageDependencyID FROM PackageDependencies WHERE PackageID = @PackageID AND PackageName = @PackageName AND Version = @Version)
		BEGIN
			UPDATE dbo.[PackageDependencies]
			   SET [PackageID] = @PackageID,
					[PackageName] = @PackageName,
					[Version] = @Version
			 WHERE PackageDependencyID = @PackageDependencyID
		END
	ELSE
		BEGIN
			INSERT INTO dbo.[PackageDependencies] (
				[PackageID],
				[PackageName],
				[Version]
			)
			VALUES (
				@PackageID,
				@PackageName,
				@Version
			)
			SET @PackageDependencyID = (SELECT @@IDENTITY)
		END

	SELECT @PackageDependencyID
GO
