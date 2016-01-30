SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[DeleteVendorClassifications]

@VendorId  int

as

delete
from dbo.VendorClassification
where  VendorId = @VendorId
GO
