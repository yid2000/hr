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

SELECT  cn.ID			AS ContinentID		,
		cn.Name			AS ContinentName	,
		cu.ID			AS CountryID		,
		cu.Name			AS CountryName		,
		st.ID			AS StateID			,
		st.Code			AS StateCode		,
		st.Name			AS StateName		,
		c.ID			AS CityID			,
		c.Name			AS CityName			,
		ol.ID			AS LocationID		,
		ol.Code			AS LocationCode		,
		ol.Description	AS LocationName	
FROM  dbo.Continent cn
INNER JOIN dbo.Country cu
	ON cn.ID	=	cu.ContinentID
INNER JOIN dbo.State st
	ON cu.ID	=	st.CountryID
INNER JOIN dbo.City c
	ON c.StateID		=	st.ID 
INNER JOIN dbo.OfficeLocation ol
	ON c.ID		=	ol.CityID 
ORDER BY cn.ID
