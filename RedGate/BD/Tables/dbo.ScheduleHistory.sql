CREATE TABLE [dbo].[ScheduleHistory]
(
[ScheduleHistoryID] [int] NOT NULL IDENTITY(1, 1),
[ScheduleID] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NULL,
[Succeeded] [bit] NULL,
[LogNotes] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
[NextStart] [datetime] NULL,
[Server] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScheduleHistory] ADD CONSTRAINT [PK_ScheduleHistory] PRIMARY KEY CLUSTERED  ([ScheduleHistoryID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScheduleHistory_NextStart] ON [dbo].[ScheduleHistory] ([ScheduleID], [NextStart] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScheduleHistory_StartDate] ON [dbo].[ScheduleHistory] ([ScheduleID], [StartDate] DESC) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScheduleHistory] WITH NOCHECK ADD CONSTRAINT [FK_ScheduleHistory_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]) ON DELETE CASCADE
GO
