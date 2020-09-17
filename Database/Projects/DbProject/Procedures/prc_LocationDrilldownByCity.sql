/*
DECLARE @StateCode VARCHAR(100);
DECLARE @CityName VARCHAR(100);
DECLARE @IsWildcardSearch BIT = 1;


SET @StateCode = NULL;
--SET @StateCode = '';
--SET @StateCode = '  ';
--SET @StateCode = 'CA';
--SET @StateCode = ' CA ';
--SET @StateCode = 'xxx';
--SET @StateCode = ' CA ';

SET @CityName = NULL;
--SET @CityName = '';
--SET @CityName = '  ';
--SET @CityName = 'Fremont';
--SET @CityName = ' Fremont ';
--SET @CityName = 'xxx';
--SET @CityName = ' Fre ';

EXEC dbo.prc_LocationDrilldownByCity @StateCode, @CityName, @IsWildcardSearch
*/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_LocationDrilldownByCity')
	BEGIN
		PRINT 'Dropping dbo.prc_LocationDrilldownByCity...';
		DROP PROCEDURE dbo.prc_LocationDrilldownByCity;
		PRINT 'Dropped dbo.prc_LocationDrilldownByCity.';
	END
GO
PRINT 'Creating dbo.prc_LocationDrilldownByCity...'
GO
/**
	Query hierarchy of countries with following details: 
	- Continent ID
	- Continent Name
	- Country ID
	- Country Name
	- State ID
	- State Code
	- State Name
	- City ID
	- City Name
	- Office Location
	- Location Code
*/
CREATE PROCEDURE dbo.prc_LocationDrilldownByCity
(
	@StateCode			VARCHAR(100)		,
	@CityName			VARCHAR(100)		,
	@IsWildcardSearch	BIT		=	0		
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@StateCode=', @StateCode, '; @CityName=', @CityName, '; @IsWildcardSearch=', @IsWildcardSearch);

	DECLARE @TrimStateCode	VARCHAR(100)		=   RTRIM(LTRIM(@StateCode))	,
			@TrimCityName	VARCHAR(100)		=	RTRIM(LTRIM(@CityName))	
			;
	PRINT CONCAT('@TrimStateCode=', @TrimStateCode, '; @TrimCityName=', @TrimCityName);

	--IF @TrimStateCode IS NOT NULL AND @TrimStateCode != '' AND 
	IF ISNULL(@TrimStateCode, '') != '' AND ISNULL(@TrimCityName, '') != ''
		IF @IsWildcardSearch = 1
			SELECT	*
			FROM	dbo.v_LocationDrilldown d
			WHERE	d.StateCode LIKE CONCAT('%', @TrimStateCode, '%')
			AND		d.CityName	LIKE CONCAT('%', @TrimCityName, '%')
			;	
		ELSE
			SELECT	*
			FROM	dbo.v_LocationDrilldown d
			WHERE	d.StateCode =	@TrimStateCode
			AND		d.CityName  =	@TrimCityName
			;	
	ELSE
		IF ISNULL(@TrimStateCode, '') != '' AND ISNULL(@TrimCityName, '') = ''
			IF @IsWildcardSearch = 1
				SELECT	*
				FROM	dbo.v_LocationDrilldown d
				WHERE	d.StateCode LIKE CONCAT('%', @TrimStateCode, '%')
				;	
			ELSE
				SELECT	*
				FROM	dbo.v_LocationDrilldown d
				WHERE	d.StateCode =	@TrimStateCode
				;	
		ELSE
			IF ISNULL(@TrimStateCode, '') = '' AND ISNULL(@TrimCityName, '') != ''
				IF @IsWildcardSearch = 1
					SELECT	*
					FROM	dbo.v_LocationDrilldown d
					WHERE	d.CityName	LIKE CONCAT('%', @TrimCityName, '%')
					;	
				ELSE
					SELECT	*
					FROM	dbo.v_LocationDrilldown d
					WHERE	d.CityName	= @TrimCityName
					;	
			ELSE
				SELECT	*
				FROM	dbo.v_LocationDrilldown d
				;
END
