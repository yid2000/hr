--SELECT * FROM dbo.TFN_SplitString('A1,B1,C1,D1');
--GRANT SELECT ON dbo.TFN_SplitString TO xxx;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TF' AND name = 'TFN_SplitString')
	BEGIN
		PRINT 'Dropping dbo.TFN_SplitString...';
		DROP FUNCTION dbo.TFN_SplitString ;
		PRINT 'Dropped dbo.TFN_SplitString.';
	END
GO
PRINT 'Creating dbo.TFN_SplitString...'
GO
CREATE FUNCTION dbo.TFN_SplitString
(
    @StringVal		NVARCHAR(MAX)		--,
    --@Delimiter		NVARCHAR(1)		=	','
)
RETURNS @RtnValue table
(
    --Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    Data NVARCHAR(100) NOT NULL
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
        INSERT INTO @RtnValue (data) VALUES( SUBSTRING(@StringVal,@start_at,@data_len) );
        IF @end_at = 0 BREAK;
        SET @start_at = @end_at + @split_on_len
    END

    RETURN
END