/*
Beantwortet folgende Fragen und dokumentiert die Abfragesyntax dazu f?r die Aufl?sung:

o Welche Werte sind inkonsistent im Dataset geography in den Spalten Country und State und 
wie ist die Anzahl der Datens?tze gruppiert nach den unterschiedlichen Werten?

o Welche Datumsbereiche enthalten die rides von CSV bzw. rides von Parquet?
*/


--Welche Werte sind inkonsistent im Dataset geography in den Spalten Country und State und 
-- wie ist die Anzahl der Datens?tze gruppiert nach den unterschiedlichen Werten?

select state, count(*) as counts
FROM [serverless].[ext].[DimGeoRaw]
group by state

go

select country, count(*) as counts
FROM [serverless].[ext].[DimGeoRaw]
group by country






