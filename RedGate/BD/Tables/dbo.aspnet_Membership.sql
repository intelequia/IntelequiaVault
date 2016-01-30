CREATE TABLE [dbo].[aspnet_Membership]
(
[ApplicationId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[Password] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PasswordFormat] [int] NOT NULL CONSTRAINT [DF__aspnet_Me__Passw__0BD1B136] DEFAULT ((0)),
[PasswordSalt] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[MobilePIN] [nvarchar] (16) COLLATE Modern_Spanish_CI_AS NULL,
[Email] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[LoweredEmail] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[PasswordQuestion] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[PasswordAnswer] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NULL,
[IsApproved] [bit] NOT NULL,
[IsLockedOut] [bit] NOT NULL,
[CreateDate] [datetime] NOT NULL,
[LastLoginDate] [datetime] NOT NULL,
[LastPasswordChangedDate] [datetime] NOT NULL,
[LastLockoutDate] [datetime] NOT NULL,
[FailedPasswordAttemptCount] [int] NOT NULL,
[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
[Comment] [ntext] COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [PK__aspnet_M__1788CC4D6E373E98] PRIMARY KEY NONCLUSTERED  ([UserId]) ON [PRIMARY]

GO

CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] ([ApplicationId], [LoweredEmail]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__Appli__09E968C4] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__UserI__0ADD8CFD] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
