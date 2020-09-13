--SELECT * FROM dbo.TFN_SplitInt('1,2,3,4,5');
--GRANT SELECT ON dbo.TFN_SplitInt TO xxx;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TF' AND name = 'TFN_SplitInt')
	BEGIN
		PRINT 'Dropping dbo.TFN_SplitInt...';
		DROP FUNCTION dbo.TFN_SplitInt ;
		PRINT 'Dropped dbo.TFN_SplitInt.';
	END
GO
PRINT 'Creating dbo.TFN_SplitInt...'
GO
CREATE FUNCTION dbo.TFN_SplitInt
(
    @StringVal		NVARCHAR(MAX)		--,
    --@Delimiter		NVARCHAR(1)		=	','
)
RETURNS @RtnValue TABLE
(
    --Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    Data INT NOT NULL
)
AS
BEGIN
    IF @StringVal IS NULL RETURN

	DECLARE @Delimiter	NVARCHAR(1)		=	',';
    DECLARE @split_on_len INT = LEN(@Delimiter)
    DECLARE @start_at INT = 1
    DECLARE @end_at INT
    DECLARE @data_len INT

    WHILE 1=1
    BEGIN
        SET @end_at = CHARINDEX(@Delimiter,@StringVal,@start_at)
        SET @data_len = CASE @end_at WHEN 0 THEN LEN(@StringVal) ELSE @end_at-@start_at END
        INSERT INTO @RtnValue (data) VALUES(CAST(SUBSTRING(@StringVal,@start_at,@data_len) AS INT));
        IF @end_at = 0 BREAK;
        SET @start_at = @end_at + @split_on_len
    END

    RETURN
END
GO