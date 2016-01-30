SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Types_Save]
@JournalTypeId int,
@JournalType nvarchar(25),
@icon nvarchar(25),
@PortalId int,
@IsEnabled bit,
@AppliesToProfile bit,
@AppliesToGroup bit,
@AppliesToStream bit,
@options nvarchar(max),
@SupportsNotify bit
AS
IF EXISTS(SELECT JournalTypeId from dbo.[Journal_Types] WHERE JournalTypeId=@JournalTypeId AND PortalId = @PortalId)
	BEGIN
		UPDATE dbo.[Journal_Types]
			SET
				JournalType=@JournalType,
				icon=@icon,
				IsEnabled = @IsEnabled,
				AppliesToProfile = @AppliesToProfile,
				AppliesToGroup = @AppliesToGroup,
				AppliesToStream = @AppliesToStream,
				Options = @options,
				SupportsNotify = @SupportsNotify
			WHERE
				PortalId = @PortalId AND JournalTypeId = @JournalTypeId
	END
ELSE
	BEGIN
		SET @JournalTypeId = (SELECT MAX(JournalTypeId)+1 FROM dbo.[Journal_Types])
		INSERT INTO dbo.[Journal_Types]
			(JournalTypeId, JournalType, icon, PortalId, IsEnabled, AppliesToProfile, AppliesToGroup, AppliesToStream, Options, SupportsNotify)
			VALUES
			(@JournalTypeId, @JournalType, @icon, @PortalId, @IsEnabled, @AppliesToProfile, @AppliesToGroup, @AppliesToStream, @options, @SupportsNotify)
	END
SELECT @JournalTypeId
GO
