SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItemsByTerm]
 @Term nvarchar(250)
AS
BEGIN
DECLARE @TermID int
  , @TermLeft int
  , @TermRight int
  , @VocabularyID int

 SELECT
  @TermID = TermID
  , @TermLeft = TermLeft
  , @TermRight = TermRight
  , @VocabularyID = VocabularyID
 FROM
  dbo.Taxonomy_Terms
 WHERE
  Name = @Term

 IF @TermLeft = 0 AND @TermRight = 0
 BEGIN
  -- Simple Term
  SELECT c.*
  FROM dbo.ContentItems As c
   INNER JOIN dbo.ContentItems_Tags ct ON ct.ContentItemID = c.ContentItemID
   INNER JOIN dbo.Taxonomy_Terms t ON t.TermID = ct.TermID
  WHERE t.TermID = @TermID
 END ELSE BEGIN
  -- Hierarchical Term
  SELECT c.*
  FROM dbo.ContentItems As c
   INNER JOIN dbo.ContentItems_Tags ct ON ct.ContentItemID = c.ContentItemID
   INNER JOIN dbo.Taxonomy_Terms t ON t.TermID = ct.TermID
  WHERE t.TermLeft >= @TermLeft
   AND t.TermRight <= @TermRight
   AND t.VocabularyID = @VocabularyID
 END
END
GO
