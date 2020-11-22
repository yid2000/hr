DECLARE @CityName VARCHAR(100);
SET @CityName = '';

SELECT	*
FROM	dbo.v_LocationDrilldown d
WHERE	d.CityName	=	@CityName