
--widok to zapytanie do bazy danych zapisane pod jakąś nazwą

SELECT GNP as PKB,
  Name as kraj,
  continent as kontynent,
  population as populacja,
  SurfaceArea as powierzchnia,
  LifeExpectancy as DlugoscZycia 
  FROM `country`;

SELECT 
	GNP as PKB,
	Name as kraj, 
	continent as kontynent, 
	population as populacja, 
	SurfaceArea as powierzchnia, 
	LifeExpectancy as DlugoscZycia 
FROM 
	`country`
order by PKB DESC;

CREATE VIEW pozycjaPKB as
  SELECT 
	  GNP as PKB,
	  Name as kraj, 
	  continent as kontynent, 
	  population as populacja, 
	  SurfaceArea as powierzchnia, 
	  LifeExpectancy as DlugoscZycia 
  FROM 
  	`country`
  order by PKB DESC;

SELECT PKB,kraj FROM `pozycjapkb`

CREATE view miasta AS
	SELECT 	
    	Name as nazwa,
        CountryCode as kodKraju,
        District as dystrykt,
        population as populacja
	from city
    order by name
