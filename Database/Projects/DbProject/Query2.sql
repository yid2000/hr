IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_LocationDrilldown')
	BEGIN
		PRINT 'Dropping dbo.v_LocationDrilldown...';
		DROP VIEW dbo.v_LocationDrilldown ;		
		PRINT 'Dropped dbo.v_LocationDrilldown.';
	END
GO
PRINT 'Creating dbo.v_LocationDrilldown...'
GO

/**
	Query hierarchy of countries with following details: use LEFT JOIN, changed again
	- Continent ID
	- Continent Name
	- Country ID
	- Country Name
	- State ID
	- State Code
	- State Name
	- City ID
	- City Name
*/
CREATE VIEW dbo.v_LocationDrilldown AS
SELECT  cn.ID		AS ContinentID		,
		cn.Name		AS ContinentName	,
		cu.ID		AS CountryID		,
		cu.Name		AS CountryName		,
		st.ID		AS StateID			,
		st.Code		AS StateCode		,
		st.Name     AS StateName		,
		c.ID		AS CityID			,
		c.Name		AS CityName	
FROM  dbo.Continent cn
LEFT JOIN dbo.Country cu
	ON cn.ID	=	cu.ContinentID
LEFT JOIN dbo.State st
	ON cu.ID	=	st.CountryID
LEFT JOIN dbo.City c
	ON c.StateID		=	st.ID 

