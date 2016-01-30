SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[RegisterAssembly]
	@PackageID      int,
	@AssemblyName   nvarchar(250),
	@Version		nvarchar(20)
As
	DECLARE @AssemblyID int
	DECLARE @CurrentVersion nvarchar(20)
	/*	@ReturnCode Values
		0 - Assembly Does not Exist
		1 - Older Version of Assembly Exists
		2 - Assembly Already Registered - Version = CurrentVersion
		3 - Assembly Already Registered - Version < CurrentVersion
	*/
	DECLARE @CompareVersion int

	-- First check if this assembly is registered to this package
	SET @AssemblyID = (SELECT AssemblyID 
							FROM dbo.Assemblies
							WHERE PackageID = @PAckageID
								AND AssemblyName = @AssemblyName)

	IF @AssemblyID IS NULL
		BEGIN
			-- AssemblyID is null (not registered) 
			-- but assembly may be registerd by other packages so check for Max unstalled version
			SET @CurrentVersion  = (SELECT Max(Version )
										FROM dbo.Assemblies
										WHERE AssemblyName = @AssemblyName)

			SET @CompareVersion = dbo.fn_CompareVersion(@Version, @CurrentVersion)
			
			-- Add an assembly regsitration for this package
			INSERT INTO dbo.Assemblies (
				PackageID,
				AssemblyName,
				Version
			)
			VALUES (
				@PackageID,
				@AssemblyName,
				@Version
			)
		END
	ELSE
		BEGIN
			-- AssemblyID is not null - Assembly is registered - test for version
			SET @CurrentVersion  = (SELECT Version 
										FROM dbo.Assemblies
										WHERE AssemblyID = @AssemblyID)
			
			SET @CompareVersion = dbo.fn_CompareVersion(@Version, @CurrentVersion)
			
			IF @CompareVersion = 1
				BEGIN
					-- Newer version - Update Assembly registration
					UPDATE dbo.Assemblies
					SET    Version = @Version
					WHERE  AssemblyID = @AssemblyID
				END
		END

	SELECT @CompareVersion
GO
