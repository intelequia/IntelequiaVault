CREATE TABLE [dbo].[Schedule]
(
[ScheduleID] [int] NOT NULL IDENTITY(1, 1),
[TypeFullName] [varchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[TimeLapse] [int] NOT NULL,
[TimeLapseMeasurement] [varchar] (2) COLLATE Modern_Spanish_CI_AS NOT NULL,
[RetryTimeLapse] [int] NOT NULL,
[RetryTimeLapseMeasurement] [varchar] (2) COLLATE Modern_Spanish_CI_AS NOT NULL,
[RetainHistoryNum] [int] NOT NULL,
[AttachToEvent] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CatchUpEnabled] [bit] NOT NULL,
[Enabled] [bit] NOT NULL,
[ObjectDependencies] [varchar] (300) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Servers] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[FriendlyName] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[ScheduleStartDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED  ([ScheduleID]) ON [PRIMARY]
GO
