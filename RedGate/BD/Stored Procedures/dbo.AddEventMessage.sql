SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddEventMessage]

	@EventName nvarchar(100),
	@Priority int,
	@ProcessorType nvarchar(250),
	@ProcessorCommand nvarchar(250),
	@Body nvarchar(250),
	@Sender nvarchar(250),
	@Subscriber nvarchar(100),
	@AuthorizedRoles nvarchar(250),
	@ExceptionMessage nvarchar(250),
	@SentDate datetime,
	@ExpirationDate datetime,
	@Attributes ntext

AS
	INSERT dbo.EventQueue	(
			EventName,
			Priority,
			ProcessorType,
			ProcessorCommand,
			Body,
			Sender,
			Subscriber,
			AuthorizedRoles,
			ExceptionMessage,
			SentDate,
			ExpirationDate,
			Attributes
		)
		VALUES	(
			@EventName,
			@Priority,
			@ProcessorType,
			@ProcessorCommand,
			@Body,
			@Sender,
			@Subscriber,
			@AuthorizedRoles,
			@ExceptionMessage,
			@SentDate,
			@ExpirationDate,
			@Attributes
		)

	SELECT SCOPE_IDENTITY()
GO
