CREATE TABLE [dbo].[ContentTypes_DataTypes]
(
[DataTypeID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[UnderlyingDataType] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL CONSTRAINT [DF_ContentTypes_DataTypes_CreatedByUserID] DEFAULT ((-1)),
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_DataTypes_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL CONSTRAINT [DF_ContentTypes_DataTypes_LastModifiedByUserID] DEFAULT ((-1)),
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_DataTypes_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_DataTypes] ADD CONSTRAINT [PK_ContentTypes_DataTypes] PRIMARY KEY CLUSTERED  ([DataTypeID]) ON [PRIMARY]
GO
