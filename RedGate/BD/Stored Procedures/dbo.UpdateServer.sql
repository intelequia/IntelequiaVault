SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateServer]
    @ServerID           INT,
    @URL                NVARCHAR(255),
    @UniqueId           NVARCHAR(200),
    @Enabled            BIT,
    @Group              NVARCHAR(200)
AS
    UPDATE dbo.WebServers
        SET 
            URL = @URL,
            UniqueId = @UniqueId,
            Enabled = @Enabled,
            ServerGroup = @Group
        WHERE  ServerID = @ServerID
GO
