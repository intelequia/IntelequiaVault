SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddException]
	@ExceptionHash varchar(100),
	@Message nvarchar(500),
	@StackTrace nvarchar(max),
	@InnerMessage nvarchar(500),
	@InnerStackTrace nvarchar(max),
	@Source nvarchar(500)
AS

IF NOT EXISTS (SELECT * FROM dbo.[Exceptions] WHERE ExceptionHash=@ExceptionHash)
INSERT INTO dbo.[Exceptions]
	(ExceptionHash,
	Message,
	StackTrace,
	InnerMessage,
	InnerStackTrace,
	Source)
VALUES
	(@ExceptionHash,
	@Message,
	@StackTrace,
	@InnerMessage,
	@InnerStackTrace,
	@Source)
GO
